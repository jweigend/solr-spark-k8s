#!/bin/bash

##################################################
#
# The script installs Apache Solr 
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

cd ${0%/*}

helm install helm-solr --name solr 

kubectl apply -f solr-ingress.yaml
