group{ 'puppet': ensure  => present }

node 'pie.local' {
  class{'pie::wpa':
    $ssid => 'yourssid',
    $psk  => 'yourpsk'
  }
}
