# clearing pi user and adding specified user
class pi::users($user = undef){
  user{'pi':
    ensure     => absent,
    managehome => true,
    home       => '/home/pi'
  } ~>

  exec{'purge pi home':
    command      => 'rm -rf /home/pi',
    user         => 'root',
    path         => ['/usr/bin','/bin',],
    refresh_only => true
  }

  user{$user:
    ensure     => present,
    comment    => 'Local pi admin',
    managehome => true,
    home       => "/home/${user}"
  } ->

  file_line { "${user} sudoer":
    path => '/etc/sudoers',
    line => "${user} ALL=(ALL) NOPASSWD: ALL"
  }
}
