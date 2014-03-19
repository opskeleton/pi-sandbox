# trims down fat to make pie run fast/leaner based upon http://bit.ly/1cAd6Id
class pie::slimdown {
  package{['curl', 'ntp', 'ntpdate', 'ca-certificates', 'binutils']:
    ensure  => present
  }

  package{['openssh-client', 'dropbear']:
    ensure  => present
  } ->

  exec{'enable dropbear':
    command => "sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear",
    user    => 'root',
    path    => ['/bin']
  } ->

  exec{'set port 2222':
    command => "sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=2222/g' /etc/default/dropbear",
    user    => 'root',
    path    => '/bin',
  } ->

  service{'dropbear':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

  if($environment != 'dev'){
    package{'raspi-config':
      ensure  => present
    }

    service{'ssh':
      ensure    => stopped,
      enable    => false,
    } ->

    package{'openssh-server':
      ensure  => absent
    }
  }
}
