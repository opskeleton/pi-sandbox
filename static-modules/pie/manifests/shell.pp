# enabling dash
class pie::shell {
  package{'dash':
    ensure  => present
  } ->

  exec{'dpkg-conf dash':
    command => 'dpkg-reconfigure -p critical dash',
    user    => 'root',
    path    => '/usr/sbin'
  }
}
