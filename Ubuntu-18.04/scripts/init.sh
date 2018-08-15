#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# Set up vagrant insecure key for first login.
install -d -o vagrant -g vagrant -m 700 /home/vagrant/.ssh
install -o vagrant -g vagrant -m 600 /tmp/vagrant.pub /home/vagrant/.ssh/authorized_keys

apt update
apt upgrade -y
