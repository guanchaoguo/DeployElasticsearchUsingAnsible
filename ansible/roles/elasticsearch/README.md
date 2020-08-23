 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles does the following
 - Installs and configure elasticsearch on target server
 - Configure x-pack security for elasticsearch

Dependencies
------------

This role requires the following role to be run on the target server first

add-elastic-repo

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

 


License
-------

MIT

Author Information
------------------

Vikas Yadav