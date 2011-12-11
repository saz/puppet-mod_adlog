class mod_adlog::service {
    service { $mod_adlog::params::service_name:
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Class['mod_adlog::config'],
    }
}
