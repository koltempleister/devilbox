printf "clean oweval dir\n"
printf "-------------------\n"
rm -rf /var/www/default/oweval

printf "copy data to oweval dir\n"
printf "-------------------\n"
mv /oweval /var/www/default

printf "going to oweval dir\n"
printf "-------------------\n"
cd /var/www/default/oweval

printf "checking out correct branch\n"
printf "---------------------------\n"
# git checkout -b dev origin/develop
git checkout -b dev origin/feature/self_deploy_selenium
# git checkout 77c22f9b018c9035166a8e6e23c8da004924f9b9

printf "installing oweval\n"
printf "=================\n"

printf "composer install\n"
printf "----------------\n"

/usr/local/bin/composer-1 install
/usr/local/bin/composer-1 dumpautoload -o

printf "run ansible playbook self-deploy-selenium \n"
printf "------------------------------------------\n"

ansible-playbook -vv -i ansible/inventories/local -e "db_port=3306  db_host=devilbox-test_mysql_1 oweval_dir=/var/www/default/oweval working_dir=/var/www/default/oweval container_name=none" ansible/self-deploy-selenium.yml

printf "oweval installed\n"
printf "----------------\n"
chmod -R 777 files
printf ls -l files
printf "version is : "
printf git branch --show-current
exec "${@}"
