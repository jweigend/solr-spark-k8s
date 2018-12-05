#!/bin/bash

##################################################
#
# The script installs necessary persistent volumes for 
# zeppelin on every node configured in config.sh.
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

source ${0%/*}/zk_config.sh
source ~/.nodelist

cd "${0%/*}/.."

pssh -H "${JOIN_NODES[*]}" -t 600 -i mkdir -p $PV_PATH/{0,1,2,3,4,5,6,7,8,9}

helm install pv --name zookeeper-volumes \
--set nodes="{$JOIN_NODES_COMMA_SEP}" --set size=$PV_SIZE \
--set volumes=$PV_VOLUMES_PER_NODE --set storageClassName=zookeeper-data \
--set path=$PV_PATH
