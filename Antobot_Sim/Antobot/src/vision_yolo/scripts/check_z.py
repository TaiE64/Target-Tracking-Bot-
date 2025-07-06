#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Image
import numpy as np
import cv2
from cv_bridge import CvBridge

# 目标像素
u, v = 658, 285

def callback(msg):
    bridge = CvBridge()
    try:
        # 将 ROS Image 消息转换为 OpenCV 图像（32FC1 表示 float32 单通道图像）
        depth_image = bridge.imgmsg_to_cv2(msg, desired_encoding='32FC1')
    except Exception as e:
        rospy.logerr("转换失败: %s", e)
        return

    if v < depth_image.shape[0] and u < depth_image.shape[1]:
        depth = depth_image[v, u]
        rospy.loginfo(f"深度值 at (u={u}, v={v}): {depth:.4f} 米")
    else:
        rospy.logwarn("坐标超出图像范围")

def main():
    rospy.init_node('get_depth_at_pixel', anonymous=True)
    rospy.Subscriber('/mobile_base/zed2_front/depth/depth_registered', Image, callback)
    rospy.spin()

if __name__ == '__main__':
    main()

