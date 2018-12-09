#
# This script prepares all nodes for installation
#

source ./conf/nodelist.sh

function executeSetup() {
    pssh -H "${CLUSTER_NODES[*]}" -t 60000 -o ${0%/*}/../logs -e ${0%/*}/../logs -I<./setup-node.sh
}

executeSetup

