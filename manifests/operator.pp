# Add server operator.

define ngircd::operator(
  $password,
  $mask = '*!*@*',
) {

  include 'ngircd'

  concat::fragment { "oper_${name}":
    target  => $ngircd::params::config_file,
    content => template("${module_name}/operator.erb"),
    order   => '06',
  }

}
