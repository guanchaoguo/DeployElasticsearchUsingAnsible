#!/bin/bash

# Shutdown script for web servers

# shutdown metricbeat 
sudo service metricbeat stop

#shutdown filebeat
sudo service filebeat stop

#shutdown auditbeat
sudo service auditbeat stop
