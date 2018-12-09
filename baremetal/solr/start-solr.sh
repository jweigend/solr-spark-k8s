#
# Solr start script
#
cd /opt/solr
bin/solr start -c -z node0.cloud:2181,node1.cloud:2181,node2.cloud:2181,node3.cloud:2181,node4.cloud:2181

