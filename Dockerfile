FROM osrf/ros:kinetic-desktop-full-xenial

# System settings
RUN echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf
RUN sysctl -p --system

# Create non-root user -- many systems default to 1000 so we'll do that here to make things compatible
RUN groupadd --system dev --gid 1000 && \
    useradd --uid 1000 --system --gid dev \
    --home-dir /home/dev --create-home \
    --comment "Docker image user" dev && \
    chown -R dev:dev /home/dev

# NOTE(danny): this will become outdated faster than docker swarm in 2018, so keep an eye on it
# NOTE(danny): you should probably keep this locally as clion.tar.gz when testing
# but make sure to comment out the tar in the .dockerignore file
ADD https://download.jetbrains.com/cpp/CLion-2018.1.tar.gz /opt

# it's a raspberry pi now (the password is raspberry)
RUN echo "dev:raspberry" | chpasswd && adduser dev sudo

# Install make and compilers and extra stuff
RUN apt-get update && \
    apt-get install -y \
    build-essential autoconf automake \
    sudo vim nano git curl \
    python-numpy python-scipy python-opencv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# override the ROS entrypoint
ENTRYPOINT []
USER dev
