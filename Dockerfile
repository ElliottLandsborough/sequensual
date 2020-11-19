FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

# Separated because of my bad internet connection
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git nano python cmake build-essential
RUN apt-get install -y libsndfile1 libsndfile1-dev libasound2 libasound2-dev
RUN apt-get install -y libprotobuf-dev protobuf-compiler autoconf libtool
RUN apt-get install -y pkg-config cmake golang liblilv-dev
RUN apt-get install -y lilv-utils lv2-examples mda-lv2
RUN apt-get install -y libjack-jackd2-0 libjack-jackd2-dev
RUN apt-get install -y liblo7 liblo-dev

# GRPC
RUN mkdir /root/grpc
WORKDIR /root/grpc
RUN git clone -b v1.10.1 https://github.com/grpc/grpc /root/grpc
RUN git submodule update --init --recursive
RUN mkdir -p /root/grpc/cmake/build
WORKDIR /root/grpc/cmake/build
RUN cmake -DBUILD_SHARED_LIBS=ON ../..
RUN make install
ENV PATH="/root/grpc/cmake/build:${PATH}"

# libtwine
# https://launchpad.net/~finkhaeuser-consulting/+archive/ubuntu/ppa
WORKDIR /root
RUN apt-get install wget
RUN wget https://launchpad.net/~finkhaeuser-consulting/+archive/ubuntu/ppa/+files/libmeta1_1.1-1_amd64.deb
RUN wget https://launchpad.net/~finkhaeuser-consulting/+archive/ubuntu/ppa/+files/libmeta-dev_1.1-1_amd64.deb
RUN dpkg -i libmeta1_1.1-1_amd64.deb
RUN dpkg -i libmeta-dev_1.1-1_amd64.deb
RUN wget https://launchpad.net/~finkhaeuser-consulting/+archive/ubuntu/ppa/+files/libtwine1_1.0-2_amd64.deb
RUN wget https://launchpad.net/~finkhaeuser-consulting/+archive/ubuntu/ppa/+files/libtwine-dev_1.0-2_amd64.deb
RUN dpkg -i libtwine1_1.0-2_amd64.deb
RUN dpkg -i libtwine-dev_1.0-2_amd64.deb

# VST2.4
RUN mkdir /root/vst24-1
WORKDIR /root/vst24-1
RUN git clone https://github.com/ElliottLandsborough/ChuckDelay /root/vst24-1
RUN mkdir /root/vst24-2
WORKDIR /root/vst24-2
RUN git clone https://github.com/ElliottLandsborough/mathreverb /root/vst24-2
RUN ln -s /root/vst24-2/VST2_SDK/pluginterfaces /root/vst24-1/pluginterfaces 

# prepare for compilation
RUN mkdir /root/sushi
WORKDIR /root/sushi
RUN git clone -b 0.10.3  https://github.com/elk-audio/sushi.git /root/sushi
RUN git submodule update --init --recursive

# add fifo dependency
RUN mkdir /root/fifo
RUN git clone https://github.com/ElliottLandsborough/lock-free-wait-free-circularfifo /root/fifo
RUN mkdir /root/sushi/src/library/fifo
RUN ln -s /root/fifo/src/circularfifo_memory_relaxed_aquire_release.hpp /root/sushi/src/library/fifo/circularfifo_memory_relaxed_aquire_release.h

# compile
RUN ./generate --cmake-args="-DWITH_XENOMAI=off -DWITH_LV2=off -DWITH_LINK=off -DVST2_SDK_PATH=/root/vst24-1" -b

# go stuff
COPY . /root/sequensual
WORKDIR /root/sequensual
RUN make build