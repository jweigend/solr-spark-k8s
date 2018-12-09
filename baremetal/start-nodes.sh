#
# This script starts all nodes and should run from node0
#

source ./conf/nodelist.sh

function startAll() {
    pssh -H "${CLUSTER_NODES[*]}" -t 60000 -o ${0%/*}/../logs -e ${0%/*}/../logs -I<./start-node.sh
}

/opt/start-master.sh
/opt/start-zeppelin.sh
startAll

