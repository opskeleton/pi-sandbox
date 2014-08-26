# A raspberry pie module
# trims down fat to make pie run fast/leaner
# based upon http://bit.ly/1cAd6Id
class pie {
  include pie::ssh
  # include pie::gateway
  include pie::tty
  include pie::shell
  include pie::swap
  include pie::mpsyt
  include pie::bootlog
  # include pie::zram
  include pie::ipv6

  exec{'noop scheduler':
    command => "/bin/sed -i 's/deadline/noop/g' /boot/cmdline.txt",
    user    => 'root',
    onlyif  => '/usr/bin/test -f /boot/cmdline.txt'
  }

  package{'mlocate':
    ensure  => present
  }
}
