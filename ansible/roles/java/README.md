Role Name
=========

This role installs java on a remote machine. 

Requirements
------------
None

Role Variables
--------------
None

Dependencies
------------
None

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