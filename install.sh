#!/data/data/com.termux/files/usr/bin/bash
clear
echo ">>> [1] Update & nâng cấp Termux..."
pkg update -y && pkg upgrade -y

echo ">>> [2] Cài các gói cần thiết..."
pkg install -y python clang git libffi openssl libcrypt ndk-sysroot curl wget

echo ">>> [3] Nâng cấp pip và wheel..."
pip install --upgrade pip setuptools wheel

echo ">>> [4] Cài thư viện Python hay dùng..."
pip install requests beautifulsoup4 colorama wget

echo ">>> [5] Cài cloudscraper..."
pip install cloudscraper || {
    echo "[!] Lỗi khi cài cloudscraper → thử lại cách khác..."
    pip install --no-binary :all: cloudscraper || {
        echo "[!] Thử lại lần cuối với easy_install..."
        pip install setuptools && easy_install cloudscraper || {
            echo "[X] Vẫn không cài được cloudscraper!"
        }
    }
}

echo ">>> [6] Tải tool Golike từ Google Drive..."
cd /sdcard/download
wget -O golike.py "https://drive.usercontent.google.com/download?id=1yj9OFn4EY9s8dIt70UCukfylgwcQpUxw&export=download"

echo ">>> [7] Hoàn tất!"
echo ">>> Chạy tool bằng:"
echo "cd /sdcard/download && python golike.py"
