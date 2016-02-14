# ssl configuration

define ngircd::ssl(
  $certfile = undef,
  $keyfile = undef,
  $keyfilepassword = undef,
  $ciphers = [ 'SECURE128' ],
  $dhfile = undef,
  $ports = [],
) {

  include 'ngircd'

  concat::fragment { 'ssl':
    target  => $::ngircd::param::config_file,
    content => template("${module_name}/ssl.erb"),
    order   => '04',
  }

}
