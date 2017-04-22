node default {
  class{'pi::wlan':
    ssid => 'yourssid',
    psk  => 'yourpsk'
  }
}
