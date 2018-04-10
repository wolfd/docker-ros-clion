#!/bin/bash

# Launches CLion inside a Docker container (specifically for my mac)

IMAGE=${1:-wolf/clion:latest}

ROS_HOME=$HOME/ros-dev

CLION_CMD="source \$HOME/catkin_ws/devel/setup.bash && /opt/clion-2018.1/bin/clion.sh"

# Need to give the container (and everyone) access to windowing system
xhost +

docker run --env HOME=/home/dev \
    --env DISPLAY=$(ipconfig getifaddr en0):0 \
    --interactive \
    --name clion \
    --net host \
    --rm \
    --tty \
    --volume $ROS_HOME:/home/dev \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --workdir /tmp \
    --entrypoint /bin/bash \
    ${IMAGE} -c "$CLION_CMD"
