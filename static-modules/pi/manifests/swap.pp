# Swap enabling and settings
class pi::swap {
  package{'dphys-swapfile':
    ensure  => present
  } ->

  file{'/etc/dphys-swapfile':
    ensure  => file
  }

  file_line { 'swapsize':
    path => '/etc/dphys-swapfile',
    line => 'CONF_SWAPSIZE=512'
  } ->

  exec{'dphys-swapfile setup':
    user    => 'root',
    path    => ['/sbin/']
  } ->

  exec{'dphys-swapfile swapon':
    user    => 'root',
    path    => ['/sbin/']
  }

  # more swap usage
  file_line { 'swappiness':
    path => '/etc/sysctl.conf',
    line => 'vm.swappiness=1',
    notify => Exec['sysctl -p']
  }

  file_line { 'cache_pressure':
    path   => '/etc/sysctl.conf',
    line   => 'vm.vfs_cache_pressure=50',
    notify => Exec['sysctl -p']
  }

  exec{'sysctl -p':
    user    => 'root',
    path    => '/sbin/'
  }

}
