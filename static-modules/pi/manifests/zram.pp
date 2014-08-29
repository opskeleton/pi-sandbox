# Setting up zram see http://bit.ly/1puJ8R7
class pi::zram {
  file { '/etc/init.d/zram':
    ensure=> file,
    mode  => 'a+x',
    source=> 'puppet:///modules/pi/zram',
    owner => root,
    group => root,
  } ->

  service{'zram':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

}
