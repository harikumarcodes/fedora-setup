
vga_info="$(lspci | grep VGA)"

if [[ $vga_info =~ "[AMD/ATI]" ]]; then
  echo "AMD GPU detected"
fi

# Searching if shortcut is already in use
gsettings list-recursively | grep -F "['<Super>f']"
org.gnome.settings-daemon.plugins.media-keys home ['<Super>f']
