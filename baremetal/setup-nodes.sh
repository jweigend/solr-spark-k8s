#
# This script prepares all nodes for installation
#

export CLUSTER_NODES=(node4.cloud node3.cloud node2.cloud node1.cloud node0.cloud)

pssh -H "${CLUSTER_NODES[*]}" -t 600 -o ${0%/*}/../logs -I<${0%/*}/setup-node.sh
