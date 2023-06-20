FROM continuumio/anaconda3:latest
RUN apt -y update
RUN apt install -y --fix-missing \
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
    snap \
    openssh-client \
    openssh-server \
    zip \
    && apt clean && rm -rf /tmp/* /var/tmp/*
RUN apt --fix-broken install
RUN snap install drawio
RUN git clone https://github.com/reveurmichael/machine-learning.git && \
    cd machine-learning/open-machine-learning-jupyter-book && \
    git remote rm origin && \
    conda env create -f environment.yml


