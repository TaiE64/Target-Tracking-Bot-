#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
import torch
from ultralytics import YOLO
from deep_sort_realtime.deepsort_tracker import DeepSort
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from std_msgs.msg import Bool

class YOLOReIDTracker:
    def __init__(self):
        rospy.init_node("yolo_reid_tracker_node")

        # ROS
        self.bridge = CvBridge()
        self.pub_pixel = rospy.Publisher("/target_person/pixel", Point, queue_size=1)
        self.pub_visible = rospy.Publisher("/target_person/visible", Bool, queue_size=1)
        rospy.Subscriber("/mobile_base/zed2_front/left_raw/image_raw_color", Image, self.image_callback, queue_size=1)

        # Load YOLOv8
        self.detector = YOLO("yolov8n.pt")  # 可替换为 yolov8s.pt 等

        # Load DeepSort
        self.tracker = DeepSort(max_age=30)

        # Load ReID model and reference feature
        self.reid_model = torch.load("/path/to/your_reid_model.pt", map_location="gpu").eval()
        self.target_feature = self.extract_feature(cv2.imread("/path/to/target.jpg"))

        # 追踪目标 ID
        self.target_id = None

    def extract_feature(self, image):
        image = cv2.resize(image, (128, 256))
        image = image / 255.0
        image = image.transpose((2, 0, 1))
        tensor = torch.tensor(image, dtype=torch.float32).unsqueeze(0)
        with torch.no_grad():
            feat = self.reid_model(tensor).squeeze().numpy()
        return feat / np.linalg.norm(feat)

    def compute_similarity(self, feat1, feat2):
        return np.dot(feat1, feat2)

    def image_callback(self, msg):
        try:
            frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logwarn("cv_bridge error: %s", e)
            return

        results = self.detector.predict(source=frame, classes=[0], verbose=False)  # 人类检测
        boxes = results[0].boxes.xyxy.cpu().numpy().astype(int)
        confidences = results[0].boxes.conf.cpu().numpy()

        detections = []
        features = []

        for box, conf in zip(boxes, confidences):
            x1, y1, x2, y2 = box
            crop = frame[y1:y2, x1:x2]
            feat = self.extract_feature(crop)
            detections.append(([x1, y1, x2 - x1, y2 - y1], conf, feat))
            features.append(feat)

        tracks = self.tracker.update_tracks(detections, frame=frame)

        visible = False
        for track in tracks:
            if not track.is_confirmed():
                continue

            track_id = track.track_id
            ltrb = track.to_ltrb()
            x1, y1, x2, y2 = map(int, ltrb)
            cx, cy = int((x1 + x2) / 2), int((y1 + y2) / 2)

            if self.target_id is None:
                sim = self.compute_similarity(track.feature, self.target_feature)
                if sim > 0.7:
                    self.target_id = track_id
                    rospy.loginfo("锁定目标 ID: %d" % self.target_id)

            if self.target_id == track_id:
                self.pub_pixel.publish(Point(x=cx, y=cy, z=0))
                self.pub_visible.publish(Bool(data=True))
                visible = True
                cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(frame, f"ID:{track_id}", (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

        if not visible:
            self.pub_visible.publish(Bool(data=False))

        # Debug 显示窗口
        cv2.imshow("YOLO + ReID Tracking", frame)
        cv2.waitKey(1)

if __name__ == "__main__":
    try:
        YOLOReIDTracker()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
