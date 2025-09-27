#!/bin/bash
set -e

echo "🔧 Updating apt..."
sudo apt-get update -y

echo "📦 Installing MariaDB..."
sudo apt-get install -y mariadb-server mariadb-client

echo "🚀 Manually starting MariaDB..."
sudo mysqld_safe --skip-networking=0 --socket=/var/run/mysqld/mysqld.sock &
# Wait a bit for the server to be fully up
sleep 5

echo "🔑 Setting root password and switching to mysql_native_password..."
sudo mysql -u root <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
    FLUSH PRIVILEGES;
EOSQL

echo "🐍 Installing Python requirements..."
pip install --user -r .devcontainer/requirements.txt || echo "⚠️ No requirements.txt found, skipping."

echo "🛠️ Running create_db.py..."
python3 .devcontainer/create_db.py || echo "⚠️ create_db.py failed or not found, skipping."

echo "✅ Setup complete!"
