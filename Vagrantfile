Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos8"
  config.vm.define "puppet"
  config.vm.hostname = "puppet-gd-01"

  ### --- NETWORK FORWARD --- ###
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  #### --- PROVISION PUPPET CLIENT --- ###
  config.vm.provision "shell", path: "./bootstrap.sh"
  
  ### --- PROVISION WITH PUPPET --- ###
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "site"
    puppet.synced_folder_type = "rsync"
    # puppet.options = "--verbose --debug"
  end
end
