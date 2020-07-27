# Instllation and configuration of packetbeat on ELK Server




## Install packetbeat

    sudo apt-get install packetbeat

## Configure Metribeat

    sudo su
    cd /etc/packetbeat

    nano packetbeat.yml

        packetbeat.interfaces.device: any
      # comment out unecessary protocols
        tags: ["web-tier"]
        setup.dashboards.enabled: true

        host: "192.168.1.34:5601"

        output.elasticsearch:
        # Array of hosts to connect to.
        hosts: ["192.168.1.34:9200"]

        # Protocol - either `http` (default) or `https`.
        protocol: "http"

        # Authentication credentials - either API key or username/password.
        #api_key: "id:api_key"
        username: "elastic"
        password: "goodwitch"

        
## Start packetbeat

    sudo systemctl start packetbeat

## 5. Enable beat-pack if not already enabled 
       sudo metricbeat modules enable beat-xpack

## 6. configure beat-expack 
   
        sudo nano /etc/metricbeat/modules.d/beat-xpack.yml
        hosts: ["http://localhost:5070"]
        username: "beats_system"
        password: "avatar"

## 7. Validate metricbeat service is running

    systemctl status metricbeat


