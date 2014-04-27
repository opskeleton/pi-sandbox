# A raspberry pie module
class pie {
  include pie::ssh
  include pie::tty
  include pie::shell
  include pie::swap
  # include pie::mpsyt
  include pie::zram
  include ipv6
}
