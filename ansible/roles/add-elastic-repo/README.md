
 ![labit_logp](artifacts/images/labit_logo.gif)

add-elastic-repo
=========

This role adds elasticsearch repository and public signing key onto the target server.


Requirements
------------
Following elasticsearch repository and public signing-key being available. 

https://artifacts.elastic.co/GPG-KEY-elasticsearch
https://artifacts.elastic.co/packages/7.x/apt

Role Variables
--------------

elasticsearch public signing key url

elastic_psk_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch

elasticsearch 7.x repository definition

elastic_repo: https://artifacts.elastic.co/packages/7.x/apt

Dependencies
------------

None

Example Playbook
----------------

- hosts: all
  become: yes
  roles:
  - ../roles/add-elastic-repo

License
-------

MIT

Author Information
------------------

Vikas Yadav
