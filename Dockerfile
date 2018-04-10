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
ADD https://download.jetbrains.com/cpp/CLion-2018.1.tar.gz /opt

# it's a raspberry pi now (the password is raspberry)
RUN echo "dev:raspberry" | chpasswd && adduser dev sudo

# Install make and compilers
RUN apt-get update && \
    apt-get install -y \
    build-essential autoconf automake \
    libxext6 sudo vim nano git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# override the ROS entrypoint
ENTRYPOINT []
USER dev
