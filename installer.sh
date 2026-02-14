#!/bin/bash

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing snapd if not installed..."
sudo apt install -y snapd

echo "Refreshing snap..."
sudo snap install core
sudo snap refresh core

echo "Installing Git via snap..."
sudo snap install git --classic

echo "Installing Visual Studio Code via snap..."
sudo snap install code --classic

echo "Installing Docker via snap..."
sudo snap install docker

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "Enabling Docker service..."
sudo snap start docker

echo "Installation complete."
echo "Please log out and log back in for Docker permissions to apply."
