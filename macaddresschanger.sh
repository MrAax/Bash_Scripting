#!/bin/bash
#echo "================================================================================"
#figlet "        CMP-Solution"
#echo "================================================================================"
#cd Auto_Tor_IP_changer
#python install.py
#python autoTOR.py

while true:
do 
    echo "Select your option : "
    echo "1. wlan0"
    echo "2. eth0"
    echo "3. ens33"
    read options
    if (($options == 1 ))
    then
        read -p "Enter mac address changing time in seconds." chtime
        #read chtime
        while true:
            do
                macchanger -l > vendormac.txt
                sudo ifconfig wlan0 down
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                #sudo ifconfig wlan0 198.168.10.10 netmask 255.255.255.0
                sudo macchanger -m "$ouimac:$uaamac" wlan0
                sudo ifconfig wlan0 up
                sleep $chtime
            done
    elif (($options == 2))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                sudo ifconfig eth0 down
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                #sudo ifconfig eth0 198.168.10.10 netmask 255.255.255.0
                sudo macchanger -m "$ouimac:$uaamac" eth0
                sudo ifconfig eth0 up
                sleep $chtime
            done  
    elif (($options == 3))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                sudo ifconfig ens33 down
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" ens33
                sudo ifconfig ens33 down
                sleep $chtime
            done
    elif (($options == 4))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" usb0
                sleep $chtime
            done
    else
        clear
        echo "Invaled option selected !!!"
        sleep 5
        clear
    fi
done