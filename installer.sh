#!/bin/bash

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required base packages..."
sudo apt install -y git curl wget gpg apt-transport-https software-properties-common

echo "Installing Visual Studio Code..."

# Import Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
rm microsoft.gpg

# Add VS Code repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Install VS Code
sudo apt update
sudo apt install -y code

echo "Installation complete."
echo "Checking versions..."

git --version
code --version
