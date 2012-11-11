# Class: mod_adlog
#
# This module manages mod_adlog
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class mod_adlog (
  $bind = $::ipaddress,
  $lb_bind = false,
  $ssl_cert = false,
  $ssl_ca = false,
  $host = 'localhost',
  $user = 'root',
  $password = 'password',
  $db = 'adserv',
  $table = 'stats'
) inherits mod_adlog__params {

  package { $mod_adlog::params::package_name:
    ensure => installed,
  }

  file { $mod_adlog::params::config_file:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 640,
    content => template("${module_name}/lighttpd.conf.erb"),
    require => Package[$mod_adlog::params::package_name],
    notify  => Service[$mod_adlog::params::service_name],
  }

  file { '/var/www/test.txt':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 644,
    content => 'this is a nagios check_http check file, do not remove!',
    require => File[$mod_adlog::params::config_file],
    notify  => Service[$mod_adlog::params::service_name],
  }

  service { $mod_adlog::params::service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File['/var/www/test.txt'],
  }
}
