FROM ubuntu:latest
MAINTAINER cadot.info "docker@cadot.info"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN apt-get install unzip wget libjpeg-dev libpng-dev \
 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
 libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran cmake python3-pip -y
RUN pip install numpy

RUN wget https://github.com/opencv/opencv/archive/master.zip
RUN unzip master.zip
RUN rm master.zip
RUN wget https://github.com/opencv/opencv_contrib/archive/master.zip
RUN unzip master.zip
RUN rm master.zip
RUN wget https://bootstrap.pypa.io/get-pip.py


WORKDIR "/opencv-master"
RUN mkdir build
WORKDIR "/opencv-master/build"
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib-master/modules \
	-D PYTHON_EXECUTABLE=/bin/python3 \
	-D BUILD_EXAMPLES=ON ..
RUN make -j4
RUN make install
RUN ldconfig
RUN pip3 install matplotlib
WORKDIR "/home"
