#!/bin/bash

CONTROL_NODE="controlplane"
WORKER_NODES=("node01" "node02")

echo "Starting file transfer to Multipass instances..."

# 1. Handle Control Plane
if multipass list | grep -q "$CONTROL_NODE"; then
    echo "Sending common and controlplane files to $CONTROL_NODE..."
    tar --no-xattrs -c common controlplane | multipass exec "$CONTROL_NODE" -- tar -x
else
    echo "Warning: $CONTROL_NODE is not running."
fi

# 2. Handle Worker Nodes
for worker in "${WORKER_NODES[@]}"; do
    if multipass list | grep -q "$worker"; then
        echo "Sending common files to $worker..."
        tar --no-xattrs -c common | multipass exec "$worker" -- tar -x
    else
        echo "Warning: $worker is not running."
    fi
done

echo "All transfers completed!"