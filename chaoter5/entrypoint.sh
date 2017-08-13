#!/bin/bash

set -e
cd /opt

tar zxf ../linux-4.4.tar.gz
cd linux-4.4

make defconfig ARCH=um
make menuconfig ARCH=um
make ARCH=um

