# Setting up wlan
class pi::wlan(
  $ssid='',
  $psk=''
){
  file { '/etc/network/interfaces':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/pi/interfaces',
    owner => root,
    group => root,
  } ->

  file { '/etc/wpa_supplicant/wpa_supplicant.conf':
    ensure=> file,
    mode  => '0644',
    content => template('wpa_supplicant.conf.erb'),
    owner => root,
    group => root,
  } ~>

  service{'networking':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }
}
