#!/bin/bash

mkdir root/etc/init.d
mkdir root/etc/rc{S.d,0.d,1.d,2.d,3.d,4.d,5.d,6.d}

cp files/init.d/* root/etc/init.d/


cd root/etc/rcS.d
ln -s ../init.d/mountall S35mountall
ln -s ../init.d/bootmisc S37bootmisc
ln -s ../init.d/hostname S40hostname
ln -s ../init.d/network S40network


cd ../rc0.d
ln -s ../init.d/klogd K89klogd
ln -s ../init.d/syslogd K90syslogd
ln -s ../init.d/network K95network
ln -s ../init.d/mountall K97mountall
ln -s ../init.d/halt S99halt


cd ../rc2.d
ln -s ../init.d/syslogd S10syslogd
ln -s ../init.d/klogd S11klogd

cd ../rc6.d
ln -s ../init.d/klogd K89klogd
ln -s ../init.d/syslogd K90syslogd
ln -s ../init.d/network K95network
ln -s ../init.d/mountall K97mountall
ln -s ../init.d/reboot S99reboot


