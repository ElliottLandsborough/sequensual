FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git cmake build-essential python
RUN apt-get install -y libsndfile1 libsndfile1-dev libasound2 libasound2-dev
RUN apt-get install -y libprotobuf-dev protobuf-compiler autoconf libtool
RUN apt-get install -y pkg-config cmake golang liblilv-dev
RUN apt-get install -y lilv-utils lv2-examples mda-lv2

# GRPC
RUN mkdir /root/grpc
WORKDIR /root/grpc
RUN git clone -b v1.10.1 https://github.com/grpc/grpc /root/grpc
RUN git submodule update --init
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

RUN mkdir /root/sushi
WORKDIR /root/sushi
RUN git clone https://github.com/elk-audio/sushi.git /root/sushi
RUN git submodule update --init
#RUN ./generate --cmake-args="-DWITH_XENOMAI=off" -b
