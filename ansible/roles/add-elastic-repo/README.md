Role Name
=========

This role adds elasticsearch repository on the target machine. 

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