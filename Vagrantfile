# -*- mode: ruby -*-
# vi: set ft=ruby :

system("scripts/install-trigger-plugin.sh")

Vagrant.configure(2) do |config|

  config.trigger.before :up do
    run  "scripts/host-prereqs.sh"
  end

  config.vm.box = "peichman-umd/ruby"

  config.vm.network "forwarded_port", guest: 80, host: 8000

  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "/apps/git/fcrepo-search", "/apps/services/fcrepo-search"

  config.vm.provision "shell", path: "scripts/passenger.sh", privileged: true
  config.vm.provision "shell", path: "scripts/nodejs.sh", privileged: true
  config.vm.provision "shell", path: "scripts/firewall.sh", privileged: true
  config.vm.provision "shell", path: "scripts/railsapp.sh", privileged: false
  config.vm.provision "file", source: 'files/fcrepo-search.env', destination: '/apps/services/fcrepo-search/.env'
end
