require 'spec_helper'

describe package('dropbear') do
  it { should be_installed }
end

describe file('/etc/default/dropbear') do
  it { should be_file }
  # its(:content) { should match /NO_START=0/ }
  # its(:content) { should match /DROPBEAR_PORT=2222/ }
end
