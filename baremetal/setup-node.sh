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
}

#
# Configures zookeeper - The id is extracted from the hostname.
#
function configureZookeeper() {
    mkdir -p /var/lib/zookeeper
    hostname | sed -r 's/node([0-9]*)\..*/\1/g' > /var/lib/zookeeper/myid
    mkdir -p /opt/zookeeper/conf
}

function configureSolr() {
    echo "Configure Solr"
}

function configureSpark() {    
    echo "Configure Spark"
}

function configureZeppelin() {
    echo "Configure Zeppelin"
}

function configureHadoop() {
    echo "Configure Hadoop"
}

# prepareNode
# downloadSoftware
configureSoftware
