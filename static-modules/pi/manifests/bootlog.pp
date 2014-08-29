# setting up bootlogd
class pi::bootlog {

  package{'bootlogd':
    ensure  => present
  } ->

  file{'/etc/default/bootlogd':
    ensure  => file
  } ->

  file_line { 'bootlog enable':
    path => '/etc/default/bootlogd',
    line => 'BOOTLOGD_ENABLE=yes'
  }
}
