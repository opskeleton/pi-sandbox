group{ 'puppet': ensure  => present }

node 'pi.local' {
  include pi
}
