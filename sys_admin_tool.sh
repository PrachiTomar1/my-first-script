#!/bin/bash

echo "Welcome! This script helps with basic system maintenance and monitoring."
echo "------------------------------------------------------------------------"

# Display system information
echo "System Information:"
echo "--------------------"
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Operating System: $(lsb_release -d | cut -f2)"
echo "Kernel Version: $(uname -r)"
echo "System Uptime: $(uptime -p)"
echo ""

# Display disk usage
echo "Disk Usage Overview:"
df -h | grep "^/dev"

# Display memory usage
echo ""
echo "Memory Usage:"
free -h

# Show top 5 processes consuming CPU
echo ""
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

# Ask if the user wants to check logged-in users
read -p "Would you like to see who is currently logged in? (yes/no): " user_check

if [[ "$user_check" == "yes" ]]; then
    echo "Currently logged-in users:"
    who
fi

# Ask if the user wants to create a backup
read -p "Would you like to create a backup of your home directory? (yes/no): " backup_choice

if [[ "$backup_choice" == "yes" ]]; then
    backup_dir="$HOME/backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    cp -r "$HOME"/* "$backup_dir"
    echo "Backup created at $backup_dir"
else
    echo "Skipping backup."
fi

# Ask if the user wants to analyze logs
read -p "Would you like to check recent system logs? (yes/no): " log_choice

if [[ "$log_choice" == "yes" ]]; then
    echo "Displaying last 10 log entries from syslog:"
    sudo tail -10 /var/log/syslog
fi

# Ask if the user wants to clean up temp files
read -p "Would you like to remove temporary files to free up space? (yes/no): " cleanup_choice

if [[ "$cleanup_choice" == "yes" ]]; then
    echo "Removing temporary files..."
    sudo rm -rf /tmp/*
    echo "Cleanup completed."
else
    echo "Skipping cleanup."
fi

echo "Script execution completed. Have a great day!"
