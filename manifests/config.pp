class mod_adlog::config {
    file { $mod_adlog::params::config_file:
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 640,
        content => template("${module_name}/lighttpd.conf.erb"),
        require => Class['mod_adlog::install'],
        notify  => Class['mod_adlog::service'],
    }

    file { '/var/www/test.txt':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 644,
        content => 'this is a nagios check_http check file, do not remove!',
        require => Class['mod_adlog::install'],
    }
}
