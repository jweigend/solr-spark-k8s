#!/bin/bash

##################################################
#
# Basic configuration settings zookeeper persistent volumes.
#
# The file defines some variables that can be used in other scripts by
# including it with: source config.sh
#
##################################################

# Persistent volume settings for zookeeper
PV_PATH="/data/zookeeper"
PV_SIZE="5Gi"
PV_VOLUMES_PER_NODE="1" # max=10
