#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
from sensor_msgs.msg import Image, CameraInfo
from geometry_msgs.msg import Point, PoseStamped
from std_msgs.msg import Bool
from cv_bridge import CvBridge
import tf2_ros
import tf2_geometry_msgs
import numpy as np
from image_geometry import PinholeCameraModel

class PixelTo3DNode:
    def __init__(self):
        rospy.init_node('target_pixel_to_3d', anonymous=True)
        self.bridge = CvBridge()

        # 相机模型
        self.cam_model = PinholeCameraModel()
        self.camera_info_received = False

        # 像素缓存
        self.latest_uv = None

        # 可见性状态
        self.visible = False
        self.prev_visible = False

        # TF
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        # 订阅
        rospy.Subscriber("/mobile_base/zed2_front/depth/camera_info", CameraInfo, self.camera_info_callback, queue_size=1)
        rospy.Subscriber("/mobile_base/zed2_front/depth/depth_registered", Image, self.depth_callback, queue_size=1)
        rospy.Subscriber("/target_person/pixel", Point, self.pixel_callback, queue_size=1)
        rospy.Subscriber("/target_person/visible", Bool, self.visible_callback, queue_size=1)

        # 发布
        self.pub_pose = rospy.Publisher("/target_person/pose", PoseStamped, queue_size=1)

        rospy.loginfo("✅ target_pixel_to_3d 节点启动")

    def camera_info_callback(self, msg):
        if not self.camera_info_received:
            self.cam_model.fromCameraInfo(msg)
            self.camera_info_received = True
            #rospy.loginfo("✅ 相机内参已接收")

    def pixel_callback(self, msg):
        self.latest_uv = (int(msg.x), int(msg.y))

    def visible_callback(self, msg):
        self.prev_visible = self.visible
        self.visible = msg.data
        if not self.visible and self.prev_visible:
            rospy.logwarn("⚠️ 目标丢失，暂停坐标发布")
        elif self.visible and not self.prev_visible:
            rospy.loginfo("🎯 目标重新出现，恢复坐标发布")

    def depth_callback(self, msg):
        if not self.camera_info_received or self.latest_uv is None or not self.visible:
            return

        try:
            depth_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='32FC1')
            u, v = self.latest_uv
            if not (0 <= u < depth_image.shape[1] and 0 <= v < depth_image.shape[0]):
                rospy.logwarn("❌ 像素点超出图像范围")
                return

            z = float(depth_image[v, u])
            if np.isnan(z) or z <= 0.1:
                rospy.logwarn("❌ 深度值无效 z=%.3f" % z)
                return

            #输出原始深度值用于debug
            # rospy.loginfo_throttle(1.0, "[Raw Depth] z=%.3f (at uv=(%d,%d))", z, u, v)

            # 相机坐标系下坐标
            x_ray, y_ray, z_ray = self.cam_model.projectPixelTo3dRay((u, v))
            scale = z / z_ray
            pt_camera = np.array([x_ray * scale, y_ray * scale, z])
            head_offset_x = 0.711123
            pt_camera[0] -= head_offset_x
            # 构建 PoseStamped
            pose_cam = PoseStamped()
            pose_cam.header.stamp = rospy.Time.now()
            pose_cam.header.frame_id = msg.header.frame_id
            pose_cam.pose.position.x = pt_camera[0]
            pose_cam.pose.position.y = pt_camera[1]
            pose_cam.pose.position.z = pt_camera[2]
            pose_cam.pose.orientation.w = 1.0

            # 坐标转换：camera → base_link
            try:
                transform = self.tf_buffer.lookup_transform(
                    "base_link", msg.header.frame_id,
                    rospy.Time(0), rospy.Duration(0.2)
                )
                pose_base = tf2_geometry_msgs.do_transform_pose(pose_cam, transform)
                pose_base.header.stamp = rospy.Time.now()
                pose_base.header.frame_id = "base_link"

                self.pub_pose.publish(pose_base)
                rospy.loginfo_throttle(
                    1.0,
                    "📍 发布目标人 3D 坐标：x=%.2f y=%.2f z=%.2f",
                    pose_base.pose.position.x,
                    pose_base.pose.position.y,
                    pose_base.pose.position.z
                )
            except Exception as e:
                rospy.logwarn("⚠️ tf 转换失败: %s", str(e))

        except Exception as e:
            rospy.logerr("❌ 深度图处理失败: %s", str(e))

if __name__ == '__main__':
    try:
        PixelTo3DNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass



