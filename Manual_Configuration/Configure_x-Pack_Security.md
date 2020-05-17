# Configure X-Pack Security 

## 1. stop kibana

    sudo systemctl stop kibana

## 2. Stop elasticsearch 

    sudo systemctl stop elasticsearch

## 3. enable xpack in elasticsearch.yml

    sudo nano /etc/elasticsearch/elasticsearch.yml
    xpack.security.enabled: true

## 4. Setup default user passwords

    cd /usr/share/elasticsearch/bin
    sudo ./elasticsearch-setup-passwords auto


## System Passwwords 

### << Default user passwords go here >>


Changed password for user apm_system
PASSWORD apm_system = MdoonZqBKYYVOXzcHiwu

Changed password for user kibana
PASSWORD kibana = Kqzw58a4QSXVV6eSS1FJ

Changed password for user logstash_system
PASSWORD logstash_system = PUzQdup0ccQ83jartoYp

Changed password for user beats_system
PASSWORD beats_system = 0IVYHBBynZotqCVN1MZw

Changed password for user remote_monitoring_user
PASSWORD remote_monitoring_user = iB5ZHQIlmJDbgzvxgxCS

Changed password for user elastic
PASSWORD elastic = te0NAMWgXOYalFuaST6P


## 5. Add the default username in kibana
elasticsearch.username: "kibana"
elasticsearch.password: "new_password"