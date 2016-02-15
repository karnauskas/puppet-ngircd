# Defined type for IRC channel.

define ngircd::channel(
  $topic = undef,
  $modes = undef,
  $key = undef,
  $keyfile = undef,
  $max = 0,
) {

  include 'ngircd'
  
  concat::fragment { "chan_${name}":
    target  => $ngircd::params::config_file,
    content => template("${module_name}/channel.erb"),
    order   => '08',
  }

}
