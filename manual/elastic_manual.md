Install Java

sudo apt-get install openjdk-8-jdk

1. Download and install public signing key 


wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

2. Install apt-transport-https package

sudo apt-get install apt-transport-https -y

3. Save directory definitions

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list


4. Update and Install elasticsearch

sudo apt-get update 

sudo apt-get install elasticsearch 

sudo apt-get install logstash

sudo apt-get install kibana


5. Start Elasticsearch service

sudo systemctl start elasticsearch


6. configure elasticsearch
    sudo su
    nano /etc/elasticsearch/elasticsearch.yml

    change cluster name
    cluster.name: demo-elk  

    give the cluster a descriptive name
    node.name: elk-1 

    change network binding

    network.host: 0.0.0.0  



    setup discovery_type as single node

discovery.type: single-node


7. configure kibana

