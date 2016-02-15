# Define our peer (irc server)

define ngircd::server(
  $host = $name,
  $port = 6667,
  $remote_password = undef,
  $local_password = undef,
  $bind = undef,
  $passive = 'no',
  $group = '1',
  $service_mask = undef,
  $ssl = 'no',
) {

  include 'ngircd'

  concat::fragment { "server_${name}":
    target  => $ngircd::params::config_file,
    content => template("${module_name}/server.erb"),
    order   => '05',
  }

}
