# Overview
A full ROS kinetic install with [CLion](http://www.jetbrains.com/).
Mainly made for me so I could develop some C++ on my Mac without running an extra VM.

# Building
Run `build.sh` to build the image.

# Usage
This uses a folder in your `$HOME/ros-env` to act as the ROS environment's home directory.
If this isn't set up, run `setup-workspace.sh` to create this folder and make a `catkin_ws`.

Run `clion.sh`

And then read [this useful StackExchange page](https://robotics.stackexchange.com/questions/12851/how-to-setup-clion-for-ros)

## Caveats
This is specifically designed for my usecase and no one else's.
You will probably need to fork this to get it to work on anything besides my Mac.

It uses your current wifi ip address to figure out where to route the X connection to, which means
that you're probably not going to have a good time if you ever lose wifi/let your computer sleep.
I managed to add an 'always online' DRM to my software, nice.

This opens up your X server to anyone that is mean enough to open something on your display.

TODO(danny): make that not happen in a way that works on Mac OS and Linux without much hassle.

The password is `raspberry`.

## Troubleshooting

On Mac OS you have to:
1. Have XQuartz installed
2. XQuartz -> Preferences... -> Security -> Allow connections from network clients (reboot required I think)

## License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

## Forked from https://github.com/kurron/docker-clion
