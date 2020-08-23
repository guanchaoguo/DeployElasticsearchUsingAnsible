 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs and configures heartbeat on target servers. 

Heartbeat is a lightweight daemon that you install on a remote server to periodically check the status of your services and determine whether they are available. Unlike Metricbeat, which only tells you if your servers are up or down, Heartbeat tells you whether your services are reachable.

heartbeat is an Elastic Beat. It’s based on the libbeat framework. 


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