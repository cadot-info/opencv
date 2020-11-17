FROM ubuntu:20.04
MAINTAINER cadot.info <github@cadot.info>

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev \
	python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install numpy
WORKDIR /



ENTRYPOINT ["/home"]
