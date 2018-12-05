#!/bin/bash

##################################################
# This script cleans solr 
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

source ${0%/*}/solr_config.sh
source ~/.nodelist

cd "${0%/*}/.."

pssh -H "${JOIN_NODES[*]}" -t 600 -i rm -rf $PV_PATH

helm del solr --purge
helm del solr-volumes --purge

kubectl delete pvc datadir-solr-solr-0
kubectl delete pvc datadir-solr-solr-1
kubectl delete pvc datadir-solr-solr-2
kubectl delete pvc datadir-solr-solr-3
