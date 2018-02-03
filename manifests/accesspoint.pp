node default {
  include pi::hostapd
  include pi::nat
  include pi::ipv6
  include pi::profiles::medium
  class{'pi::gateway':
    wireless => true
  }
}
