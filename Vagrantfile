# -*- mode: ruby -*-
# vi: set ft=ruby :

system("scripts/install-trigger-plugin.sh")

Vagrant.configure(2) do |config|

  config.trigger.before :up do
    run  "scripts/host-prereqs.sh"
  end

  config.vm.box = "peichman-umd/ruby"

  config.vm.network "private_network", ip: "192.168.40.14"

  config.vm.hostname = 'archelonlocal'

  config.vm.synced_folder "/apps/git/archelon-env", "/apps/git/archelon-env"
  config.vm.synced_folder "/apps/git/archelon", "/apps/archelon/src"
  config.vm.synced_folder "dist", "/apps/dist"

  # system packages
  config.vm.provision 'puppet'

  # git config
  config.vm.provision 'shell', path: 'scripts/git.sh', args: [`git config user.name`, `git config user.email`],
    privileged: false
  # runtime environment
  config.vm.provision 'shell', path: 'scripts/env.sh'

  # firewall
  config.vm.provision 'shell', path: 'scripts/openports.sh', args: [80, 443]
  # Apache configuration
  config.vm.provision 'shell', path: 'scripts/apache.sh'
  # create self-signed certificate for Apache
  config.vm.provision "shell", path: "scripts/https-cert.sh"
  # NodeJS
  config.vm.provision "shell", path: "scripts/nodejs.sh"
  # mod_passenger
  config.vm.provision "shell", path: "scripts/passenger.sh"
  # Rails app config
  config.vm.provision "file", source: 'files/archelon.env', destination: '/apps/archelon/src/.env'
  config.vm.provision "file", source: 'files/seeds.rb', destination: '/apps/archelon/src/db/seeds/vagrant.rb'
  config.vm.provision "shell", path: "scripts/railsapp.sh", privileged: false

  # server specific values
  config.vm.provision 'file', source: 'files/env', destination: '/apps/archelon/config/env'
  # XXX: workaround for https://github.com/mitchellh/vagrant/issues/8096
  # force the IP address of the private network interface
  config.vm.provision 'shell', inline: 'ip addr replace 192.168.40.14 dev enp0s8', run: 'always'
  # application startup
  config.vm.provision 'shell', inline: 'cd /apps/archelon/apache && ./control start', privileged: false
end
