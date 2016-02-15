# Parameters for ngircd

class ngircd::params {

  $package_version = 'present'

  $config_file = $::osfamily ? {
    'Debian' => '/etc/ngircd/ngircd.conf',
    default => '/etc/ngircd.conf'
  }

  $conf_d = $::osfamily ? {
    'Debian' => '/etc/ngircd/conf.d',
    default => '/etc/ngircd.conf.d'
  }

  $user = $::osfamily ? {
    'Debian' => 'irc',
    default => 'ngircd'
  }

  $group = $::osfamily ? {
    'Debian' => 'irc',
    default => 'ngircd'
  }

  $package_name = $::osfamily ? {
    'Debian' => 'ngircd',
    default => 'ngircd'
  }

  $service_name = $::osfamily ? {
    'Debian' => 'ngircd',
    default => 'ngircd'
  }

  $pid_file = $::osfamily ? {
    'Debian' => '/var/run/ngircd/ngircd.pid',
    default => '/var/run/ngircd/ngircd.pid'
  }

  $bind = [ '0.0.0.0' ]
  $server_name = $::fqdn
  $ports = [ 6667 ]
  $ssl = false
  $ssl_ports = [ 7000 ]
  $admin1 = ''
  $admin2 = ''
  $info = ''
  $admin = "root@${server_name}"
  $motd = ''
  $ipv6 = false
  $ipv4 = true
  $allowed_channel_types = '#'
  $dns = 'yes'
  $ident = 'yes'
  $certfile = undef
  $keyfile = undef
  $keyfilepassword = undef
  $ciphers = 'HIGH:!aNULL:@STRENGTH:!SSLv3'
  $dhfile = undef

}
