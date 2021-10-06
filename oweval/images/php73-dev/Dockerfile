FROM php73-dev


RUN useradd -ms /bin/bash jevdheyd
RUN usermod -a -G jevdheyd www-data
RUN usermod -a -G www-data jevdheyd

RUN echo "alias _xdebug='export PHP_IDE_CONFIG=\"serverName=localhost\" && export XDEBUG_CONFIG=\"remote_enable=1 remote_mode=req remote_port=9000 remote_host=172.17.0.1 remote_connect_back=0\"'" >>  /home/jevdheyd/.bashrc

RUN echo "alias _xdebug_profile='\"profiel_enable=1\"'" >>  /home/jevdheyd/.bashrc

RUN sed -ie 's/# alias ll=/alias ll=/g' /home/jevdheyd/.bashrc

RUN { \
          echo 'set nu'; \
          echo 'syntax on'; \
     } >>  /home/jevdheyd/.vimrc
