#!/bin/bash

# Create a new script file named rover_system_check.sh
cat << 'EOF' > rover_system_check.sh
#make a random battery percent btw 0 and 100
battery_percentage=$(( RANDOM % 101 ))

# check if the battery percent is below 20%
if [ "$battery_percentage" -lt 20 ]; then
    # Log a message indicating the battery is low and exit
    echo "Battery low! Return to base!" >> mission_log.txt
    exit
fi

# check network connectivity by pinging google.com
if ! ping -c 1 google.com &> /dev/null; then
    # Log a message indicating a communication failure and exit
    echo "Communication failure!" >> mission_log.txt
    exit
fi

#if both checks pass,all systems are operational
echo "All systems operational!" >> mission_log.txt
EOF

# change the permissions of the script to make it executable
chmod +x rover_system_check.sh

# print a message to show the rover system check script has been created
echo "Rover system check script created: rover_system_check.sh"