#!/bin/bash

echo "Hey there! Welcome to your first Linux script."
echo "-----------------------------------------------"

# Get the current user's name
USER_NAME=$(whoami)
echo "You’re logged in as: $USER_NAME"

# Show the current working directory
echo "You're currently in: $(pwd)"

# List files in the directory
echo "Here are the files in this directory:"
ls -lh

# Show the current date and time
echo "Today's date and time: $(date)"

# Ask for the user’s name and greet them
read -p "What’s your name? " name
echo "Nice to meet you, $name!"

# Ask if the user wants to create a new folder
read -p "Would you like to create a new folder? (yes/no): " answer

if [[ "$answer" == "yes" ]]; then
    read -p "What should we name the folder? " folder_name
    mkdir "$folder_name"
    echo "Folder '$folder_name' created successfully!"
else
    echo "No worries, maybe next time!"
fi

echo "That’s it! Thanks for running the script. Have an awesome day!"
