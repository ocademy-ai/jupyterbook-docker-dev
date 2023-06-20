FROM continuumio/anaconda3:latest
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean && \
    apt -y update && \
    apt install -y --fix-missing --fix-broken \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    libgtk-3-0\
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libatspi2.0-0 \
    libappindicator3-1 \
    libsecret-1-0 \
    curl \
    pkg-config \
    python3-dev \
    python3-pip \
    software-properties-common \
    openssh-client \
    openssh-server \
    zip \
    && apt clean && rm -rf /tmp/* /var/tmp/*
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb && \
    dpkg -i draw.io-amd64-13.0.3.deb
RUN git clone https://github.com/reveurmichael/machine-learning.git && \
    cd machine-learning/open-machine-learning-jupyter-book && \
    git remote rm origin && \
    conda env create -f environment.yml


