# -*- mode: ruby -*-
# vi: set ft=ruby :

system("scripts/install-trigger-plugin.sh")

Vagrant.configure(2) do |config|

  config.trigger.before :up do
    run  "scripts/host-prereqs.sh"
  end

  config.vm.box = "peichman-umd/ruby"

  config.vm.network "private_network", ip: "192.168.40.14"

  config.vm.synced_folder "/apps/git/fcrepo-search", "/apps/services/fcrepo-search"

  # system packages
  config.vm.provision 'puppet'

  config.vm.provision 'shell', path: 'scripts/openports.sh', args: [80]
  config.vm.provision "shell", path: "scripts/passenger.sh", privileged: true
  config.vm.provision "shell", path: "scripts/nodejs.sh", privileged: true
  config.vm.provision "file", source: 'files/fcrepo-search.env', destination: '/apps/services/fcrepo-search/.env'
  config.vm.provision "file", source: 'files/seeds.rb', destination: '/apps/services/fcrepo-search/db/seeds/vagrant.rb'
  config.vm.provision "shell", path: "scripts/railsapp.sh", privileged: false
end
