Vagrant.configure("2") do |config|
  config.vm.define "web" do |web|
    web.vm.box = "bento/ubuntu-16.04"
    web.vm.hostname = 'web'
    
    web.vm.network :private_network, ip: "192.168.43.101"

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "web"]
    web.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update
        sudo apt-get -y install salt-minion
        echo -e 'master: 127.0.0.1\nid: web'|sudo tee /etc/salt/minion
        sudo systemctl restart salt-minion
      SHELL
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "debian/jessie64"
    db.vm.hostname = 'db'

    db.vm.network :private_network, ip: "192.168.43.102"

    db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "db"]
    db.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update
        sudo apt-get -y install salt-minion
        echo -e 'master: 127.0.0.1\nid: db'|sudo tee /etc/salt/minion
        sudo systemctl restart salt-minion
      SHELL
    end
  end
end

