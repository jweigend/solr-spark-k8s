#
# This script prepares all nodes for installation
#

source ./conf/nodelist.sh

function executeSetup() {
    pssh -H "${CLUSTER_NODES[*]}" -t 6000 -o ${0%/*}/../logs -I<./setup-node.sh
}

executeSetup

