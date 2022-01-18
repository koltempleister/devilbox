#oweval docu
## opzetten xdebug via command line
in php.ini van de juiste php versie in devalibox/cfg (php.ini moet worden aangemaakt)

xdebug.mode               = debug
xdebug.start_with_request = yes
xdebug.remote_handler   = dbgp
xdebug.remote_port      = 9000
xdebug.idekey           = PHPSTORM
xdebug.remote_log       = /var/log/php/xdebug.log
xdebug.client_host			= 172.16.238.1


volgende variable moet woren geexporteerd

		export PHP_IDE_CONFIG="serverName=<servername>"

<servername> is de naam van een configuratie in phpstorm > settings > php > servers
