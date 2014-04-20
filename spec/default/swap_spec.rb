require 'spec_helper'

describe package('dphys-swapfile') do
  it { should be_installed }
end

describe file('/etc/dphys-swapfile') do
  it {should be_file }
  its(:content) { should match /CONF_SWAPSIZE=512/ }
end

describe file('/etc/sysctl.conf') do
  it {should be_file}
  its(:content) { should match /vm.swappiness=1/ }
  its(:content) { should match /vm.vfs_cache_pressure=50/ }
end
