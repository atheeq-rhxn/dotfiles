#!/usr/bin/env bash
# Exit on error and print all commands
set -e
set -o pipefail  # Ensure the pipeline returns the error of the last failed command

# Log file
LOG_FILE="$HOME/setup_log.txt"
exec > >(tee -a "$LOG_FILE") 2>&1  # Redirect all output to both stdout and a log file

# Function to log messages
log_msg() {
  local msg="$1"
  echo "$(date "+%Y-%m-%d %H:%M:%S") - $msg"
}

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Refresh the shell environment for updates to take effect
refresh_env() {
  log_msg "Refreshing shell environment..."
  # Source the shell configuration to apply environment changes
  if [[ -f "$HOME/.bashrc" ]]; then
    . "$HOME/.bashrc"
  elif [[ -f "$HOME/.bash_profile" ]]; then
    . "$HOME/.bash_profile"
  fi
}

# Function to install packages
install_packages() {
  log_msg "Installing packages: $@"
  sudo dnf install -y "$@" || { log_msg "Failed to install packages: $@"; exit 1; }
}

# Update system packages
log_msg "Updating system..."
sudo dnf update -y || { log_msg "System update failed"; exit 1; }
refresh_env  # Refresh after system update

# Install essential development tools and libraries
log_msg "Installing development tools and libraries..."
install_packages gcc gcc-c++ make cmake perl-core openssl-devel

# Install system utilities and other tools
log_msg "Installing system utilities..."
install_packages \
    file ffmpeg p7zip jq poppler-utils fd-find ripgrep fzf zoxide \
    ImageMagick xclip wl-clipboard xsel jetbrains-mono-fonts-all \
    gtk3-devel clang ninja-build git stow openssh

# Clone and set up dotfiles
log_msg "Setting up dotfiles..."
if [ ! -d "$HOME/dotfiles" ]; then
  git clone https://github.com/atheeq-rhxn/dotfiles.git "$HOME/dotfiles"
fi
cd "$HOME/dotfiles"
stow -t "$HOME/.config" config
stow -t "$HOME" home
cd "$HOME"
refresh_env  # Refresh after dotfiles setup

# Install Ghostty
log_msg "Installing Ghostty..."
if ! command_exists ghostty; then
  sudo dnf copr enable -y pgdev/ghostty
  sudo dnf install -y ghostty || { log_msg "Failed to install Ghostty"; exit 1; }
else
  log_msg "Ghostty is already installed."
fi
refresh_env  # Refresh after installing Ghostty

# Install Rust
log_msg "Installing Rust..."
if ! command_exists rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || { log_msg "Rust installation failed"; exit 1; }
else
  log_msg "Rust is already installed."
fi
refresh_env  # Refresh after installing Rust

# Install Cargo packages in a batch
log_msg "Installing Cargo packages..."
cargo install --locked yazi-fm yazi-cli nu starship ouch zellij || { log_msg "Cargo package installation failed"; exit 1; }
refresh_env  # Refresh after Cargo packages

# Install xremap
log_msg "Setting up xremap..."
if ! command_exists xremap; then
  sudo dnf copr enable -y blakegardner/xremap
  sudo dnf install -y xremap || { log_msg "xremap installation failed"; exit 1; }
else
  log_msg "xremap is already installed."
fi
cd "$HOME/dotfiles"
./setup-xremap.sh || { log_msg "Failed to set up xremap"; exit 1; }
cd "$HOME"
refresh_env  # Refresh after setting up xremap

# Install Helix Editor
log_msg "Installing Helix..."
mkdir -p "$HOME/src"
cd "$HOME/src"
if [ ! -d "helix" ]; then
  git clone https://github.com/helix-editor/helix
  cd helix
  cargo install --path helix-term --locked || { log_msg "Helix installation failed"; exit 1; }
else
  log_msg "Helix is already installed."
fi
cd "$HOME"
refresh_env  # Refresh after installing Helix

# Final message
log_msg "Setup complete! Please log out and log back in for all changes to take effect."
