Vagrant.configure(2) do |config|

  config.vm.define "chef" do |chef|
      chef.vm.network "private_network", ip:"10.10.200.100",
        nic_type: "virtio"
      chef.vm.hostname = "chef.example.com"
      chef.vm.box = "cent0s7"
      chef.vm.synced_folder ".", "/vagrant", disabled: true
      chef.vm.box_check_update = false
      chef.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.name = "chef-server"
      end
      chef.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
      chef.vm.provision "file", source: "provision", destination: "/home/vagrant/"
      chef.vm.provision "shell", path: "shell/chef-server-setup.sh"
      chef.vm.provision "shell", path: "shell/iptables.sh"
      chef.vm.provision "shell", inline: "reboot"
  end

end
