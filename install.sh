#!/bin/bash

echo "==============================================="
echo "   🚀 CÀI ĐẶT TOOL GOLIKE TIKTOK (TERMUX) 🚀"
echo "==============================================="

# Bật mirror chuẩn cho Termux
echo "🔄 Đang kiểm tra mirror Termux..."
yes | termux-change-repo

# Cập nhật hệ thống
echo "🔄 Đang cập nhật Termux..."
pkg update -y && pkg upgrade -y

# Cài Python & pip
echo "🐍 Đang cài Python..."
pkg install -y python python-pip

# Kiểm tra cài đặt thành công chưa
if ! command -v python3 &> /dev/null; then
    echo "❌ Lỗi: Python chưa được cài đặt thành công!"
    exit 1
fi
echo "✅ Python đã được cài đặt!"

# Cài thư viện cần thiết
echo "📦 Đang cài thư viện Python..."
pip install --upgrade pip
pip install cloudscraper requests colorama beautifulsoup4

# Cài ADB cho Termux
echo "📱 Đang cài ADB..."
pkg install -y android-tools

# Cài wget nếu chưa có
pkg install -y wget

# Tải tool Golike TikTok
echo "⬇️ Đang tải tool Golike TikTok..."
wget -O golike.py "https://drive.usercontent.google.com/download?id=1yj9OFn4EY9s8dIt70UCukfylgwcQpUxw&export=download&authuser=0&confirm=t&uuid=bb78e2e0-fd67-4250-917f-22ef2ed49cdc&at=AN8xHoofSyvZsrgAXrnqkhmnh7Ce%3A1756039723050"

# Kiểm tra xem tool đã tải thành công chưa
if [ ! -f "golike.py" ]; then
    echo "❌ Lỗi: Không thể tải file golike.py, vui lòng kiểm tra lại link!"
    exit 1
fi

# Cấp quyền chạy
chmod +x golike.py

echo "==============================================="
echo "   ✅ Cài đặt hoàn tất!"
echo "   👉 Để chạy tool: python3 golike.py"
echo "==============================================="

# Hỏi người dùng có muốn chạy tool ngay không
read -p "Bạn có muốn chạy tool ngay không? (y/n): " runnow
if [[ "$runnow" == "y" || "$runnow" == "Y" ]]; then
    python3 golike.py
fi
