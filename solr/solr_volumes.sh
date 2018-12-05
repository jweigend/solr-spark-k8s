#!/bin/bash

##################################################
#
# The script installs necessary persistent volumes for 
# solr on every node configured in config.sh.
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

# solr_config sets the variables
# PV_PATH, PV_SIZE, PV_VOLUMES_PER_NODE 
source ${0%/*}/solr_config.sh

source ${0%/*}/../conf/nodelist.sh

pssh -H "${JOIN_NODES[*]}" -t 600 -i mkdir -p $PV_PATH/{0,1,2,3,4,5,6,7,8,9}

helm install ${0%/*}/../pv --name solr-volumes \
--set nodes="{$JOIN_NODES_COMMA_SEP}" --set size=$PV_SIZE \
--set volumes=$PV_VOLUMES_PER_NODE --set storageClassName=$PV_STORAGE_CLASS_NAME\
--set path=$PV_PATH
