FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git cmake build-essential python
RUN apt-get install -y libsndfile1 libsndfile1-dev libasound2 libasound2-dev
RUN apt-get install -y libprotobuf-dev protobuf-compiler autoconf libtool
RUN apt-get install -y pkg-config cmake golang liblilv-dev
RUN apt-get install -y lilv-utils lv2-examples mda-lv2

#GRPC
RUN mkdir /root/grpc
WORKDIR /root/grpc
RUN git clone -b v1.10.1 https://github.com/grpc/grpc /root/grpc
RUN git submodule update --init
RUN mkdir -p /root/grpc/cmake/build
WORKDIR /root/grpc/cmake/build
RUN cmake -DBUILD_SHARED_LIBS=ON ../..
RUN make install
ENV PATH="/root/grpc/cmake/build:${PATH}"

#VST2.4
RUN mkdir /root/vst
WORKDIR /root/vst
RUN git clone https://github.com/R-Tur/VST_SDK_2.4.git /root/vst

RUN mkdir /root/sushi
RUN git clone https://github.com/elk-audio/sushi.git /root/sushi
WORKDIR /root/sushi
#RUN ./generate --cmake-args="-DWITH_XENOMAI=off -DVST_2_SDK_BASE_DIR=/root/vst" -b
