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
    xvfb \
    pkg-config \
    software-properties-common \
    openssh-client \
    openssh-server \
    libasound2 \
    zip \
    && apt clean && rm -rf /tmp/* /var/tmp/*
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb && \
    dpkg -i draw.io-amd64-13.0.3.deb && rm draw.io-amd64-13.0.3.deb
ARG USERNAME=ocademy
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME
RUN cd ~ && \
    git clone https://github.com/ocademy-ai/machine-learning.git && \
    cd machine-learning/open-machine-learning-jupyter-book && \
    git remote rm origin
RUN --mount=type=cache,target=/opt/conda/pkgs conda env create -f \
    ~/machine-learning/open-machine-learning-jupyter-book/environment.yml
SHELL ["conda", "run", "-n", "open-machine-learning-jupyter-book", "/bin/bash", "-c"]
RUN python3 -m pip install jupyter-book jupyter_contrib_nbextensions==0.7.0 \
    sphinxcontrib-mermaid==0.7.1 \
    sphinxcontrib-wavedrom==3.0.4 \
    sphinxcontrib-plantuml==0.24.1 \
    sphinxcontrib-tikz==0.4.16 \
    sphinxcontrib-blockdiag==3.0.0 \
    sphinxcontrib-drawio==0.0.16 \
    git+https://github.com/innovationOUtside/ipython_magic_tikz.git \
    git+https://github.com/bonartm/sphinxcontrib-quizdown.git \
    xvfbwrapper
SHELL ["/bin/bash", "--login", "-c"]
RUN conda init bash
RUN echo "conda activate open-machine-learning-jupyter-book" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]



