#!/usr/bin/bash

source /etc/os-release

if [[ "$ID" != "fedora" ]]; then
  echo "This script requires Fedora."
  exit 1
fi

# RPM Fusion
sudo dnf install -y \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Media Codecs
sudo dnf -y swap ffmpeg-free ffmpeg --allowerasing
sudo dnf -y install @multimedia \
  --setopt="install_weak_deps=False" \
  --exclude=PackageKit-gstreamer-plugin

# Nerd Font
font_name="JetBrainsMono"

font_dir="$HOME/.local/share/fonts/$font_name"
temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT

wget -O "$temp_dir/$font_name.tar.xz" \
  "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.tar.xz"

mkdir -p "$font_dir"
tar -xf "$temp_dir/$font_name.tar.xz" \
  --directory "$font_dir"

fc-cache -fv

# Third-party Packages
sudo dnf -y copr enable atim/starship
sudo dnf -y copr enable scottames/ghostty
sudo dnf -y copr enable lihaohong/yazi

sudo dnf -y install \
  ghostty \
  starship \
  yazi 

# Fedora Packages
sudo dnf -y install \
  gnome-tweaks \
  git \
  helix \
  stow \
  zsh \
  thunderbird

# Official Installers
curl -f https://zed.dev/install.sh | sh

# Zsh
chsh -s "$(which zsh)"


# Keyboard
# -------------------------------------------------------------------

# Super & Caps
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:super', 'shift:both_capslock_cancel']"

# Minimise Window
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Shift>h']"

# Logout
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super><Shift>l']"

# Clear Super + Semicolon (emoji picker shortcut)
gsettings set org.freedesktop.ibus.panel.emoji hotkey "@as []"

# Workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Alt>h']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>j']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Alt>j']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Alt>k']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Alt>l']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>semicolon']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Alt>semicolon']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>apostrophe']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Alt>apostrophe']"
