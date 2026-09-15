#!/bin/bash
# Install containerd
sudo apt-get update
sudo apt-get install -y containerd

# Generate the default configuration file
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# Configure containerd to use SystemdCgroup
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# Restart to apply changes
sudo systemctl restart containerd
sudo systemctl enable containerd