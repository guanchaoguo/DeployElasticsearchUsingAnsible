 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs and configures following beat modules on target server. 

 - Filebeat - 
    - elasticsearch.yml
    - kibana.yml
 - Heartbeat
   - http.yml
   - tcp.yml
   - icmp.yml
 - Metricbeat
   - beat-xpack.yml
   - elasticsearch-xpack.yml
   - kibana-xpack.yml


Dependencies
------------

This role requires the following role to be run on the target server first

add-elastic-repo
filebeat
heartbeat
metricbeat


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