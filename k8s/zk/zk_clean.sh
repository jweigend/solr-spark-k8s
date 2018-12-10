#!/bin/bash

##################################################
# This script cleans the zookeeper
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

source ${0%/*}/zk_config.sh
source ~/.nodelist

cd "${0%/*}/"

pssh -H "${JOIN_NODES[*]}" -t 600 -i rm -rf $PV_PATH

helm del zookeeper-volumes --purge

kubectl delete -f zookeeper.yaml 

kubectl delete pvc datadir-zk-0
kubectl delete pvc datadir-zk-1
kubectl delete pvc datadir-zk-2
