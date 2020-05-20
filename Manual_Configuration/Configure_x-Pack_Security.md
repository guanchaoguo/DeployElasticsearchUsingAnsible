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
PASSWORD apm_system = 0mJkgsNKlwj0dAKeETHU

Changed password for user kibana
PASSWORD kibana = n6C3PZslIJNsapvvFu7K

Changed password for user logstash_system
PASSWORD logstash_system = lYrRhuSzo7zKADliH8mH

Changed password for user beats_system
PASSWORD beats_system = R4xrhFFMyo0OvjHHqVR3

Changed password for user remote_monitoring_user
PASSWORD remote_monitoring_user = qj5SMVANWmaJkkzjv3s0

Changed password for user elastic
PASSWORD elastic = zRyX5m4rnXD9yx16Ncok


## 5. Add the default username in kibana
elasticsearch.username: "kibana"
elasticsearch.password: "new_password"