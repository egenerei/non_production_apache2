Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.ssh.insert_key = false
  config.vm.hostname = "web1" # Set the hostname

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.memory = "1024"
    vb.cpus = 12  
  end

  config.vm.provision "shell", inline: <<-SCRIPT  
    ip route replace default via 192.168.1.1 dev eth1 
    timedatectl set-timezone Europe/Madrid
  SCRIPT

  config.vm.define "web_non_production" do |web1|
    web1.vm.network "public_network", ip: "192.168.1.40", bridge: "enp6s0"
  end

end
