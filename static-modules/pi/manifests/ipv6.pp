# disable ipv6
class pi::ipv6 {

  file{'/etc/sysctl.d/disableipv6.conf':
    ensure => present
  } ->

  file_line { 'disableipv6':
    path => '/etc/sysctl.d/disableipv6.conf',
    line => 'net.ipv6.conf.all.disable_ipv6=1'
  }

  file{'/etc/modprobe.d/blacklist':
    ensure => file
  } ->

  file_line { 'disable ipv6 module':
    path => '/etc/modprobe.d/blacklist',
    line => 'blacklist ipv6'
  }
}
