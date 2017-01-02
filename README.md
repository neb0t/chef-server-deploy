# Chef-server autodeploy via Vagrant ans bash script.

## SPECIFICATION
Environment should have at list 1 servers with minimum requirements [chef wiki](https://docs.chef.io/chef_system_requirements.html).
Environment should be deployed via `vagrant up` command.

## SETUP REQUIRMENTS

Tools needed for Environment setup:

- Internet connection
- Centos 7 vagrant box
- Installed Virtualbox (>=5.1.12) [link](https://www.virtualbox.org/wiki/Downloads)
- Installed Vagrant (>=1.9.1 version) [link](https://www.vagrantup.com/downloads.html)
- Chef-server core rpm package [I used was 12.11.1](https://downloads.chef.io/chef-server)
- Opscode-push-jobs-server rpm package [I used 2.1.1](https://downloads.chef.io/push-jobs-server/2.1.1)

## Deploy process instruction:

Clone git project to vagrant host.

`git clone https://github.com/neb0t/chef-server-deploy.git`

- Download Chef-server core rpm package
to **cloned_folder/provision/server/rh/7**

- Download Opscode-push-jobs-server rpm package
to **cloned_folder/provision/server/rh/7**

- Switch to cloned directory and run `vagrant up`

## Basic firewall rules

You can use `iptables.sh` script to generate firewall rules.
By default I opened **22,80,443**.

## Chef Web pages access

After deploy chef-server web interface will be available at [](https://10.10.200.100) or via configured *chef.vm.hostname = "chef.example.com"* [](https://chef.example.com)

Access:

    username: admin
    password: WfxpvLZxBMG7xQEjJoFKdjwK
