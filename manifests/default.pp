group{ 'puppet': ensure  => present }

node default {
  include pi
}
