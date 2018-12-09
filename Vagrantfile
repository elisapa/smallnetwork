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

  config.vm.define "hr" do |hr|
    hr.vm.box = "generic/debian9"
    hr.vm.provision "shell", inline: <<-SHELL
      echo 'deb http://httpredir.debian.org/debian jessie-backports main' >> sudo /etc/apt/sources.list
      echo 'deb http://httpredir.debian.org/debian stretch main' >> sudo /etc/apt/sources.list
      sudo apt-get update
      sudo apt-get -y install salt-minion
      echo -e 'master: 192.168.43.143\nid: hr'|sudo tee /etc/salt/minion
      sudo systemctl restart salt-minion    
    SHELL
  end

  config.vm.define "dev" do |dev|
    dev.vm.box = "bento/centos-7.2"
    dev.vm.provision "shell", inline: <<-SHELL
      sudo yum -y update
      wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
      rpm -ivh epel-release-latest-7.noarch.rpm
      sudo rpm -ivh epel-release-latest-7.noarch.rpm
      sudo yum -y install salt-minion
      echo -e 'master: 192.168.43.143\nid: dev'|sudo tee /etc/salt/minion
      sudo systemctl restart salt-minion
    SHELL
  end
end

