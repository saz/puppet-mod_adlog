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
}
