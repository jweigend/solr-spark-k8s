#
# This script prepares all nodes for installation
#

export CLUSTER_NODES=(node4.cloud node3.cloud node2.cloud node1.cloud node0.cloud)

pssh -H "${CLUSTER_NODES[*]}" -t 6000 -o ${0%/*}/../logs -I<./setup-node.sh

