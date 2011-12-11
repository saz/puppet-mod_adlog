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
class mod_adlog ($bind = $::ipaddress, $lb_bind = false, $ssl_cert = false, $ssl_ca = false, $host = 'localhost', $user = 'root', $password = 'password', $db = 'adserv', $table = 'stats') {
    include mod_adlog::params, mod_adlog::install, mod_adlog::config, mod_adlog::service
}
