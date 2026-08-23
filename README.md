# Fedora Setup Script
Recreate my personal setup on a clean, up-to-date Fedora installation.


## What It Configures
### RPM Fusion
- Multimedia Codecs
- Hardware Codecs if an AMD GPU detected


### JetBrainsMono Nerd Font

### Fedora Packages
  - gnome-tweaks
  - dconf-editor
  - git
  - helix
  - stow
  - zsh
  - thunderbird

### Third-Party Packages
  - ghostty
  - starship
  - yazi

### Apps
  - Zed

### JavaScript Tools
  - fnm
  - Node.js
  - pnpm

### Keyboard Shortcuts

### Dotfiles


## Prerequisites
1. A clean Fedora Installation
2. System must be updated and rebooted

```bash
  sudo dnf upgrade
  reboot
```


## Usage
```bash
  chmod u+x setup.sh
  ./setup.sh
```


## Third-Party Dependencies

### COPRs
- atim/starship
- scottames/ghostty
- lihaohong/yazi

### Remote Installers
- Zed
- fnm
- pnpm
