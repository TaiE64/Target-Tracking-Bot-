#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import numpy as np
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from std_msgs.msg import Bool

class EKFTracker:
    def __init__(self):
        rospy.init_node("ekf_tracker_node", log_level=rospy.INFO)

        self.x = None  # 状态向量: [X_rel, Y_rel, Vx_rel, Vy_rel]
        self.P = np.eye(4) * 0.1
        self.H = np.array([[1, 0, 0, 0],
                           [0, 1, 0, 0]])
        self.Q = np.diag([0.1, 0.1, 0.5, 0.5])
        self.R_normal = np.diag([0.0001, 0.0001])
        self.R_lost = np.diag([5, 5])
        self.R = self.R_normal

        self.v_r = 0.0
        self.w_r = 0.0
        self.last_time = None
        self.visible = False
        self.lost_track = False

        # ➕ 观测历史缓存
        self.obs_history = []
        self.history_size = 3

        self.odom_sub = rospy.Subscriber("/odometry/filtered", Odometry, self.odom_callback)
        self.obs_sub = rospy.Subscriber("/target_person/pose", PoseStamped, self.obs_callback)
        self.visible_sub = rospy.Subscriber("/target_person/visible", Bool, self.visible_callback)
        self.filtered_pub = rospy.Publisher("/target_person/estimated_pose", PoseStamped, queue_size=1)

        self.predict_timer = rospy.Timer(rospy.Duration(0.1), self.periodic_predict)
        rospy.loginfo("✅ EKF跟踪器已初始化")
        rospy.Timer(rospy.Duration(1.0), self.check_connections)

    def visible_callback(self, msg):
        prev_visible = self.visible
        self.visible = msg.data

        if not self.visible and prev_visible:
            rospy.logwarn("⚠️ 目标丢失！进入纯预测模式")
            self.lost_track = True

            # ➕ 使用历史观测估算速度
            if len(self.obs_history) == 3:
                t1, x1, y1 = self.obs_history[0]
                t2, x2, y2 = self.obs_history[1]
                t3, x3, y3 = self.obs_history[2]

                dt1 = t2 - t1
                dt2 = t3 - t2
                if dt1 > 1e-3 and dt2 > 1e-3:
                    vx1 = (x2 - x1) / dt1
                    vx2 = (x3 - x2) / dt2
                    vy1 = (y2 - y1) / dt1
                    vy2 = (y3 - y2) / dt2
                    self.x[2, 0] = (vx1 + vx2) / 2
                    self.x[3, 0] = (vy1 + vy2) / 2
                    rospy.loginfo("📐 估算速度 vx=%.2f, vy=%.2f", self.x[2, 0], self.x[3, 0])

        elif self.visible and not prev_visible:
            rospy.loginfo("🎯 重新捕获目标！")
            self.lost_track = False

    def odom_callback(self, msg):
        self.v_r = msg.twist.twist.linear.x
        self.w_r = msg.twist.twist.angular.z

    def obs_callback(self, msg):
        if self.x is None:
            self._initialize_state(msg)
            return

        current_time = msg.header.stamp.to_sec()
        dt = current_time - self.last_time
        if dt <= 0 or dt > 1.0:
            dt = 0.1

        self._predict(dt)
        z = np.array([[msg.pose.position.x], [msg.pose.position.y]])
        self._update(z)
        self._publish_result(msg.header.stamp)

        # ➕ 添加观测历史
        self.obs_history.append((current_time, msg.pose.position.x, msg.pose.position.y))
        if len(self.obs_history) > self.history_size:
            self.obs_history.pop(0)

        self.last_time = current_time

    def periodic_predict(self, event):
        if self.x is None or self.last_time is None:
            return

        current_time = rospy.Time.now().to_sec()
        dt = current_time - self.last_time
        if dt <= 0:
            return
        if dt > 1.0:
            dt = 0.1

        # 根据 visible 动态调整观测协方差
        self.R = self.R_lost if not self.visible else self.R_normal

        self._predict(dt)
        self._publish_result(rospy.Time.now())
        self.last_time = current_time

    def _initialize_state(self, msg):
        self.x = np.array([
            [msg.pose.position.x],
            [msg.pose.position.y],
            [0.0],
            [0.0]
        ])
        self.last_time = msg.header.stamp.to_sec()
        rospy.loginfo("🚩 状态初始化完成 X=%.2fm, Y=%.2fm",
                      self.x[0, 0], self.x[1, 0])

    def _predict(self, dt):
        if abs(self.w_r) < 1e-5:
            dx = self.v_r * dt
            dy = 0.0
            dtheta = 0.0
        else:
            radius = self.v_r / self.w_r
            dtheta = self.w_r * dt
            dx = radius * np.sin(dtheta)
            dy = radius * (1 - np.cos(dtheta))

        cos_theta = np.cos(-dtheta)
        sin_theta = np.sin(-dtheta)
        T_inv = np.array([
            [cos_theta, -sin_theta],
            [sin_theta,  cos_theta]
        ])
        trans = np.array([[dx], [dy]])
        trans_inv = -T_inv @ trans

        self.x[0:2] = T_inv @ self.x[0:2] + trans_inv
        self.x[0] += self.x[2] * dt
        self.x[1] += self.x[3] * dt

        F = np.eye(4)
        F[0, 2] = dt
        F[1, 3] = dt
        self.P = F @ self.P @ F.T + self.Q

    def _update(self, z):
        y = z - self.H @ self.x
        S = self.H @ self.P @ self.H.T + self.R
        K = self.P @ self.H.T @ np.linalg.inv(S)
        self.x += K @ y
        self.P = (np.eye(4) - K @ self.H) @ self.P

    def _publish_result(self, timestamp):
        filtered_pose = PoseStamped()
        filtered_pose.header.stamp = timestamp
        filtered_pose.header.frame_id = "base_link"
        head_offset_x = 0.711123 # X coordinate of ZED2 front
        filtered_pose.pose.position.x = self.x[0, 0] - head_offset_x
        filtered_pose.pose.position.y = self.x[1, 0]
        filtered_pose.pose.orientation.w = 1.0
        self.filtered_pub.publish(filtered_pose)
        
    def check_connections(self, event):
        if self.obs_sub.get_num_connections() > 0:
            rospy.loginfo_once("🟢 Subscribed to /target_person/pose successfully.")
        else:
            rospy.logwarn_once("🔴 Waiting for /target_person/pose ...")

        if self.odom_sub.get_num_connections() > 0:
            rospy.loginfo_once("🟢 Subscribed to /odometry/filtered successfully.")
        else:
            rospy.logwarn_once("🔴 Waiting for /odometry/filtered ...")

        if self.filtered_pub.get_num_connections() > 0:
            rospy.loginfo_once("🟢 Publishing to /target_person/estimated_pose successfully.")
        else:
            rospy.logwarn_once("🟡 No subscribers to /target_person/estimated_pose yet.")

if __name__ == '__main__':
    try:
        EKFTracker()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

