printf "going to oweval dir\n"
printf "-------------------\n"
cd /var/www/default/oweval


DB_HOST=OO_oweval_mysql_1

printf "building oweval\n"
printf "=================\n"
ansible-playbook -vv -i ansible/inventories/local -e "db_host=$DB_HOST oweval_dir=/var/www/default/oweval working_dir=/var/www/default/oweval container_name=none" ansible/build.yml

printf "composer install\n"
printf "----------------\n"

/usr/local/bin/composer-1 install
/usr/local/bin/composer-1 dumpautoload -o

printf "run ansible playbook clean_db \n"
printf "------------------------------------------\n"

ansible-playbook -vv -i ansible/inventories/local -e "db_host=$DB_HOST" ansible/clean_db.yml

printf "oweval installed\n"
printf "----------------\n"
chmod -R 777 files
printf ls -l files
printf "version is : "
printf php owevalscripts.php version

printf "run tests\n"
printf "----------------\n"

ansible-playbook -vv -i ansible/inventories/local ansible/run_tests.yml - e "testdata_dir=testdata"

exec "${@}"
