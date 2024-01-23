apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get install -y --force-yes \
    wget \
    tmux \
    vim-gtk \
    zip \
    unzip \
    git \
    build-essential \
    pypy \
    cmake \
    curl \
    software-properties-common \
    apt-utils \
    python3-pip \
    ninja-build \
    curl \
    python-is-python3 \
    && apt-get -y autoremove \
    && apt-get clean

# Let's have a custom PS1 to help people realise in which container they are working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[CONTAINER_NAME] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV
