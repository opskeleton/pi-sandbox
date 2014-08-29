# enabling dash
class pi::shell {
  package{'dash':
    ensure  => present
  } ->

  exec{'dpkg-conf dash':
    command => 'dpkg-reconfigure -p critical dash',
    user    => 'root',
    path    => ['/usr/sbin', '/usr/bin']
  }
}
