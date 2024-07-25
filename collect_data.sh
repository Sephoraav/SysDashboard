#!/bin/bash

# Define the path to the external scripts
DISK_SPACE_SCRIPT="./scripts/disk_space.sh"
NETWORK_TRAFFIC_SCRIPT="./scripts/network_traffic.sh"

# Function to get CPU usage percentage
get_cpu_usage() {
    # Capture CPU usage using top command and extract the percentage
    top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'
}

# Function to get memory usage percentage
get_memory_usage() {
    # Capture memory usage percentage using free command
    free | grep Mem | awk '{print $3/$2 * 100}'
}

# Function to get disk space usage
get_disk_space() {
    # Run the external disk space script and capture its output
    bash "$DISK_SPACE_SCRIPT"
}

# Function to get network traffic
get_network_traffic() {
    # Run the external network traffic script and capture its output
    bash "$NETWORK_TRAFFIC_SCRIPT"
}

# Function to collect data and save it to a JSON file
collect_data() {
    # Collect metrics
    CPU_USAGE=$(get_cpu_usage)
    MEMORY_USAGE=$(get_memory_usage)
    DISK_SPACE=$(get_disk_space)
    NETWORK_TRAFFIC=$(get_network_traffic)
    
    # Create JSON data
    JSON_DATA=$(cat <<EOF
{
    "cpu_usage": "$CPU_USAGE",
    "memory_usage": "$MEMORY_USAGE",
    "disk_space": "$DISK_SPACE",
    "network_traffic": "$NETWORK_TRAFFIC"
}
EOF
)
    
    # Write JSON data to file
    echo "$JSON_DATA" > data.json
}

# Main loop to collect data every 5 seconds
while true; do
    collect_data
    sleep 5
done
