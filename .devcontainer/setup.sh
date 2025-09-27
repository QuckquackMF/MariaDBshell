#!/bin/bash
set -e  # stop if any command fails

echo "🔧 Updating apt..."
sudo apt-get update -y

echo "📦 Installing MariaDB..."
sudo apt-get install -y mariadb-server mariadb-client

echo "🐍 Installing Python requirements..."
pip install --user -r .devcontainer/requirements.txt || echo "⚠️ No requirements.txt found, skipping."

echo "✅ Setup complete!"
