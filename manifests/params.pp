class mod_adlog::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'lighttpd-mod-adlog'
            $service_name = 'lighttpd'
            $config_file = '/etc/lighttpd/lighttpd.conf'
        }
    }
}
