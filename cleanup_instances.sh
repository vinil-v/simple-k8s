#!/bin/bash
multipass delete controlplane 
multipass delete node01 
multipass delete node02 

multipass purge 
multipass list