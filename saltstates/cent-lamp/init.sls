lampinstall:
  pkg.installed:
    - pkgs:
      - httpd
      - mariadb-server
      - mariadb
      - php
      - php-mysql
      - curl

/var/www/html/info.php:
  file.managed:
    - source: salt://cent-lamp/info.php

httpd:
  service.running:
    - watch:
      - file: /var/www/html/info.php

'curl http://localhost/info.php|head':
  cmd.run


