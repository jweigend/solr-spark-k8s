#
# This script prepares all nodes for installation
#

function cleanNode() {
    rm -rf /opt
    rm -rf /var/lib/zookeeper
    rm -rf /var/lib/solr
    rm -rf /var/lib/spark
    rm -rf /var/lib/zeppelin
    yum -y remove java
}

function installJava() {
     yum -y install java
}

function prepareNode() {
    mkdir -p /opt/software
    mkdir -p /opt/downloads
    installJava
}

function downloadSoftware() {
    
    pushd .

    cd /opt/downloads
    
    curl -O http://apache.lauf-forum.at/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
    tar xvf zookeeper-3.4.13.tar.gz 
    mv zookeeper-3.4.13 ../software
    ln -s /opt/software/zookeeper-3.4.13 /opt/zookeeper

    curl -O http://apache.lauf-forum.at/lucene/solr/7.5.0/solr-7.5.0.tgz
    tar xvf solr-7.5.0.tgz 
    mv solr-7.5.0 ../software
    ln -s /opt/software/solr-7.5.0 /opt/solr

    curl -O http://apache.lauf-forum.at/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
    tar xvf spark-2.3.2-bin-hadoop2.7.tgz 
    mv spark-2.3.2-bin-hadoop2.7 ../software
    ln -s /opt/software/spark-2.3.2-bin-hadoop2.7 /opt/spark

    curl -O http://apache.lauf-forum.at/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz
    tar xvf zeppelin-0.8.0-bin-all.tgz 
    mv zeppelin-0.8.0-bin-all ../software
    ln -s /opt/software/zeppelin-0.8.0-bin-all /opt/zeppelin

    curl -O http://apache.lauf-forum.at/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
    tar xvf hadoop-2.7.7.tar.gz
    mv hadoop-2.7.7 ../software
    ln -s /opt/software/hadoop-2.7.7 /opt/hadoop

    popd
}

function configureSoftware() {
    configureZookeeper
    configureSolr
    configureSpark
    configureZeppelin
    configureHadoop
    configureCluster
}

export LOCALPATH=node0:/home/cloud/solr-spark-k8s/baremetal

#
# Configures zookeeper - The id is extracted from the hostname.
#
function configureZookeeper() {
    sudo mkdir -p /var/lib/zookeeper
    sudo chown -R cloud:root /var/lib/zookeeper
    hostname | sed -r 's/node([0-9]*)\..*/\1/g' > /var/lib/zookeeper/myid
    mkdir -p /opt/zookeeper/conf
    scp $LOCALPATH/zookeeper/zoo.cfg /opt/zookeeper/conf
    scp $LOCALPATH/zookeeper/start-zk.sh /opt
}

function configureSolr() {
    echo "Configure Solr"
    scp $LOCALPATH/solr/start-solr.sh /opt
}

function configureSpark() {    
    echo "Configure Spark"
    scp $LOCALPATH/spark/start-master.sh /opt
    scp $LOCALPATH/spark/start-worker.sh /opt
}

function configureZeppelin() {
   echo "Configure Zeppelin"
   scp $LOCALPATH/zeppelin/start-zeppelin.sh /opt
}

function configureHadoop() { 
    echo "Configure Hadoop"
}

function configureCluster() {
  scp $LOCALPATH/start-node.sh /opt
}

# prepareNode
# downloadSoftware
configureSoftware
