# == Class: ngircd
#
# ngircd class installs, configures and starts ngircd service.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ngircd:
#    ports => [ 6667, 6668 ],
#  }
#
# === Authors
#
# Marius Karnauskas <marius.karnauskas@gmail.com>
#
# === Copyright
#
# Copyright 2014 Marius Karnauskas
#
class ngircd(
  $server_name = $::ngircd::params::server_name,
  $ports = $::ngircd::params::ports,
  $bind = $::ngircd::params::bind,
  $admin1 = $::ngircd::params::admin1,
  $admin2 = $::ngircd::params::admin2,
  $admin = $::ngircd::params::admin,
  $motd = $::ngircd::params::motd,
  $info = $::ngircd::params::info,
  $ipv6 = $::ngircd::params::ipv6,
  $ipv4 = $::ngircd::params::ipv4,
  $allowed_channel_types = $::ngircd::params::allowed_channel_types,
  $dns = $::ngircd::params::dns,
  $network = $::ngircd::params::network,
  $ident = $::ngircd::params::ident,
  $ssl = $::ngircd::params::ssl,
  $ssl_ports = $::ngircd::params::ssl_ports,
  $certfile = $::ngircd::params::certfile,
  $keyfile = $::ngircd::params::keyfile,
  $keyfilepassword = $::ngircd::params::keyfilepassword,
  $ciphers = $::ngircd::params::ciphers,
  $dhfile = $::ngircd::params::dhfile,
  $user = $::ngircd::params::user,
  $group = $::ngircd::params::group,
  $package_name = $::ngircd::params::package_name,
  $package_version = $::ngircd::params::package_version,
  $conf_d = $::ngircd::params::conf_d,
) inherits ::ngircd::params {

  package { $package_name:
    ensure => $package_version,
  } ~>

  file { $conf_d:
    ensure => directory,
    owner  => 0,
    group  => $group,
    mode   => '0755',
  }

  $ipv4_str = bool2str($ipv4, 'yes', 'no')
  $ipv6_str = bool2str($ipv6, 'yes', 'no')

  concat { $ngircd::params::config_file:
    owner   => 0,
    group   => $group,
    mode    => '0660',
    warn    => true,
    require => Package[$package_name],
  }

  concat::fragment { 'main':
    target  => $ngircd::params::config_file,
    order   => '01',
    content => template("${module_name}/global.erb"),
  }

  service { $ngircd::params::service_name:
    ensure    => running,
    enable    => true,
    require   => [
      Concat[$ngircd::params::config_file]
    ],
    subscribe => Concat[$ngircd::params::config_file]
  }

}
