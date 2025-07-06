#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/taie/Desktop/Antobot/src/AntobotSDK/antobot_localisation/antobot_gps"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/taie/Desktop/Antobot/install_isolated/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/taie/Desktop/Antobot/install_isolated/lib/python3/dist-packages:/home/taie/Desktop/Antobot/build_isolated/antobot_gps/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/taie/Desktop/Antobot/build_isolated/antobot_gps" \
    "/usr/bin/python3" \
    "/home/taie/Desktop/Antobot/src/AntobotSDK/antobot_localisation/antobot_gps/setup.py" \
     \
    build --build-base "/home/taie/Desktop/Antobot/build_isolated/antobot_gps" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/taie/Desktop/Antobot/install_isolated" --install-scripts="/home/taie/Desktop/Antobot/install_isolated/bin"
