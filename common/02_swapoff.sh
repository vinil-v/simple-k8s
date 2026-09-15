#!/bin/bash
sudo swapoff -a
# To make it permanent, ensure no swap entries exist in /etc/fstab
sudo sed -i '/swap/d' /etc/fstab