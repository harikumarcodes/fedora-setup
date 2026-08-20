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
