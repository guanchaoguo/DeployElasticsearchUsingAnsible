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
PASSWORD apm_system = ixicTkGDQvsRD4DVud7G

Changed password for user kibana
PASSWORD kibana = bkC6npKCtAMBFWZw4ube

Changed password for user logstash_system
PASSWORD logstash_system = 8t8t6FAbBPU1SYthqQnW

Changed password for user beats_system
PASSWORD beats_system = fRoOzNLyZ5lB8bKD9SaG

Changed password for user remote_monitoring_user
PASSWORD remote_monitoring_user = Ais1CsbZtl0KbIHDHZ2i

Changed password for user elastic
PASSWORD elastic = Vd0DDcdBV5d3gIKRxmVM


## 5. Add the default username in kibana
elasticsearch.username: "kibana"
elasticsearch.password: "new_password"



