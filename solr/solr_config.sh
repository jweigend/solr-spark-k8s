#!/bin/bash

##################################################
#
# Basic configuration settings solr persistent volumes.
#
# The file defines some variables that can be used in other scripts by
# including it with: source config.sh
#
##################################################

# Persistent volume settings for solr 
PV_PATH="/data/solr"
PV_SIZE="50Gi"
PV_VOLUMES_PER_NODE="1" # max=10
PV_STORAGE_CLASS_NAME="solr-data"