# Instllation and configuration of Auditbeat on ELK Server



## 1. Install Audit beat
    
      apt-get install auditbeat

## 2. Configure Auditbeat modules

   ## Auditd module
   ### Go to identity changes and add following file watches
      
      -w /etc/elasticsearch/elasticsearch.yml -p wa -k elk_changes

      -w /etc/kibana/kibana.yml -p wa -k elk_changes
      
   ### file_integrity module

      /etc/elasticsearch
      /etc/kibana
      /etc/metricbeat
      /etc/metricbeat/modules.d
      /etc/filebeat
      /etc/filebeat/module.d
      /etc/auditbeat

     exclude_files:
     - '([^\s]+).reference.yml'
   
   ### System module
     # No change needed

## 3. Configure Auditbeat general settings
      tags: ["elk"]


   ### Setup dashboards
       setup.dashboards.enabled: true

   ### Kibana
       host: "localhost:5601"

   ### elasticsearch output
       hosts: ["localhost:9200"]
       protocol: "http"
       username: "elastic"
       password: "goodwitch"

   ### logging
       
      logging.to_files: true
      logging.files:
       path: /var/log/auditbeat
       name: auditbeat
       keepfiles: 7
       permissions: 0644
  ### setup monitoring through metricbeat
        http.enabled: true
        http.port: 5068

## 5. Enable beat-pack if not already enabled 
       sudo metricbeat modules enable beat-xpack

## 6. configure beat-expack 
   
        sudo nano /etc/metricbeat/modules.d/beat-xpack.yml
        hosts: ["http://localhost:5067","http://localhost:5068"]
        username: "beats_system"
        password: "avatar"

## 7. Validate metricbeat service is running

    systemctl status metricbeat

## 8. start filebeat
   
     systemctl start auditbeatsudp 

## 10. Stack monitoring 
## 11. Dashboards






