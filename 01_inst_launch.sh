#!/bin/bash
# Launch controlplane node
multipass launch 24.04 --name controlplane --cpus 2 --memory 3G --disk 15G

# Launch worker node 01
multipass launch 24.04 --name node01 --cpus 2 --memory 2G --disk 15G

# Launch worker node 02
multipass launch 24.04 --name node02 --cpus 2 --memory 2G --disk 15G

multipass list