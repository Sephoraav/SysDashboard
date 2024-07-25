#!/bin/bash

echo " "
echo -e "\033[0;32mDISK DATA\033[0m"
echo " "
echo -e "\033[0;34mDISK SPACE UTILISATION\033[0m"

df --total -h | grep "total" | awk '{print $1 " " $2 " " $3 " " $4 " "$5}'

