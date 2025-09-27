#!/bin/bash
set -e

# Update and install MariaDB
sudo apt-get update
sudo apt-get install -y mariadb-server

# Start MariaDB
sudo service mariadb start

# Create database if it doesn't exist
sudo mariadb -e "CREATE DATABASE IF NOT EXISTS mydatabase;"

# Install Python dependencies
pip3 install -r /workspaces/requirements.txt

# Initialize Git repo if not initialized
if [ ! -d "/workspaces/.git" ]; then
    cd /workspaces
    git init
    git branch -M main
    echo "Git repository initialized on main branch."
fi

echo "Setup complete!"
