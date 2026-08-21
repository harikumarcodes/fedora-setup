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
