#!/usr/bin/env bash
 
# MySQL credentials
user="set_user"
password="set_password"
db="set_db_name"
db_container_name="container_name"

# Create a variable with the command to list all tables
tables=$(docker exec $db_container_name mysql -u $user -p$password -Nse 'SHOW TABLES' $db)
 
echo "All tables: $tables"

# Loop through the tables and drop each one
for table in $tables; do
    echo "Dropping $table from $db..."
    docker exec $db_container_name mysql -u $user -p$password -e "SET FOREIGN_KEY_CHECKS=0; DROP TABLE $table; SET FOREIGN_KEY_CHECKS=1;" $db
done
 
echo "All tables dropped from $db."