# Instllation and configuration of Filebeat on Web Server


## 1. Download and install public signing key 



    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

## 2. Install apt-transport-https package

    sudo apt-get install apt-transport-https -y

## 3. Save directory definitions

    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list


## 4. Update and Install elasticsearch

    sudo apt-get update 

## 5. Validate logging is configured for metricbeat

         logging.to_files: true
         logging.files:
          path: /var/log/metricbeat
          name: metricbeat
          keepfiles: 7
          permissions: 0644


## 6. Restart service for changes to take effect

      sudo systemctl restart metricbeat


## 7. Install filebeat
    
      apt-get install filebeat

## 8. Configure filebeat

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

## 9. Enable beat-pack if not already enabled 
       sudo metricbeat modules enable beat-xpack

## 10. configure beat-expack 
   
        sudo nano /etc/metricbeat/modules.d/beat-xpack.yml
        hosts: ["http://localhost:5067"]
        username: "beats_system"
        password: "avatar"

## 11. Validate metricbeat service is running

    systemctl status metricbeat

## 12. start filebeat
   
     systemctl start filebeat

## 13. enable modules
   

     sudo filebeat modules enable apache

     sudo filebeat modules enable system

## 14. Stack monitoring 
## 15. Dashboards






