#!/bin/bash

# Generate SSH key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "atheeq.rhxn@gmail.com"

# Start SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

# Add SSH key to agent
echo "Adding SSH key to agent..."
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
echo "Copying public key to clipboard..."
xclip -sel clip < ~/.ssh/id_ed25519.pub
