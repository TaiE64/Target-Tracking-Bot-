#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import numpy as np
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import PoseStamped, Twist

class APFNavigator:
    def __init__(self):
        rospy.init_node("apf_navigator")

        # 超参数 (支持 ROS 参数服务器)
        self.k_att = rospy.get_param("~k_att", 2.0)
        self.k_rep = rospy.get_param("~k_rep", 8.0)
        self.k_rot = rospy.get_param("~k_rot", 1.0)      # 旋转斥力增益
        self.d_safe = rospy.get_param("~d_safe", 1.5)    # 安全距离
        self.alpha = rospy.get_param("~alpha", 1.0)
        self.D_se = rospy.get_param("~D_se", 1.7)
        self.D_s = rospy.get_param("~D_s", 3.0)
        self.v_c = rospy.get_param("~v_c", 0.8)
        self.w_max = rospy.get_param("~w_max", 2.5)
        self.k_w = rospy.get_param("~k_w", 1.0)

        self.target_pos = None
        self.obstacles = []

        # 订阅目标位置（相对机器人 base_link）
        rospy.Subscriber("/target_person/estimated_pose", PoseStamped, self.target_callback)
        # 订阅雷达数据
        rospy.Subscriber("/camera/scan/front", LaserScan, self.scan_callback)
        # 发布速度控制指令
        self.cmd_pub = rospy.Publisher("/antobot_safety/cmd_vel", Twist, queue_size=1)

        rospy.Timer(rospy.Duration(0.1), self.control_loop)
        rospy.loginfo("✅ APF导航器已启动")

    def wrap_to_pi(self, angle):
        return np.arctan2(np.sin(angle), np.cos(angle))

    def target_callback(self, msg):
        self.target_pos = np.array([msg.pose.position.x, msg.pose.position.y])

    def scan_callback(self, msg):
        self.obstacles = []
        angle = msg.angle_min
        for r in msg.ranges:
            if np.isfinite(r) and msg.range_min < r < msg.range_max:
                x = r * np.cos(angle)
                y = r * np.sin(angle)
                point = np.array([x, y])
                if self.target_pos is not None and np.linalg.norm(point - self.target_pos) < 0.5:
                    angle += msg.angle_increment
                    continue
                self.obstacles.append(point)
            angle += msg.angle_increment
        

    def control_loop(self, event):
        if self.target_pos is None:
            return

        # 吸引力
        F_att = self.k_att * self.target_pos
        # 径向斥力与旋转斥力
        F_rep_radial = np.zeros(2)
        F_rep_rot = np.zeros(2)

        for obs in self.obstacles:
            diff = -obs
            dist = np.linalg.norm(diff)
            if 1e-2 < dist < self.d_safe:
                # 径向斥力
                F_rep_radial += self.k_rep * (1.0/dist - 1.0/self.d_safe) / (dist**3) * diff
                # 旋转（切向）斥力
                t = np.array([-diff[1], diff[0]]) / dist
                # 确定切向方向由目标方向决定
                if np.cross(diff, self.target_pos) > 0:
                    F_rep_rot += self.k_rot * t
                else:
                    F_rep_rot -= self.k_rot * t

        # Gf 缩放因子
        theta_h = np.arctan2(self.target_pos[1], self.target_pos[0])
        Gf = np.clip(abs(theta_h) / self.alpha, 0.0, 1.0)

        # 合力
        F_total = (1 - Gf) * (F_rep_radial + F_rep_rot) + Gf * F_att

        # 角速度映射
        angle = np.arctan2(F_total[1], F_total[0])
        angle = self.wrap_to_pi(angle)
        w = self.k_w * angle
        w = np.clip(w, -self.w_max, self.w_max)

        # 线速度映射
        d_h = np.linalg.norm(self.target_pos)
        if d_h >= self.D_s:
            v = self.v_c
        elif self.D_se < d_h < self.D_s:
            ratio = (d_h - self.D_se) / (self.D_s - self.D_se)
            ratio = np.clip(ratio, 0.0, 1.0)
            v = self.v_c * (ratio ** 2.5)
        else:
            v = 0.0

        # 发布指令
        cmd = Twist()
        cmd.linear.x = v
        cmd.angular.z = w
        self.cmd_pub.publish(cmd)
        rospy.loginfo_throttle(1.0, f"🚗 线速度: {v:.2f}, 角速度: {w:.2f}")

if __name__ == '__main__':
    try:
        APFNavigator()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
