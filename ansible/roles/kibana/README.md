Role Name
=========

This role will install elasticsearch on a server.

Requirements
------------
Java is present on the target machine.
Elasticsearch repo to be present on the target machine. 
Elasticsearch is installed on the target machine. 

Role Variables
--------------

Following variables can be set using this role 


server_port
server_host
server_name
elasticsearch_host


Dependencies
------------
this role requires following roles role to be run before this role. 

1. java
2. add-elastic-repo
3. elasticsearch

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