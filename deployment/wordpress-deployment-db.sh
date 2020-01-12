rm -f sql-backup-test.sql 
mysqldump -h cms-assignment2-mysql.cqfo4vavavuc.ap-southeast-1.rds.amazonaws.com -u simonnuyhungben --password="simonnuyhungben" --column-statistics=0 wordpress_one > sql-backup-test.sql 

# ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t 'mysqldump -u root -p wordpress_one > sql-backup-test.sql;'
scp -i ~/.ssh/nyanyehtun-simon-github sql-backup-test.sql bitnami@3.0.51.187:/home/bitnami/.

ssh -i ~/.ssh/nyanyehtun-simon-github bitnami@3.0.51.187 -t '
mysql -u root --password="VohHMzRqBV4X" -e "drop database wordpress_one; create database wordpress_one;" 
mysql -u root --password="VohHMzRqBV4X"  wordpress_one < sql-backup-test.sql;
mysql -u root --password="VohHMzRqBV4X" -e "update wordpress_one.wp_options set option_value=\"http://3.0.51.187\" where option_name=\"siteurl\"" 
'

