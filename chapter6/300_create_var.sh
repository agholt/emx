#!/bin/bash

mkdir -p var/{,log/,run/,run/network/,tmp/}


tar cf var.tar var/
cp var.tar root/

