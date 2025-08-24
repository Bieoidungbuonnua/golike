#!/bin/bash

echo "==============================================="
echo "   🚀 CÀI ĐẶT TOOL GOLIKE TIKTOK TỰ ĐỘNG 🚀"
echo "==============================================="

# Cập nhật hệ thống
echo "🔄 Đang cập nhật hệ thống..."
pkg update -y 2>/dev/null || sudo apt update -y
pkg upgrade -y 2>/dev/null || sudo apt upgrade -y

# Cài Python 3 và pip
echo "📦 Đang cài Python..."
pkg install -y python python-pip 2>/dev/null || sudo apt install -y python3 python3-pip

# Kiểm tra lại Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Lỗi: Python chưa được cài đặt thành công!"
    exit 1
fi
echo "✅ Python đã sẵn sàng!"

# Cài các thư viện cần thiết
echo "📦 Đang cài thư viện Python..."
pip3 install --upgrade pip
pip3 install cloudscraper requests beautifulsoup4 colorama

# Cài ADB để auto click
echo "📱 Đang cài ADB..."
pkg install -y android-tools 2>/dev/null || sudo apt install -y adb

# Tải tool golike.py từ Google Drive
echo "⬇️ Đang tải tool Golike TikTok..."
wget -O golike.py "https://drive.usercontent.google.com/download?id=1yj9OFn4EY9s8dIt70UCukfylgwcQpUxw&export=download&authuser=0&confirm=t&uuid=bb78e2e0-fd67-4250-917f-22ef2ed49cdc&at=AN8xHoofSyvZsrgAXrnqkhmnh7Ce%3A1756039723050"

# Kiểm tra file tool đã tải về chưa
if [ ! -f "golike.py" ]; then
    echo "❌ Lỗi: Không thể tải file golike.py, vui lòng kiểm tra lại link!"
    exit 1
fi

# Cấp quyền chạy cho tool
chmod +x golike.py

# Hoàn tất
echo "==============================================="
echo "   ✅ Cài đặt hoàn tất!"
echo "   👉 Để chạy tool: python3 golike.py"
echo "==============================================="

# Hỏi người dùng có muốn chạy tool luôn không
read -p "Bạn có muốn chạy tool ngay không? (y/n): " runnow
if [[ "$runnow" == "y" || "$runnow" == "Y" ]]; then
    python3 golike.py
fi
