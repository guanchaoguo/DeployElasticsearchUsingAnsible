# Installation and configuration of heartbeat on ELK Server


## 1. Install heartbeat
    
      sudo apt-get update && sudo apt-get install heartbeat-elastic

## 4. Configure heartbeat

   ### Live Reloadding 
      reload.enabled: true
      reload.period: 5s

   ### Kibana
       host: "localhost:5601"

   ### elasticsearch output
       hosts: ["localhost:9200"]
       protocol: "http"
       username: "elastic"
       password: "goodwitch"

   ### logging.to_files: true
        logging.level: info
        logging.to_files: true
        logging.files:
         path: /var/log/heartbeat
         name: heartbeat
         keepfiles: 7
         permissions: 0644
  ### setup monitoring through metricbeat
        http.enabled: true
        http.port: 5069

## 5. Enable beat-pack if not already enabled 
       sudo metricbeat modules enable beat-xpack

## 6. configure beat-expack 
   
        sudo nano /etc/metricbeat/modules.d/beat-xpack.yml
        hosts: ["http://localhost:5069"]
        username: "beats_system"
        password: "avatar"

## 7. Validate metricbeat service is running

    systemctl status metricbeat

## 8. start heartbeat
   
     systemctl start heartbeat-elastic

## 9. configure monitors
   
     cp sample.icmp.yml.disabled icmp.yml
     cp sample.http.yml.disabled http.yml
     cp sample.tcp.yml.disabled tcp.yml

   ### 9.1 ICMP monitor
      
      id: icmp-status
      name: icmp status check
      enabled: true
      hosts: ["192.168.2.19", "35.197.123.189"]
      tags: ["web-tier"]

   ### 9.2 http monitor
      id: web-status
      name: web status check
      enabled: true
      enabled: true
      hosts: ["http://localhost:9200", "http://localhost:5601"]
      username: 'elastic'
      password: 'goodwitch'
      tags: ["elk"]

   ### 9.3 tcp monitor
      id: ssh-status
      name: ssh status check
      enabled: true
      hosts: ["192.168.2.19:22"]
      
## 10. Stack monitoring 
## 11. Dashboards