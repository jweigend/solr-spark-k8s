#!/bin/bash

##################################################
#
# This script installs Apache Zookeeper
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

cd "${0%/*}"

echo "Installing Zookeeper ..."

kubectl apply -f zookeeper.yaml
