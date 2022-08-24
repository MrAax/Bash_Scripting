#!/bin/bash
clear
for ping in {1..255..1};
do
	for ping2 in {1..255..1};
	do
		status=`ping -w 3 192.168.$ping.$ping2`
		if [[ $? -ne 0 ]]; then
			echo "192.168.$ping.$ping2 is offline"
		else
			echo "192.168.$ping.$ping2 is online"
			onip=$(192.168.$ping.$ping2)
			# save all online ip
			with open("onIP.txt","a") as files;
				files.write(onip)
				files.close()
	done
done