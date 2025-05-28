# -*- mode: ruby -*-
# vi: set ft=ruby :
VM_LIST = {
  "rocky" => {
    :ip => "192.168.56.3",
    :cpus => 8,
    :memory => 32_768,
    :disksize => "500GB"
  }
}

Vagrant.configure("2") do |config|
  VM_LIST.each do |hostname, opts|
    config.vm.define hostname do |node|
      node.vm.box = "generic/rocky8"
      node.vm.hostname = hostname
      node.vm.network :private_network, ip: opts[:ip]
      node.vm.disk :disk, size: opts[:disksize], primary: true
      node.vm.provision "shell", path: "./shell/ssh.sh", args: opts[:ip]
      node.vm.provision "shell", path: "./shell/setup.sh"

      node.vm.provider "virtualbox" do |vbox|
        vbox.customize [
          "modifyvm", :id, "--nested-hw-virt", "on"
        ]
        vbox.gui = false
        vbox.cpus = opts[:cpus]
        vbox.memory = opts[:memory]
      end
    end
  end
end