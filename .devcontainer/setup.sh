#!/bin/bash
set -e

# Start MariaDB
sudo service mariadb start

# Create database if it doesn't exist
sudo mariadb -e "CREATE DATABASE IF NOT EXISTS mydatabase;"

# Install Python packages
pip3 install -r /workspaces/requirements.txt

# Initialize Git repo if not already initialized
if [ ! -d "/workspaces/.git" ]; then
    cd /workspaces
    git init
    git branch -M main
    echo "Git repository initialized on main branch."
fi

echo "Setup complete!"
