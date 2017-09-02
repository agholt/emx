#!/bin/bash


# Specifiy extra packages
IPKG="udev,locales,resolvconf,rcconf,ssh,net-tools,iputils-ping"

# Set debootstrap options
OPTS[0]="--variant=minbase"
OPTS[1]="--include=${IPKG}"
OPTS[2]="jessie"
OPTS[3]="root"
OPTS[4]="http://ftp.at.debian.org/debian"

# Create Debian system
sudo debootstrap ${OPTS[*]} 

