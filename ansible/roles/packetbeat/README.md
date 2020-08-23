 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs and configures packetbeat on target servers. 

Packetbeat is a real-time network packet analyzer that you can use with Elasticsearch to provide an application monitoring and performance analytics system. Packetbeat completes the Beats platform by providing visibility between the servers of your network.

Packetbeat is an Elastic Beat. It’s based on the libbeat framework. 


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