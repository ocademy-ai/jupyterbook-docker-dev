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
    curl \
    pkg-config \
    python3-dev \
    python3-pip \
    software-properties-common \
    openssh-client \
    openssh-server \
    zip \
    && apt clean && rm -rf /tmp/* /var/tmp/*
RUN snap install drawio
RUN git clone https://github.com/reveurmichael/machine-learning.git && \
    cd machine-learning/open-machine-learning-jupyter-book && \
    git remote rm origin && \
    conda env create -f environment.yml


