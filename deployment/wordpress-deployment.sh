#!/bin/sh

set -e
START=$(date +%s)

GR="\033[0;32m"
RD="\033[0;31m"
CY="\033[0;36m"
WT="\033[1;37m"
NC='\033[0m' # No Color

clear
echo "${CY}"
echo "   ____             _             _                  "
echo "  |  _ \  ___ _ __ | | ___  _   _(_)_ __   __ _      "
echo "  | | | |/ _ \ '_ \| |/ _ \| | | | | '_ \ / _\` |    "
echo "  | |_| |  __/ |_) | | (_) | |_| | | | | | (_| |     "
echo "  |____/ \___| .__/|_|\___/ \__, |_|_| |_|\__, |     "
echo "             |_|            |___/         |___/      "
echo "${NC}"


CWD=$(PWD)

production() {
    echo "running script for production"

}

staging() {

    echo "${GR}"
    echo "Deploying to staging server"
    echo "${CY}"
    echo "IP: 3.0.51.187"

    echo "${GR}"
    echo 'step 1/4: Syncing database';
    echo "${NC}"
    # sycing database
    rm -f sql-backup-test.sql 
    mysqldump -h cms-assignment2-mysql.cqfo4vavavuc.ap-southeast-1.rds.amazonaws.com -u simonnuyhungben --password="simonnuyhungben" --column-statistics=0 wordpress_one > sql-backup-test.sql 

    # ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t 'mysqldump -u root -p wordpress_one > sql-backup-test.sql;'
    scp -i ~/.ssh/nyanyehtun-simon-github sql-backup-test.sql bitnami@3.0.51.187:/home/bitnami/.

    ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t '
    mysql -u root --password="VohHMzRqBV4X" -e "drop database wordpress_one; create database wordpress_one;" 
    mysql -u root --password="VohHMzRqBV4X"  wordpress_one < sql-backup-test.sql;
    
    mysql -u root --password="VohHMzRqBV4X" -e "update wordpress_one.wp_options set option_value=\"DoctorsConnect\" where option_name=\"blogname\"" 
    wp search-replace "http://one.wordpress.test" "http://3.0.51.187" --skip-columns=guid
    '
    # mysql -u root --password="VohHMzRqBV4X" -e "update wordpress_one.wp_options set option_value=\"http://3.0.51.187\" where option_name=\"siteurl\"" 
    # mysql -u root --password="VohHMzRqBV4X" -e "update wordpress_one.wp_options set option_value=\"http://3.0.51.187\" where option_name=\"home\"" 
    line_break

    echo "${GR}"
    echo 'step 2/4: Syncing wordpress project files';
    echo "${NC}"
    # syncing files
    cd $CWD/../www/wordpress-one/
    rsync -i ~/.ssh/nyanyehtun-simon-github -a --human-readable --stats public_html/ bitnami@3.0.51.187:/home/bitnami/public_html/
    ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t '
        sudo cp -R public_html/. apps/wordpress/htdocs/
    '
    line_break
    
    
    echo "${GR}"
    echo 'step 3/4: Overriding wp-config.php file for staging server setup';
    echo "${NC}"
    cd $CWD
    scp -i ~/.ssh/nyanyehtun-simon-github wp-config-staging.php bitnami@3.0.51.187:/home/bitnami/apps/wordpress/htdocs/wp-config.php
    line_break

    echo "${GR}"
    echo 'step 4/4: Changing ownership of user and group of wordpress project files and folders'
    echo "${NC}"
    # changing ownership
    ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t '
        cd apps/wordpress/htdocs/;
        sudo chown bitnami:daemon *;
    '
    line_break

    echo "${GR}"
    echo "Done Deploying"
    echo "${NC}"

}

line_break() {
    echo ""
    printf ".%.0s" {1..50}
    echo ""
}

default() {
    # echo "Need to pass and environment."
    # exit 1
    echo "this is default script"
    staging
}

case "$1" in
"production")
    production
    ;;
"staging" | "development")
    staging
    ;;
*)
    default
    ;;
esac
