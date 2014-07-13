# making eth0 to wlan0 brigding see http://bit.ly/1mWquA5
class pie::gateway(
  $wlan_gateway='192.168.4.1',
  $eth0_address='192.168.5.1',
  $eth0_subnet='192.168.5.0/24',
  $dhcp_range ='192.168.5.10,192.168.5.20',
){
  file { '/etc/network/interfaces':
    ensure  => file,
    mode    => '0644',
    content => template('pie/interfaces.erb'),
    owner   => root,
    group   => root,
  } ~>

  service{'networking':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

  package{'dnsmasq':
    ensure  => present
  }

  package{'ifplugd':
    ensure  => absent
  }
}
