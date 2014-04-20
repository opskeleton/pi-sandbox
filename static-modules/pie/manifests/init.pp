# A raspberry pie module
class pie {
  include pie::ssh
  include pie::tty
  include pie::shell
  include pie::swap
}
