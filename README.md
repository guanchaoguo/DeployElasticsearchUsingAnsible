# Elasticsearch Lab

This repository contains ansible playbooks to build an elasticsearch lab that consists of a few servers feeding logs into a single node elasticsearch cluster.

This playbook has been tested on the following software versions:

- Server Operating System :
  - Elasticsearch single node-cluster : Debian 9(stretch)
  - Webservers: Debian 9(stretch)

- ELK Stack:
  - Elasticsearch: 7.5
  - Kibana: 7.5

- Beats:
  - Metricbeat: 7.5
  - Filebeat: 7.5
  - Auditbeat: 7.5
  - Packetbeat: 7.5
  - Heatbeat: 7.5

- Misc
  - Apache2: latest
  - Openjdk: 8

## Elasticsearch Lab Architecture

- Webservers:
  - Apache2
  - Metricbeat
  - Filebeat
  - Auditbeat
  - Packetbeat

- Elasticsearch server:
  - openjdk8
  - Elasticsearch
  - Kibana
  - Metricbeat
  - Filebeat
  - Auditbeat
  - Packetbeat
  - Heartbeat

## Requirements

Internet connectivity to download software.

## Dependencies

Python is installed on target machines to allow ansible to connect to remote.

## Example Playbook

```
---

# This playbook deploys the demo lab

# This section deploys ELK stack and beats on a single node elk cluster
 - hosts: elk
   become: yes
   vars_files:
   - ../vars/main.yml
   tasks:
   roles:
   - ../roles/java
   - ../roles/add-elastic-repo
   - ../roles/elasticsearch
   - ../roles/kibana
   - ../roles/metricbeat
   - ../roles/auditbeat
   - ../roles/filebeat
   - ../roles/packetbeat
   - ../roles/config-beats-elastic
   - ../roles/heartbeat

# This section deploys webservers with beats

 - hosts: webservers
   become: yes
   vars_files:
   - ../vars/main.yml
  
   roles:
   - ../roles/add-elastic-repo
   - ../roles/webserver
   - ../roles/metricbeat
   - ../roles/auditbeat
   - ../roles/filebeat
   - ../roles/packetbeat
   - ../roles/config-beats-apache
...
```

## License

None

## Author Information

Author Name: Vikas Yadav
