# setting up duckdns
class pi::duckdns(
  $token='',
  $domain=''
){

  file { '/usr/bin/duck.sh':
    ensure  => file,
    mode    => '+x',
    content => template('pi/duckdns.erb'),
    owner   => root,
    group   => root,
  }

  cron{'duckdns':
    command => '/usr/bin/duck.sh >/dev/null 2>&1',
    user    => 'root',
    minute  => '*/5'
  }
}
