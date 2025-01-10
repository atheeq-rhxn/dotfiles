#!/bin/bash

# Exit on any error
set -e

echo "Installing xremap from Copr repository..."
# Add the Copr repository and install xremap
sudo dnf copr enable -y blakegardner/xremap
sudo dnf install -y xremap

# Create the config directory if it doesn't exist
mkdir -p ~/.config/xremap

# Create the xremap configuration file
cat > ~/.config/xremap/config.yml << 'EOL'
modmap:
  - name: Global
    remap:
      CapsLock: Esc
      Esc: CapsLock
EOL

# Set up udev rules and permissions
echo "Setting up permissions..."
# Add user to input group
sudo usermod -aG input $USER
# Create udev rules
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules

# Ensure uinput module is loaded
echo "Loading uinput module..."
sudo modprobe uinput
echo "uinput" | sudo tee /etc/modules-load.d/uinput.conf

# Create systemd user service for xremap
mkdir -p ~/.config/systemd/user/
cat > ~/.config/systemd/user/xremap.service << 'EOL'
[Unit]
Description=xremap key remapping daemon
After=network.target

[Service]
ExecStart=/usr/bin/xremap /home/${USER}/.config/xremap/config.yml
Restart=always
Environment=DISPLAY=:0

[Install]
WantedBy=default.target
EOL

# Reload systemd user daemon
systemctl --user daemon-reload

# Enable and start xremap service
systemctl --user enable xremap.service
systemctl --user start xremap.service

echo "Installation complete! Please log out and log back in for all changes to take effect."
echo "Your CapsLock and Esc keys will be swapped after logging back in."
