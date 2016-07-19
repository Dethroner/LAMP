#!/usr/bin/env bash

# Install ansible
echo "[Info] Install ansible..."
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
apt-get -y install sshpass

# copy examples into /home/vagrant (from inside the master node)
cp -a /vagrant/examples/config/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant
chmod -x /home/vagrant/production

# configure hosts file for internal network defined by Vagrantfile
cat /vagrant/examples/nodes >> /etc/hosts
