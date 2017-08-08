#!/bin/bash


# Create motd and issue files
touch root/etc/{motd,issue}

# Create passwd and group files
cat << EOF > root/etc/passwd
root::0:0:Superuser:/root:/bin/sh
EOF

cat << EOF > root/etc/group
root:!:0:
EOF

# Create nsswitch.conf
cat << EOF > root/etc/nsswitch.conf
passwd:                 files
group:                  files
shadow:                 files
hosts:                  files dns
networks:               files
protocols:              fIles
services:               files
EOF

# Create profile and env scripts
cat << EOF > root/etc/profile
#!/bin/sh

for i in /etc/profile.d/*
do
       . $i
done
EOF

cat << EOF > root/etc/env
export PS1='\u@\h:\w\$ '
EOF

# Create inittab
cat << EOF > root/etc/inittab
# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $

id:2:initdefault:

si::sysinit:/etc/init.d/rcS

~:S:wait:/sbin/sulogin

l0:0:wait:/etc/init.d/rc 0
l1:1:wait:/etc/init.d/rc 1
l2:2:wait:/etc/init.d/rc 2
l3:3:wait:/etc/init.d/rc 3
l4:4:wait:/etc/init.d/rc 4
l5:5:wait:/etc/init.d/rc 5
l6:6:wait:/etc/init.d/rc 6
z6:6:respawn:/sbin/sulogin

ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now

pf::powerwait:/etc/init.d/powerfail start
pn::powerfailnow:/etc/init.d/powerfail now
po::powerokwait:/etc/init.d/powerfail stop

1:2345:respawn:/sbin/getty 38400 tty1
2:23:respawn:/sbin/getty 38400 tty2
3:23:respawn:/sbin/getty 38400 tty3
4:23:respawn:/sbin/getty 38400 tty4
5:23:respawn:/sbin/getty 38400 tty5
6:23:respawn:/sbin/getty 38400 tty6

T0:23:respawn:/sbin/getty -L ttyS0 9600 vt100
T1:23:respawn:/sbin/getty -L ttyS1 9600 vt100
EOF

# Create fstab
cat << EOF > root/etc/fstab
proc /proc proc defaults 0 0
sysfs /sys sysfs defaults 0 0
tmpfs /dev/shm tmpfs defaults 0 0
tmpfs /tmp tmpfs defaults 0 0
tmpfs /var tmpfs defaults 0 0
EOF





