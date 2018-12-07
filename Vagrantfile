Vagrant.configure("2") do |config|
  config.vm.define "web" do |web|
    web.vm.box = "bento/ubuntu-16.04"
    web.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get -y install salt-minion
      echo -e 'master: 192.168.43.143\nid: web'|sudo tee /etc/salt/minion
      sudo systemctl restart salt-minion
    SHELL
  end

  config.vm.define "db" do |db|
    db.vm.box = "bento/ubuntu-14.04"
    db.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get -y install salt-minion
      echo -e 'master: 192.168.43.143\nid: db'|sudo tee /etc/salt/minion
      sudo service salt-minion restart
    SHELL
  end
end

