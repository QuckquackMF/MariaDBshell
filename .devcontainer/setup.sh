#!/bin/bash
set -e

# Update apt and install MariaDB server
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server

# Start MariaDB
sudo service mariadb start

# Install Python packages
pip3 install --no-warn-script-location -r /workspace/.devcontainer/requirements.txt

# Initialize Git if not already initialized
if [ ! -d /workspace/.git ]; then
    git init /workspace
    cd /workspace
    git branch -M main
    echo "Git repository initialized on branch 'main'."
else
    echo "Git repository already exists."
fi

echo "Setup complete. You can now run Python scripts and access MariaDB."
