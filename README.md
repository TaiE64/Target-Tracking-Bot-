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

The simulation environment is included in the `Antobot_Sim.zip` package.

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

## 🐞 Known Issue: APF Angular Velocity NaN

In the `apf_navigator` module, the angular velocity (`omega`) occasionally becomes `NaN`, which can affect robot movement.

### 📌 Root Cause

The issue occurs when computing:

```python
omega = np.arctan2(F_y, F_x)
```

`NaN` arises if both `F_x` and `F_y` are invalid (`NaN`, `inf`, or exactly `0`).

### 🧠 Possible Reasons

- **Total force `F_total` is zero**  
  - Rare, but can happen when all attractive and repulsive forces cancel out.
  
- **`self.target_pos` is NaN**  
  - Caused by invalid conversion from pixel coordinates to 3D space.  
  - ✅ Already mitigated by using the **last valid depth** when depth data is `NaN`.

- **Repulsive force explosion**  
  - May result from division by zero (e.g., when obstacle distance is nearly zero).

---

### 🛠️ Temporary Fix

Currently, if `omega` is detected as `NaN`, the system uses the **last valid angular velocity** to maintain continuity.  
> ⚠️ This fallback has not yet been tested on real hardware.

---

### 🚧 Notes

- Simulation and Real-World Deployment code may differ slightly.  
- The **real-world version** is the latest.


