 ![labit_logp](artifacts/images/labit_logo.gif)

Role Name
=========

This roles installs and configures latest version of apache2 webserver target server.


Dependencies
------------

None


Example Playbook
----------------

# This playbook  will deploy elk stack
- hosts: elk
  become: yes
  vars_files: 
  - ../vars/credentials.yml
  - ../vars/main.yml
  roles:
  - ../roles/webserver
  


License
-------

MIT

Author Information
------------------

Vikas Yadav