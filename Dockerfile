FROM ubuntu

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git cmake build-essential python

RUN apt-get install -y git libsndfile1 libsndfile1-dev libasound2 libasound2-dev libprotobuf-dev protobuf-compiler

#LV2
##Sushi
RUN apt-get install -y liblilv-dev lilv-utils
##LV2 Unit Tests
RUN apt-get install -y lv2-examples mda-lv2

#GRPC
RUN apt-get install build-essential autoconf libtool pkg-config cmake golang
RUN mkdir /root/grpc
RUN git clone -b v1.10.1 https://github.com/grpc/grpc /root/grpc
RUN cd /root/grpc \
    git submodule update --init \
    mkdir -p cmake/build \
    cd cmake/build \
    cmake -DBUILD_SHARED_LIBS=ON ../.. \
    make install

#RUN mkdir /root/sushi
#RUN git clone https://github.com/elk-audio/sushi.git /root/sushi
#RUN cd /root/sushi \
#    ./generate --cmake-args="-DWITH_XENOMAI=off -DWITH_VST2=off" -b