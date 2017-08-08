#!/bin/bash

# Copy services files to etc directory
cp /etc/services root/etc/

# Create Interfaces file
cat << EOF > root/etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF


mkdir -p root/usr/share/udhcpc

# Create udhcpc script
cat << EOF > root/usr/share/udhcpc/default.script
#!/bin/sh

[ -z "$1" ] && echo "Error: call from udhcpc only" && exit 1

RESOLV_CONF="/etc/resolv.conf"
RESOLV_BAK="/etc/resolv.bak"

[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
[ -n "$subnet" ] && NETMASK="netmask $subnet"

case "$1" in
    deconfig)
        if [ -f "$RESOLV_BAK" ]; then
            mv "$RESOLV_BAK" "$RESOLV_CONF"
        fi
        /sbin/ifconfig $interface 0.0.0.0
        ;;

    renew|bound)
        /sbin/ifconfig $interface $ip $BROADCAST $NETMASK

        if [ -n "$router" ]
        then
            for i in $router ; do
                route add default gw $i dev $interface
            done
        fi

        if [ ! -f "$RESOLV_BAK" ] && [ -f "$RESOLV_CONF" ]
        then
             mv "$RESOLV_CONF" "$RESOLV_BAK"
        fi

         echo -n > $RESOLV_CONF
         [ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
         for i in $dns ; do
             echo nameserver $i >> $RESOLV_CONF
         done
esac
EOF




