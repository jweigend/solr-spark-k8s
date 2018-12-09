#
# This script starts all nodes and should run from node0
#

source ./conf/nodelist.sh

function stopAll() {
    pssh -H "${CLUSTER_NODES[*]}" -t 60000 -o ${0%/*}/../logs -e ${0%/*}/../logs -I<./stop-node.sh
}

stopAll
/opt/stop-master.sh
/opt/stop-zeppelin.sh


