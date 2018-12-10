#!/bin/bash

#
#
# The script creates local persistent volumens by creating n local directories and  
#
#

export KUBECONFIG=/etc/kubernetes/admin.conf

# zk_config sets the variables
# PV_PATH, PV_SIZE, PV_VOLUMES_PER_NODE 
source ${0%/*}/zk_config.sh

# nodelist.sh sets the variables
# JOIN_NODES, JOIN_NODES_COMMA_SEP
source ${0%/*}/../conf/nodelist.sh

cd "${0%/*}/.."

pssh -H "${JOIN_NODES[*]}" -t 600 -i mkdir -p $PV_PATH/{0,1,2,3,4,5,6,7,8,9}

helm install pv --name zookeeper-volumes \
--set nodes="{$JOIN_NODES_COMMA_SEP}" --set size=$PV_SIZE \
--set volumes=$PV_VOLUMES_PER_NODE --set storageClassName=$PV_STORAGE_CLASS_NAME \
--set path=$PV_PATH
