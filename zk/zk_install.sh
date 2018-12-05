#!/bin/bash

##################################################
#
# This script installs the zookeeper helm chart
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

cd "${0%/*}"

echo "Installing Zookeeper ..."

kubectl apply -f zookeeper.yaml
