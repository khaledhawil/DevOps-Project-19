#!/bin/bash

# Basic setup script - just install essential packages and enable SSH
sudo yum update -y
sudo yum install -y python3 python3-pip

# Install Ansible on the EC2 instance (optional, for local execution)
sudo pip3 install ansible

# Create a flag file to indicate basic setup is complete
touch /tmp/basic-setup-complete

echo "Basic setup completed. Ready for Ansible configuration."
