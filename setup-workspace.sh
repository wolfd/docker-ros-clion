#!/bin/bash

# where the home directory for the container lives on your computer
ROS_HOME=$HOME/ros-dev

SETUP_CMD="source /opt/ros/kinetic/setup.bash &&
echo \$HOME/catkin_ws/src &&
mkdir -p \$HOME/catkin_ws/src &&
cd \$HOME/catkin_ws &&
catkin_make &&
echo 'Setting up .bashrc' &&
echo 'source $""HOME/catkin_ws/devel/setup.bash' >> \$HOME/.bashrc &&
echo 'export ROS_HOSTNAME=localhost' >> \$HOME/.bashrc &&
echo 'export ROS_MASTER_URI=http://localhost:11311' >> \$HOME/.bashrc &&
source \$HOME/.bashrc"

mkdir -p $ROS_HOME

# setup a catkin workspace
docker run --entrypoint "/bin/bash" \
	--env HOME=/home/dev \
    --env DISPLAY=$(ipconfig getifaddr en0):0 \
    --interactive \
    --name clion \
    --net host \
    --rm \
    --tty \
    --volume $ROS_HOME:/home/dev \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --workdir /tmp \
	wolf/ros-clion:latest -c "$SETUP_CMD" \
