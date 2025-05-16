#!/bin/bash

set -euo pipefail
set -x

### ========================================
### 0. BERSIHKAN DEVSTACK
### ========================================
echo "🧹 Membersihkan DevStack lama..."
export LOGDIR=/opt/stack/logs
export LOGFILE=$LOGDIR/stack-debug-$(date +%Y%m%d-%H%M).log

cd ~/devstack || { echo "❌ Folder devstack tidak ditemukan!"; exit 1; }
./unstack.sh || true
./clean.sh || true
mkdir -p $LOGDIR
cp -r $LOGDIR "$LOGDIR.bak.$(date +%s)" || true

### ========================================
### 1. HAPUS MARIADB (kalau ada)
### ========================================
echo "🧹 Menghapus MariaDB jika ada..."
sudo systemctl stop mariadb || true
sudo apt purge -y mariadb-server mariadb-client mariadb-common mariadb-* || true
sudo apt autoremove -y
sudo apt autoclean

### ========================================
### 2. INSTALL MYSQL 8.x (APT default)
### ========================================
echo "🐬 Menginstall MySQL 8 dari APT..."
sudo apt update
sudo apt install -y mysql-server

echo "🔄 Restart MySQL..."
sudo systemctl restart mysql

### ========================================
### 3. CONFIGURE MYSQL ROOT
### ========================================
echo "🔐 Konfigurasi root MySQL ke mysql_native_password..."
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';
FLUSH PRIVILEGES;
EOF

### ========================================
### 4. INSTALL RABBITMQ SERVER
### ========================================
echo "🐇 Menginstall RabbitMQ..."
sudo apt install -y rabbitmq-server
sudo systemctl enable --now rabbitmq-server

### ========================================
### 5. JALANKAN DEVSTACK
### ========================================
# ========== DevStack Wrapper ==========
export LC_ALL=en_US.UTF-8
export HOST_IP=127.0.0.1
export STACK_USER=stack
export SERVICE_PASSWORD=admin
export ADMIN_PASSWORD=admin
export DATABASE_PASSWORD=admin
export RABBIT_PASSWORD=admin

echo "✅ Validasi environment..."
hostname | grep -q "^user$" || { echo "❌ Hostname harus 'user'"; exit 1; }
[ "$(whoami)" = "stack" ] || { echo "❌ Jalankan sebagai user 'stack'"; exit 1; }

echo "🚀 Menjalankan ./stack.sh dengan logging..."
bash -x ./stack.sh 2>&1 | tee "$LOGFILE"