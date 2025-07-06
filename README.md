# Target Tracking Bot  
This project aims to develop a mobile robotic system with autonomous person-following and obstacle avoidance capabilities.  
The system is designed to reliably identify and continuously track a designated individual in complex environments, while intelligently avoiding both static and dynamic obstacles.  
Built on a modular ROS architecture, the system is easy to deploy and extend, making it suitable for applications such as service robotics, security patrol, and airport guidance.  
UCL Robotics&Artificial Intelligence Year 2 Term 3 Industrial Project.  
## 🎬 Demo

![Demo](demo.gif)

  
## 📁 Project Structure

The `src/` directory contains both **custom-developed packages** for target following and **external dependencies** cloned from [AntobotSDK GitHub repositories](https://github.com/Antobot/AntobotSDK).

```bash
Antobot/
    ├── src/
    │   ├── apf_navigator/       # [Custom] APF-based local navigation module
    │   ├── ekf_tracker/         # [Custom] EKF-based target state estimation
    │   ├── vision_yolo/         # [Custom] YOLOv8 + ReID + DeepSORT visual tracking
    │   ├── AntobotSDK/          # [External] Official Antobot SDK for robot control
    │   ├── geonav_transform/    # [External] Geo-navigation transform utilities
    │   ├── ros-imu-bno055/      # [External] BNO055 IMU driver
    │   ├── zed_interfaces/      # [External] ZED camera ROS interface
    │   ├── zed-ros-wrapper/     # [External] ZED camera full ROS wrapper
    │   └── CMakeLists.txt       # CMake build configuration
```

> ✅ Custom packages: `apf_navigator`, `ekf_tracker`, `vision_yolo`  
> 📦 External dependencies cloned from AntobotSDK and device vendors

## 🧪 Simulation  

### 🔧 Build the workspace

Make sure you're in the root of the workspace (e.g., `~/Antobot_Sim`) and build using:

```bash
catkin_make_isolated
source devel_isolated/setup.bash
```

### 🚀 Launch the simulation

In separate terminals, run the following commands **in order**:

```bash
# 1. Launch the robot simulation environment
roslaunch antobot_gazebo windsor_ant_v3.launch

# 2. Start the visual tracking module (YOLO + ReID + DeepSORT)
roslaunch vision_yolo Re_ID.launch

# 3. Start the EKF-based target state estimation
roslaunch ekf_tracker ekf_tracker.launch

# 4. Launch the APF-based local navigation controller
roslaunch apf_navigator apf_navigator.launch
```


