# Instllation and configuration of Filebeat on ELK Server

## 1. Validate logging is configured for 

  ### 1.1 Elasticsearch 
    
         path.logs: /var/log/elasticsearch

  ### 1.2 Kibana

  ####   1.2.1 configure Kibana logging
         logging.dest: /var/log/kibana    
         logging.rotate.enabled: true
         logging.rotate.keepFiles: 7

  ####   1.2.2 Create kibana file
         
         touch /var/log/kibana
         chown kibana:kibana /var/log/kibana

  ### 1.3 Metricbeat

         logging.to_files: true
         logging.files:
          path: /var/log/metricbeat
          name: metricbeat
          keepfiles: 7
          permissions: 0644


## 2. Restart service for changes to take effect

      sudo systemctl restart elasticsearch
      sudo systemctl restart kibana
      sudo systemctl restart metricbeat


## 3. Install filebeat
    
      apt-get install filebeat

## 4. Configure filebeat

   ### Live Reloadding 
      reload.enabled: true
      reload.period: 10s

   ### Setup dashboards
       setup.dashboards.enabled: true

   ### Kibana
       host: "localhost:5601"

   ### elasticsearch output
       hosts: ["localhost:9200"]
       protocol: "http"
       username: "elastic"
       password: "goodwitch"

   ### logging.to_files: true
        logging.files:
        path: /var/log/filebeat
        name: filebeat
        keepfiles: 7
        permissions: 0644
  ### setup monitoring through metricbeat
        http.enabled: true
        http.port: 5067

## 5. Enable beat-pack if not already enabled 
       sudo metricbeat modules enable beat-xpack

## 6. configure beat-expack 
   
        sudo nano /etc/metricbeat/modules.d/beat-xpack.yml
        hosts: ["http://localhost:5067"]
        username: "beats_system"
        password: "avatar"

## 7. Validate metricbeat service is running

    systemctl status metricbeat

## 8. start filebeat
   
     systemctl start filebeat

## 9. enable modules
   
     sudo filebeat modules enable elasticsearch

     sudo filebeat modules enable kibana

     sudo filebeat modules enable system

## 10. Stack monitoring 
## 11. Dashboards






