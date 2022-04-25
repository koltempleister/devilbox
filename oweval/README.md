## xdebug settings

in cfg/php-<version>/<filename>.ini

    xdebug.mode                 =  develop,debug
    xdebug.client_port          = 9003
    xdebug.start_with_request   = yes
    xdebug.idekey               = PHPSTORM
    xdebug.client_host          =  172.16.238.1
    xdebug.discover_client_host = false

##mysql settings

in cfg/mariadb-<version>/devilbox-custom.cnf

[mysqld]
interactive_timeout=20
max_allowed_packet=256M
wait_timeout = 86400
