# -*- mode: ruby -*-
# vi: set ft=ruby :

update_deb = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak s/http.debian.net/ftp.au.debian.org/g /etc/apt/sources.list
  sudo apt update
  touch /tmp/up
fi
SCRIPT


Vagrant.configure("2") do |config|

  device = ENV['VAGRANT_BRIDGE'] || 'eth0'

  Dir['manifests/*'].map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node|
	node.vm.box = "Debian-8.0.0-amd64"
	node.vm.hostname = "#{type}.local"
	node.vm.network :public_network, :bridge => device, :dev => device

	node.vm.provider :libvirt do |domain, o|
	  domain.uri = 'qemu+unix:///system'
	  domain.host = "#{type}.local"
	  domain.memory = 2048
	  domain.cpus = 2
	  domain.storage_pool_name = 'default'
	  o.vm.synced_folder './', '/vagrant', type: 'nfs'
	end

	node.vm.provision :shell, :inline => update_deb
	node.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = "#{type}.pp"
	  puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=dev"
	end
    end
  end



end
