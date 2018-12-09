#
# Solr start script
#
cd /opt/solr
bin/solr start -c -zkHost node0.cloud,node1.cloud.node2.cloud,node3.cloud,node4.cloud

