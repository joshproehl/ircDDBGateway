#!/bin/bash

# Setup scrip to make host ready for running hand built ircDDBGateway
# Run after binary built and installed in /usr/bin

# Create opendv user/group for ircddbgateway to run under
sudo adduser opendv --system
sudo addgroup opendv
sudo adduser opendv opendv

# Setup opendv log directory
sudo mkdir /var/log/opendv
sudo chown opendv:opendv /var/log/opendv
sudo chmod 755 /var/log/opendv

# Put in place all the shared files (default voice)
sudo mkdir /usr/share/opendv
sudo cp ./share/* /usr/share/opendv

# Put config and make config directory
sudo mkdir /etc/opendv
sudo cp ./ircddbgateway.example /etc/opendv/ircddbgateway

# Put rotate log in place
sudo cp ./ircddbgatewayd.rotate /etc/logrotate.d/ircddbgatewayd 

# Put systemd config in place
sudo cp ./ircddbgatewayd.service /etc/systemd/system/

# now enable ircddbgateway to start
sudo systemctl enable ircddbgatewayd.service
