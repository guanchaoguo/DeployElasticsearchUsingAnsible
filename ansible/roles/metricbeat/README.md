 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs and configures metricbeat on target servers. 

Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

Metricbeat is an Elastic Beat. It’s based on the libbeat framework. 


Dependencies
------------

This role requires the following role to be run on the target server first

add-elastic-repo
elasticsearch
kibana
metricbeat

## Some versions of elasticsearch might also need the following role which installs openjdk-8

java


Example Playbook
----------------


# This playbook  will deploy elk stack
- hosts: elk
  become: yes
  vars_files: 
  - ../vars/credentials.yml
  - ../vars/main.yml
  roles:
  - ../roles/add-elastic-repo
  - ../roles/java
  - ../roles/elasticsearch
  - ../roles/kibana
  - ../roles/metricbeat
  - ../roles/filebeat
  - ../roles/auditbeat
  - ../roles/heartbeat
  - ../roles/config-beats-elastic


License
-------

MIT

Author Information
------------------
Vikas Yadav