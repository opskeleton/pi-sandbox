# tty disabling
class pi::tty {

  exec{'remove extra ttys':
    command => "sed -i '/[2-6]:23:respawn:\\/sbin\\/getty 38400 tty[2-6]/s%^%#%g' /etc/inittab",
    user    => 'root',
    path    => ['/usr/bin','/bin',]
  }

  exec{'disable gettty on serial line':
    command => "sed -i '/T0:23:respawn:\\/sbin\\/getty -L ttyAMA0 115200 vt100/s%^%#%g' /etc/inittab",
    user    => 'root',
    path    => ['/usr/bin','/bin',]
  }
}
