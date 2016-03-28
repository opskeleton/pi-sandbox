node default {
  class{'pi::wpa':
    ssid => 'yourssid',
    psk  => 'yourpsk'
  }
}
