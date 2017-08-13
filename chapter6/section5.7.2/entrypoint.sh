#!/bin/bash

set -e
cd /opt

tar zxf ../syslinux-6.03.tar.gz
cd syslinux-6.03/

make bios installer
