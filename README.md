# Dotfiles

Personal dotfiles configuration for a Linux desktop environment.

## Prerequisites

Install the following software before setting up:

- [MangoWC](https://mangowc.vercel.app) - Wayland compositor
- [Ghostty](https://ghostty.org/) - Terminal emulator
- [Nu](https://www.nushell.sh/) - Shell
- [Starship](https://starship.rs/) - Shell prompt
- [Helix](https://helix-editor.com/) - Text editor
- [Zed](https://zed.dev/) - Text editor
- [Yazi](https://yazi-rs.github.io/) - File manager
- [Zellij](https://zellij.dev/) - Terminal multiplexer
- [GitUI](https://github.com/gitui-org/gitui) - Git terminal UI
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - Smarter cd command

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Create symlinks for configuration files:
   ```bash
   # Config directory
   ln -sf ~/.dotfiles/config/* ~/.config/

   # Home directory files
   ln -sf ~/.dotfiles/home/.bashrc ~/.bashrc
   ```
