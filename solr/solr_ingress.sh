#!/bin/bash

##################################################
#
# The script installs Apache Solr
#
##################################################

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl create -f solr-ingress.yaml
grep -q -F '127.0.0.1 solr.local' /etc/hosts || \
echo '127.0.0.1 solr.local' >> /etc/hosts
