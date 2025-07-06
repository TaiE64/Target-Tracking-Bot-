#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import os
sys.path.append(os.path.dirname(__file__))  # 让 Python 找到 reid.p
import os
import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from std_msgs.msg import Bool
from cv_bridge import CvBridge
import cv2
import torch
import glob
from ultralytics import YOLO
from deep_sort_realtime.deepsort_tracker import DeepSort
from reid import ReID  # 你需要实现 extract() 接口
from torch.nn.functional import cosine_similarity


class YOLODeepSortReIDNode:
    def __init__(self):
        self.bridge = CvBridge()
        self.model = YOLO('yolov8n.pt')  # YOLO 模型

        self.reid = ReID()
        self.user_feats = []

        self.min_conf = 0.5
        self.min_reid_score = 0.68

        # === 加载 user*.jpg 图像特征 ===
        user_imgs = sorted(glob.glob(os.path.join(os.path.dirname(__file__), 'user*.jpg')))
        for img_path in user_imgs:
            img = cv2.imread(img_path)
            if img is not None:
                feat = self.reid.extract(img)
                self.user_feats.append(feat)
                rospy.loginfo(f"✅ 加载用户图像: {img_path}")
        if not self.user_feats:
            rospy.logerr("❌ 没有加载到任何用户图像")
            exit(1)

        # === 初始化 DeepSort 跟踪器 ===
        self.tracker = DeepSort(max_age=30, n_init=3, max_cosine_distance=0.4, embedder="torchreid")

        self.target_id = None

        self.pub_target_pixel = rospy.Publisher("/target_person/pixel", Point, queue_size=1)
        self.pub_visible = rospy.Publisher("/target_person/visible", Bool, queue_size=1)

        rospy.Subscriber("/zed2i/zed_node/rgb/image_rect_color", Image, self.image_callback,
                         queue_size=1, buff_size=2 ** 24)

        rospy.loginfo("✅ YOLO + ReID 初始化 + DeepSort 跟踪器启动")

    def image_callback(self, msg):
        try:
            frame = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        except Exception as e:
            rospy.logerr("CVBridge error: %s", str(e))
            return

        results = self.model(frame, verbose=False)[0]

        detections = []  # 每个元素: (xyxy, conf, class_id)
        candidates = []  # 用于后续 ReID

        for box in results.boxes:
            cls_id = int(box.cls[0])
            conf = float(box.conf[0])
            if cls_id != 0 or conf < self.min_conf:
                continue
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            detections.append(([x1, y1, x2, y2], conf, "person"))
            candidates.append((x1, y1, x2, y2))

        tracks = self.tracker.update_tracks(detections, frame=frame)

        matched = False

        for track in tracks:
            if not track.is_confirmed():
                continue

            track_id = track.track_id
            l, t, r, b = track.to_ltrb()

            if self.target_id is None:
                # === 初始识别：ReID 与 user 特征对比 ===
                crop = frame[int(t):int(b), int(l):int(r)]
                if crop.size == 0:
                    continue
                try:
                    feat = self.reid.extract(crop)
                    score = max([cosine_similarity(feat, user_feat, dim=0).item() for user_feat in self.user_feats])
                    if score > self.min_reid_score:
                        self.target_id = track_id
                        rospy.loginfo(f"🎯 目标锁定: ID={track_id}, 相似度={score:.2f}")
                except Exception as e:
                    rospy.logwarn("ReID 特征提取失败: %s", str(e))

            if track_id == self.target_id:
                cx = int((l + r) / 2)
                cy = int(t + 0.5 * (b - t))
                pt = Point(x=cx, y=cy, z=0)
                self.pub_target_pixel.publish(pt)
                self.pub_visible.publish(Bool(data=True))

                cv2.rectangle(frame, (int(l), int(t)), (int(r), int(b)), (0, 255, 0), 2)
                cv2.putText(frame, f"Target ID {track_id}", (int(l), int(t) - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
                cv2.drawMarker(frame, (cx, cy), (0, 0, 255), markerType=cv2.MARKER_CROSS, markerSize=10, thickness=2)
                matched = True

        if not matched:
            self.pub_visible.publish(Bool(data=False))
            rospy.logwarn_throttle(2.0, "⚠️ 当前帧未跟踪到目标")

        cv2.imshow("YOLO + ReID + DeepSort", frame)
        cv2.waitKey(1)


if __name__ == '__main__':
    rospy.init_node('yolo_deepsort_node', anonymous=True)
    try:
        YOLODeepSortReIDNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        cv2.destroyAllWindows()
