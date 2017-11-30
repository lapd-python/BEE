#!/bin/sh

# Install necessary libraries
pip install pyro4 
pip install boto3 
pip install termcolor
pip install tabulate
pip install pexpect


# Remove old files
rm -rf ~/.bee

# Create new directory
mkdir ~/.bee
mkdir ~/.bee/ssh_key
mkdir ~/.bee/vm_imgs
mkdir ~/.bee/tmp

# Create SSH Key
ssh-keygen -t rsa -f ~/.bee/ssh_key/id_rsa -q -P ""

# Setup SSH config
echo "Host *" >> ~/.bee/ssh_key/config
echo "     Port 22" >> ~/.bee/ssh_key/config
echo "     StrictHostKeyChecking no" >> ~/.bee/ssh_key/config
echo "     UserKnownHostsFile=/dev/null" >> ~/.bee/ssh_key/config