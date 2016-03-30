require 'spec_helper'

describe file('/etc/wpa_supplicant/wpa_supplicant.conf') do
  it { should be_file }
  its(:content) { should match /psk="1234"/ }
end
