# Choose and name our temporary image.
FROM alpine as intermediate

# Add metadata identifying these images as our build containers (this will be useful later!)
LABEL stage=intermediate

ARG GIT_TOKEN



# Install dependencies required to git clone.
# git clone the oweval repo
RUN apk update && \
    apk add --update git && \
   git clone --verbose https://${GIT_TOKEN}@git.repo.vub.ac.be/jevdheyd/oweval.git

# this will become to image we will use
FROM devilbox/php-fpm:7.3-work-0.123

ARG HOST_PORT_MYSQL

RUN echo "$HOST_PORT_MYSQL"

# copy codebase from intermediate to webroot
COPY --from=intermediate /oweval /tmp/oweval



WORKDIR /var/www/default

COPY oweval-env .env

# # pymysql is required by the mysql_db ansible module
    #RUN mkdir files/logs
 RUN git checkout -b dev origin/develop
 RUN mkdir files/cache
 RUN mkdir files/logs
 RUN composer-1 install
 RUN composer-1 dumpautoload -o
 # RUN mysql -h devilbox-test_mysql_1 -u root -proot -e "create database oweval_selenium_main"
 # RUN mysql -h devilbox-test_mysql_1 -u root -proot -e "create database oweval_selenium_instance"
 # RUN php owevalscripts migrations:all-databases
# RUN   ansible-playbook -vv -i ansible/inventories/local -e "db_port=3306  db_host=devilbox-test_mysql_1 oweval_dir=/var/www/default working_dir=/var/www/default container_name=none" ansible/self-deploy-selenium.yml
ENTRYPOINT ["/docker-entrypoint.sh"]
