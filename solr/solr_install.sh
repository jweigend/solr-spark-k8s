#!/bin/bash

##################################################
#
# The script installs Apache Solr 
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

cd ${0%/*}

echo "Installing Apache Solr"

helm install helm --name solr 

echo "Installing Solr Ingress"

kubectl apply -f solr-ingress.yaml
