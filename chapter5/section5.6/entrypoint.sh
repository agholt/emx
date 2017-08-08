#!/bin/bash

set -e
cd /opt

tar zxf ../linux-3.16.tar.gz
cd linux-3.16

make defconfig ARCH=um
make menuconfig ARCH=um
make ARCH=um
