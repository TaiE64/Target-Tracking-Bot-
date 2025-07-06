# CMake generated Testfile for 
# Source directory: /home/taie/Desktop/Antobot/src/AntobotSDK/antobot_teleop/antobot_tel_joy/joystick_drivers/joy
# Build directory: /home/taie/Desktop/Antobot/build_isolated/joy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_joy_roslint_package "/home/taie/Desktop/Antobot/build_isolated/joy/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/taie/Desktop/Antobot/build_isolated/joy/test_results/joy/roslint-joy.xml" "--working-dir" "/home/taie/Desktop/Antobot/build_isolated/joy" "--return-code" "/opt/ros/noetic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/taie/Desktop/Antobot/build_isolated/joy/test_results/joy/roslint-joy.xml make roslint_joy")
set_tests_properties(_ctest_joy_roslint_package PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslint/cmake/roslint-extras.cmake;67;catkin_run_tests_target;/home/taie/Desktop/Antobot/src/AntobotSDK/antobot_teleop/antobot_tel_joy/joystick_drivers/joy/CMakeLists.txt;20;roslint_add_test;/home/taie/Desktop/Antobot/src/AntobotSDK/antobot_teleop/antobot_tel_joy/joystick_drivers/joy/CMakeLists.txt;0;")
subdirs("gtest")
