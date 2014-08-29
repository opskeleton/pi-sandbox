# A raspberry pie module
# trims down fat to make pie run fast/leaner
# based upon http://bit.ly/1cAd6Id
class pi {
  include pi::ssh
  # include pie::gateway
  include pi::tty
  include pi::shell
  include pi::swap
  include pi::mpsyt
  include pi::bootlog
  # include pi::zram
  include pi::ipv6

  exec{'noop scheduler':
    command => "/bin/sed -i 's/deadline/noop/g' /boot/cmdline.txt",
    user    => 'root',
    onlyif  => '/usr/bin/test -f /boot/cmdline.txt'
  }

  package{'mlocate':
    ensure  => present
  }
}
