#!/bin/bash
set -e

echo "🔧 Updating apt..."
sudo apt-get update -y

echo "📦 Installing MariaDB..."
sudo apt-get install -y mariadb-server mariadb-client

echo "🚀 Starting MariaDB service..."
sudo service mariadb start

echo "🐍 Installing Python requirements..."
pip install --user -r .devcontainer/requirements.txt || echo "⚠️ No requirements.txt found, skipping."

echo "🛠️ Running create_db.py..."
python3 .devcontainer/create_db.py || echo "⚠️ create_db.py failed or not found, skipping."

echo "✅ Setup complete!"
