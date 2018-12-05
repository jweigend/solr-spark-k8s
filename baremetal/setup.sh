#
# This script prepares all nodes for installation
#

function prepareNode() {
    mkdir /opt
    mkdir /opt/software
    mkdir /opt/downloads
}

function downloadSoftware() {
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
    ln -s /opt/software/zeppelin-0.8.0-bin-all.tgz /opt/zeppelin
}

prepareNode
downloadSoftware
