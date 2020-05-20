# Instllation and configuration of Metricbeat on ELK Server


## 1. Enable Monitoring on Elasticsearch Cluster

    cd /etc/elasticsearch

    sudo nano /etc/elasticsearch/elasticsearch.yml

    xpack.monitoring.collection.enabled: true

    xpack.monitoring.elasticsearch.collection.enabled: true


## Restart Elasclearticsearch service

    sudo systemctl restart elasticsearch

## Install Metricbeat

    sudo apt-get install metricbeat

## Configure Metribeat

    sudo su
    cd /etc/metricbeat

    nano metricbeat.yml

        ### live monitoring section 
        reload.enabled: true
        reload.period: 10s
        ### name and tag
        name: elk-metrics
        Tags: demo-elk
        env: lab
        ### enable kibana dashboards
        Setup.dashboards.enabled: true
        host: localhost:5601
        ### output configuration
        output.elasticsearch:
        # Array of hosts to connect to.
        hosts: ["localhost:9200"]
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

## enable elasticsearch-xpack

    sudo metricbeat modules enable elasticsearch-xpack

    nano elasticsearch-xpack.yml
    username: remote_monitoring_user
    password: remote_monitoring_user_password


## enable kibana-xpack

    sudo metricbeat modules enable kibana-xpack

    nano kibana-xpack.yml
    
    username: remote_monitoring_user
    password: remote_monitoring_user_password




### All configuration should be live reloaded using our live reload configuration



