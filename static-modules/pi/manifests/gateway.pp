# making eth0 to wlan0 brigding see:
# 1.http://bit.ly/1mWquA5
# 2. http://bit.ly/1jpunN6
class pi::gateway(
  $address='192.168.5.1',
  $broadcast='192.168.5.255',
  $subnet='192.168.5.0/24',
  $dhcp_range ='192.168.5.10,192.168.5.20',
){

  file { '/etc/network/interfaces':
    ensure  => file,
    mode    => '0644',
    content => template('pi/interfaces.erb'),
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
  } ->

  file { '/etc/dnsmasq.conf':
    ensure  => file,
    mode    => '0644',
    content => template('pi/dnsmasq.conf.erb'),
    owner   => root,
    group   => root,
  } ~>

  service{'dnsmasq':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

  package{'ifplugd':
    ensure  => absent
  }

  service{'ifplugd':
    ensure    => stopped,
    enable    => false,
  }
}
