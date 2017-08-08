#!/bin/bash

set -e
cd /opt

tar zxf ../linux-3.16.tar.gz
cd linux-3.16

cp /config.soekris .config

make menuconfig 
make 

