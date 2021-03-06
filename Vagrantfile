# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # ### WEB VM ###
  config.vm.define "web" do |web|
    # Configure the virtual machine to use 1.5GB of RAM
    web.vm.provider :virtualbox do |vb|
      vb.memory = "2048"
    end

    web.vm.box = "ubuntu/xenial64"
    web.vm.hostname = "web"

    web.vm.network "private_network", ip: "192.168.33.10"
    web.vm.network :forwarded_port, guest: 3000, host: 4000
    web.vm.synced_folder ".", "/home/vagrant/myapp", owner: "vagrant",
      group: "vagrant"
    web.vm.synced_folder ".", "/vagrant", disabled: true

    # Define Ruby Version
    RUBY_MAJOR = '2.6'
    RUBY_VER   = '2.6.5'
    BUNDLER_VER = ''
    RAILS_VER = '6.0.2.1'
    web.vm.provision "shell", path: "vagrant/scripts.sh", args: [RUBY_MAJOR, RUBY_VER, RAILS_VER]
  end

  # ### DB Master VM ###
  config.vm.define "db" do |db|
    db.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end

    db.vm.box = "bigdeal/mysql57"
    db.vm.hostname = "db"

    db.vm.network "private_network", ip: "192.168.33.11"
    db.vm.network :forwarded_port, guest: 3306, host: 33006
    db.vm.synced_folder ".", "/vagrant", disabled: true
  end

  # ### DB Slave VM ###
  config.vm.define "dbslave" do |dbslave|
    dbslave.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end

    dbslave.vm.box = "bigdeal/mysql57"
    dbslave.vm.hostname = "dbslave"

    dbslave.vm.network "private_network", ip: "192.168.33.12"
    dbslave.vm.network :forwarded_port, guest: 3306, host: 33007
    dbslave.vm.synced_folder ".", "/vagrant", disabled: true
  end
end
