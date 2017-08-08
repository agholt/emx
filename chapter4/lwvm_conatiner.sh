#!/bin/bash

OPT[0]="--name=deb_init" 	# container name
OPT[1]="-d" 			# detach
OPT[2]="-it" 			# Interactive terminal
OPT[3]="deb" 			# Image name
OPT[4]="/bin/systemd" 		# command to run in container

docker run ${OPT[*]}

