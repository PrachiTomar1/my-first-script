#!/bin/bash

echo "Welcome! This script will help you with some basic system tasks."
echo "---------------------------------------------------------------"

# Show system information
echo "Checking system details..."
echo "User: $(whoami)"
echo "Current Directory: $(pwd)"
echo "System Uptime: $(uptime -p)"
echo "Available Disk Space:"
df -h | grep "^/dev"

# Ask the user if they want to create a backup directory
read -p "Would you like to create a backup folder? (yes/no): " backup_choice

if [[ "$backup_choice" == "yes" ]]; then
    read -p "Enter a name for your backup folder: " backup_folder
    mkdir -p "$backup_folder"
    echo "Backup folder '$backup_folder' created successfully."
else
    echo "Skipping backup folder creation."
fi

# Ask if the user wants to copy files into the backup folder
if [[ "$backup_choice" == "yes" ]]; then
    read -p "Would you like to copy all files from the current directory to '$backup_folder'? (yes/no): " copy_choice
    if [[ "$copy_choice" == "yes" ]]; then
        cp -r * "$backup_folder"/
        echo "Files copied successfully."
    else
        echo "No files were copied."
    fi
fi

# Show running processes
echo "Here are some running processes:"
ps -e --sort=-%mem | head -10

# Ask if the user wants to clean up unused files
read -p "Would you like to delete temporary files to free up space? (yes/no): " cleanup_choice

if [[ "$cleanup_choice" == "yes" ]]; then
    echo "Cleaning up temporary files..."
    rm -rf /tmp/*
    echo "Temporary files removed."
else
    echo "Skipping cleanup."
fi

echo "Script execution completed. Have a productive day!"
