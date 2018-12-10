help :
	clear
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " Installation of Solr/Spark "
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " usage: make <target>"
	@echo " valid targets are:"
	@echo "                   "
	@echo " Tasks             "
	@echo " =============     "
	@echo " - install         "
	@echo " - clean           "
	@echo " - status          "
	@echo "--------------------------------------------------------------------------------------------------------"

install: zk_install solr_install

clean: solr_clean zk_clean

solr_install: 
	./solr/solr_volumes.sh
	./solr/solr_install.sh

solr_clean:
	./solr/solr_clean.sh

zk_install :
	./zk/zk_volumes.sh
	./zk/zk_install.sh
zk_clean :
	./zk/zk_clean.sh

status:
	kubectl get pods
