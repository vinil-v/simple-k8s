#!/bin/bash
# Load modules now
sudo modprobe overlay
sudo modprobe br_netfilter

# Persist modules across reboots
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

# Configure sysctl requirements for Kubernetes networking
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl settings without rebooting
sudo sysctl --system