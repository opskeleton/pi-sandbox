if cat /proc/version | grep Ubuntu
then
  group add puppet
  sudo apt-get install git ruby1.9.1 ruby1.9.1-dev rubygems -y
fi

if [ -f /etc/debian_version ]; then
  group add puppet
  sudo apt-get install git ruby1.9.1 ruby1.9.1-dev rubygems -y
fi

if cat /proc/version | grep Red
then
  groupadd puppet
  sudo yum install git ruby.x86_64 ruby-devel.x86_64 rubygems.noarch -y
fi

sudo gem install puppet --no-ri --no-rdoc --version '= 3.4.3'
sudo gem install ruby-shadow --no-ri --no-rdoc --version '= 2.2.0'