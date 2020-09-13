# Instllation and configuration of Metricbeat on WebServer

## 1. Download and install public signing key 



    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

## 2. Install apt-transport-https package

    sudo apt-get install apt-transport-https -y

## 3. Save directory definitions

    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list


## 4. Update and Install metricbeat

    sudo apt-get update 

    sudo apt-get install metricbeat

## Configure Metribeat

    sudo su
    cd /etc/metricbeat

    nano metricbeat.yml

        ### live monitoring section 
        reload.enabled: true
        reload.period: 10s
        ### name and tag
        name: webserver
        Tags: demo-web
        ### enable kibana dashboards
        Setup.dashboards.enabled: true
        host: <<ip_address_of_Kibana_server>>:5601
        ### output configuration
        output.elasticsearch:
        # Array of hosts to connect to.
        hosts: ["<<ip_address_of_elastic_server>>:9200"]
        # Protocol - either `http` (default) or `https`.
        protocol: "https"
        #api_key: "id:api_key"
        username: "elastic"      ####  elasticsuperuser
        password: "password".    #### elastic users password
 ## logging
        logging.level: debug

        logging.selectors: ["*"]

        logging.to_files: true
        logging.files:
        path: /var/log/metricbeat
        name: metricbeat
        keepfiles: 7
        permissions: 0644
        ## enable interal collection of metricbeat
        monitoring.enabled: true
        monitoring.elasticsearch



## Start Metricbeat

    sudo systemctl start metricbeat

## Module configuration starts here

## enable apache

    sudo metricbeat modules enable apache

## enable system

    sudo metricbeat modules enable system

## enable monitoring of metricbeat using metricbeat

    sudo metricbeat modules enable beats-xpack


### All configuration should be live reloaded using our live reload configuration



