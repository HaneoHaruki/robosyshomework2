#!/bin/bash
# SPDX-FileCopyrightText: 2025 Haruki Haneo
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 20 ros2 launch mypkg weatherpublisher.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log | grep 'Temperature'
