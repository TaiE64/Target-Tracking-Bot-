#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import os
sys.path.append(os.path.dirname(__file__))  # 让 Python 找到 reid.py

import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from cv_bridge import CvBridge
import cv2
import glob
import torch
from torch.nn.functional import cosine_similarity
from ultralytics import YOLO
from reid import ReID  # reid.py
from std_msgs.msg import Bool

class YOLOVisionNode:
    def __init__(self):
        self.bridge = CvBridge()
        self.model = YOLO('yolov8n.pt')  # 可改为 yolov8s.pt

        # === 初始化 ReID 模块并加载多张 user 图像 ===
        self.reid = ReID()
        self.user_feats = []

        user_dir = os.path.dirname(__file__)
        user_imgs = sorted(glob.glob(os.path.join(user_dir, "user*.jpg")))  # 自动加载所有 user*.jpg


        self.min_conf = 0.5        # YOLO 置信度门限
        self.min_reid_score = 0.68  # ReID 相似度门限


        for img_path in user_imgs:
            img = cv2.imread(img_path)
            if img is not None:
                feat = self.reid.extract(img)
                self.user_feats.append(feat)
                rospy.loginfo(f"✅ 加载用户图像: {os.path.basename(img_path)}")
            else:
                rospy.logwarn(f"❌ 无法读取: {img_path}")

        if not self.user_feats:
            rospy.logerr("❌ 没有加载到任何用户图像，请确保存在 user*.jpg")
            exit(1)

        # === 发布目标人的像素中心点 ===
        self.pub_target_pixel = rospy.Publisher(
            "/target_person/pixel", Point, queue_size=1
        )

        # === 订阅图像 ===
        rospy.Subscriber(
            "/mobile_base/zed2_front/left_raw/image_raw_color",
            Image,
            self.image_callback,
            queue_size=1,
            buff_size=2**24
        )

        self.pub_visible = rospy.Publisher("/target_person/visible", Bool, queue_size=1)

        self.prev_uv = None  # 初始化前一帧像素点缓存
        rospy.loginfo("✅ YOLO + ReID 节点已启动")

# 从图像中检测所有人，用 ReID 比对“最像注册用户”的人，并在图像中只给这个人画框。
    def image_callback(self, msg):
        try:
            frame = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        except Exception as e:
            rospy.logerr("CVBridge error: %s", str(e))
            return

        results = self.model(frame, verbose=False)[0]
        best_score = -1
        best_box = None
        best_conf = 0.0

        for box in results.boxes:
            cls_id = int(box.cls[0])
            conf = float(box.conf[0])
            if cls_id != 0 or conf < self.min_conf:
                continue

            x1, y1, x2, y2 = map(int, box.xyxy[0])
            person_crop = frame[y1:y2, x1:x2]
            if person_crop.size == 0:
                continue

            try:
                feat = self.reid.extract(person_crop)
                score = max([
                    cosine_similarity(feat, user_feat, dim=0).item()
                    for user_feat in self.user_feats
                ])
                if score > best_score:
                    best_score = score
                    best_box = (x1, y1, x2, y2)
                    best_conf = conf
            except Exception as e:
                rospy.logwarn("ReID 提特征失败: %s", str(e))

        # 处理结果
        if best_box and best_score > self.min_reid_score and best_conf > self.min_conf:
            x1, y1, x2, y2 = best_box
            u = int((x1 + x2) / 2)
            v = int(y1 + 0.10 * (y2 - y1)) 


            pt = Point()
            pt.x = u
            pt.y = v
            pt.z = 0
            self.pub_target_pixel.publish(pt)
            self.pub_visible.publish(Bool(data=True))  # ✅ 目标可见

            # 可视化
            cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
            cv2.putText(frame, f"Target ({best_score:.2f})", (x1, y1 - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
            cv2.drawMarker(frame, (u, v), (0, 0, 255),
                        markerType=cv2.MARKER_CROSS, markerSize=10, thickness=2)
        else:
            self.pub_visible.publish(Bool(data=False))  # ❗ 目标丢失
            rospy.logwarn_throttle(2.0, "⚠️ ReID 或置信度低，目标丢失")

        cv2.imshow("YOLO + ReID", frame)
        cv2.waitKey(1)

if __name__ == '__main__':
    rospy.init_node('yolo_reid_node', anonymous=True)
    try:
        YOLOVisionNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        cv2.destroyAllWindows()