Role Name
=========

This role will install elasticsearch on a server.

Requirements
------------
Java is present on the target machine.
Elasticsearch repo to be present on the target machine. 

Role Variables
--------------

Following variables can be set using this role 

cluster_name
master_node_name

#network settings 
network_host
http_port

#path settings 
path_data
path_logs

Dependencies
------------
this role requires following roles role to be run before this role. 

1. java
2. add-elastic-repo

Example Playbook
----------------

 - hosts: elk
   become: yes
   tasks:
   roles:
   - ../roles/java
   - ../roles/add-elastic-repo
   - ../roles/elasticsearch
   - ../roles/kibana
 

License
-------

None

Author Information
------------------

Author Name: Vikas Yadav