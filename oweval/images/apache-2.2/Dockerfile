FROM httpd:2.2

COPY ../../cfg/apache-2.2/oweval.conf /etc/sites-available

RUN a2ensite oweval.conf
RUN a2enmod rewrite
