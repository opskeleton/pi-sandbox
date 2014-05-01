# A raspberry pie module
# trims down fat to make pie run fast/leaner
# based upon http://bit.ly/1cAd6Id
class pie {
  include pie::ssh
  include pie::tty
  include pie::shell
  include pie::swap
  include pie::mpsyt
  include pie::zram
  include ipv6

  exec{'noop scheduler':
    command => "sed -i 's/deadline/noop/g' /boot/cmdline.txt",
    user    => 'root',
    path    => ['/usr/bin','/bin',]
  }
}
