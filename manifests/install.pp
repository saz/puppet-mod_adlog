class mod_adlog::install {
    package { $mod_adlog::params::package_name:
        ensure => present,
    }
}
