#!/bin/bash

FS="deb_fs"
UMID="${FS%%_*}"

OPTS[0]="ubd0=$FS"
OPTS[3]="con=pts con0=fd:0,fd:1"
OPTS[4]="ssl=pts"

while getopts ":n:s:r:" CMD_LINE_OPTIONS
do
    case $CMD_LINE_OPTIONS in
        r     ) OPTS[0]="ubd0=$OPTARG"
                UMID="${OPTARG%%_*}"
              ;;
        s     ) OPTS[1]="ubd1=$OPTARG";;
        n     ) OPTS[2]="eth0=tuntap,$OPTARG,,";;
        *     ) echo "Unimplemented option";;
    esac
done

OPTS[5]="umid=${UMID}"

./linux ${OPTS[*]}


