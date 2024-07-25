#!/bin/bash

echo -e "\033[0;32mNETWORK STATUS INFORMATION\033[0m"
echo " "

echo -e "\033[0;34mIP INFORMATION\033[0m"
ifconfig |grep "\<inet\>" | awk '{print $2}'| head -n1

echo ""

echo -e "\033[0;34mSERVER STATUS\033[0m"
ifconfig | grep "flags" |  awk -F'<' '{print $2}'| awk -F'>' '{print $1}'| head -n1
echo " "

echo -e "\033[0;34mDATA TRANSMISSION DATA\033[0m"
ifconfig | grep "RX " | awk '{print "Packets Transmitted", $3, "| Bytes Transmitted", $5}' | head -n1
echo " "

