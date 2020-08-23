 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs openjdk-8 on the target server.

Dependencies
------------
None

Example Playbook
----------------

# This playbook  will deploy elk stack
- hosts: elk
  become: yes
  roles:
  - ../roles/java

License
-------

MIT

Author Information
------------------

Vikas Yadav