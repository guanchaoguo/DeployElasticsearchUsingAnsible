#!/bin/bash


# add packages that need to be installed to a variable
package_installed=(elasticsearch logstash kibana)

# update system
sudo apt-get update 

# Check if the package is already installed and if not install the package 
for package in ${package_installed[@]}; 
do 
    if dpkg -l | grep $package
        then 
            echo "$package is already installed, skipping......."

        else
            echo "$package is not installed , installing ......"

                # Install Java 
                sudo apt install openjdk-8-jdk -y

                # Add elaticsearch repository 
                wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

                sudo apt-get install apt-transport-https -y

                echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

                
                # Install elasticsearch 
                sudo apt-get update -y && sudo apt-get install elasticsearch -y

                # Install JRE 
                sudo apt-get install default-jre -y

                # Install Logstash 
                sudo apt-get install logstash -y

                # Install Kibana
                sudo apt-get install kibana -y
    fi;
done

