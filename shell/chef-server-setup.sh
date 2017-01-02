#!/bin/bash

echo "==> Installing epel repository ..."
yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

echo "==> Installing rpm packages ..."
yum -y install wget curl crontabs iptables-services

echo "==> Installing chef-server from provision location ..."
cd /home/vagrant/provision
rpm -ivh server/rh/7/chef-server-core-*.rpm

echo "==> Configuring firewall part ..."
sudo sh -c 'iptables-restore -t < /etc/sysconfig/iptables'

echo "==> Flushing iptables ..."
iptables -F

echo "==> Configuring chef-server ..."
chef-server-ctl reconfigure
chef-server-ctl user-create admin John Smith john.smith@example.com 'WfxpvLZxBMG7xQEjJoFKdjwK' --filename /home/vagrant/john.pem
chef-server-ctl org-create chef 'Chef' --association_user admin --filename /home/vagrant/chef-john-validator.pem
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure --accept-license
rpm -ivh server/rh/7/opscode-push-jobs-server-*.rpm
chef-server-ctl install opscode-push-jobs-server
chef-server-ctl reconfigure
opscode-push-jobs-server-ctl reconfigure
chef-server-ctl install opscode-reporting
chef-server-ctl reconfigure
opscode-reporting-ctl reconfigure --accept-license