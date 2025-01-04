#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 10 ros2 launch mypkg test.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep '湿度'
