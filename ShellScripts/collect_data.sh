#!/bin/bash

#echo "Starting data collection..."

#while true; do
    # Get CPU usage percentage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    # Get memory usage percentage
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100}')
    
    # Clear the terminal screen
  # clear


    # Print data to terminal
    echo -e "\033[0;32mCPU & MEMORY USAGE STATS\033[0m"
   echo " "
# echo "----------------------"
    echo "CPU Usage: $CPU_USAGE%"
    echo "Memory Usage: $MEMORY_USAGE%"

     #Wait for 5 seconds
 #   sleep 5
#done
