FROM ubuntu:18.04

WORKDIR /home/

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && \
  rm -f /etc/timezone && rm -f /etc/localtime && \
  printf 'tzdata tzdata/Areas select America\ntzdata tzdata/Zones/America select Sao_Paulo\n' | debconf-set-selections && \
  apt-get install -y \
    tzdata make unrar-free autoconf automake libtool gcc g++ gperf \
    flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
    sed git unzip bash help2man wget bzip2 libtool-bin zlib1g-dev openjdk-8-jre curl vim && \
	rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://github.com/marrony/esp-open-sdk.git /home/esp-open-sdk && \
  useradd -UMd /crosstoolng crosstoolng && \
  chown -R crosstoolng:crosstoolng /home/esp-open-sdk

COPY esp_iot_sdk_v1.5.0_15_11_27.zip /home/esp-open-sdk/

USER crosstoolng

RUN cd /home/esp-open-sdk && \
  make VENDOR_SDK=1.5.0 && \
  cp /home/esp-open-sdk/esp_iot_sdk_v1.5.0/include/c_types.h.orig /home/esp-open-sdk/esp_iot_sdk_v1.5.0/include/c_types.h && \
  rm -rf crosstool-NG/ xtensa-lx106-elf/build.log.bz2 esp_iot_sdk_v1.5.0_15_11_27.zip

USER root

