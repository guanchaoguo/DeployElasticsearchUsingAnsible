Role Name
=========

This role will install elasticsearch filebeat on a server.

Requirements
------------
Elasticsearch repo is preconfigured on the server or add-elastic-repo role is run on the server. 

Role Variables
--------------

Following variables can be set using this role 

filebeat_create_config
log_path
index_number_of_shards

Dependencies
------------
Dependencies
------------
1. This role requires add-elastic-repo role to be run before this role or elasticsearch repository to be present on target machine. 
2. Elasticsearch, kibana IP addresses need to be configured on vars file in the playbook. This is so that if you are installing multiple elastic beats on target server you do not have to enter the IP addresses in multiple places.

Example Playbook
----------------

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
 
 

License
-------

None

Author Information
------------------

Author Name: Vikas Yadav