import torch
import torch.nn.functional as F
import torchvision.transforms as T
import cv2
import os

# 安装 torchreid：只需一次
try:
    import torchreid
except ImportError:
    os.system('pip install torchreid')
    import torchreid

class ReID:
    def __init__(self):
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # === 构建并加载 osnet ReID 模型 ===
        self.model = torchreid.models.build_model(
            name='osnet_x1_0',
            num_classes=1000,
            pretrained=True
        )
        self.model.eval().to(self.device)

        # === 图像预处理 ===
        self.transform = T.Compose([
            T.ToPILImage(),
            T.Resize((256, 128)),
            T.ToTensor(),
            T.Normalize([0.485, 0.456, 0.406],
                        [0.229, 0.224, 0.225])
        ])

    def extract(self, image_bgr):
        """输入 BGR 图像，返回 L2 归一化的行人特征向量"""
        image_rgb = cv2.cvtColor(image_bgr, cv2.COLOR_BGR2RGB)
        input_tensor = self.transform(image_rgb).unsqueeze(0).to(self.device)

        with torch.no_grad():
            feat = self.model(input_tensor).squeeze(0)  # shape: [512]

        feat = F.normalize(feat, p=2, dim=0)  # L2 归一化
        return feat.cpu()  # 返回 CPU 上的特征
