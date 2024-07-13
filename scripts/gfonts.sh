echo "Installing all Google Web Fonts onto your System"
echo "Downloading the fonts..."
curl -L https://github.com/google/fonts/archive/main.tar.gz -o /tmp/master.tar.gz
echo "Extracting the fonts..."
mkdir -p /tmp/goog-fonts/fonts
tar -zxf /tmp/master.tar.gz -C /tmp/goog-fonts/fonts
sudo find /tmp/goog-fonts/fonts/ -type f -name "*.ttf" -exec cp {} $file_path \;

echo "Fonts installed; Cleaning up files..."
rm -f /tmp/master.tar.gz
rm -rf /tmp/goog-fonts
echo "All done! All Google Fonts installed."