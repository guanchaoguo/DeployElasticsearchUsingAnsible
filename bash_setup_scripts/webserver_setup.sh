#!/bin/bash


package_installed=(apache metricbeat filebeat auditbeat)


# add Elastic’s signing key so that the downloaded package can be verified
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# add the repository definition to your system

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

# The following code updates linux distribution and installs apache2

sudo apt-get update 

for package in ${package_installed[@]}; 
do 
    if dpkg -l | grep $package
        then 
            echo "$package is already installed, skipping......."
        else
            echo "$package is not installed , installing ......"

            if [ $package=apache ] 
                then
                echo "installaing $package"
                sudo apt-get install apache2 -y
                # Adds a simple hellow world web page to apache home
                echo '<!doctype html><html><body><h1>Hello World!</h1></body></html>' | sudo tee /var/www/html/index.html
            elif [ $package=metricbeat ]
                then   
                echo "installaing $package"
                # Installs metric beat
                sudo apt install metricbeat -y
                # Configure metric beat
                ## update elasticsearch and kibana entries in metricbeat.
                echo "Configuring Metricbeat"
                sudo sed -i -e 's/#host: "localhost:5601"/host: 192.168.29.4:5601/;s/localhost:9200/192.168.29.4:9200/' /etc/metricbeat/metricbeat.yml
                ## enable apache module 
                sudo metricbeat modules enable apache 
                ## start metricbeat and enable it to start automatically on system boot
                sudo systemctl start metricbeat
                sudo /bin/systemctl enable metricbeat.service
            elif [ $package=filebeat ]
                then
                echo "installaing $package"
                # Installs files beat   
                sudo apt install filebeat -y
            elif [ $package=auditbeat ]
                then
                echo "installaing $package"
                #Installs Auditbeat
                sudo apt install auditbeat -y
            fi
    fi;
done 





