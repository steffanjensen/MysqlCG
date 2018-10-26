#!/bin/bash

# MysqlCG - Mysql Client Gui #
# We need developers for this script, so you are more than welcome to join us on Github. #
# Our Github: https://github.com/reliefs/MysqlCG #
# This script is free to use, modify and resell #

clear
echo -e "Welcome To MysqlCG\n" 

# Type user information
echo -e "What is your Username?\n"

read UserName

echo -e "\nWhat is your Password?\n"

read -s PassWord

# Echo Table for Options
echo -e "Select your option\n1. Login to mysql\n2. See Databases\n3. Select Database\n4. Mysql Version\n5. Show Tables\n6. Create Database\n7. Backup All Databases\n8. Information" 

read n

# All different options
case $n in
	1) mysql -u $UserName --password=$PassWord;;
	2) mysql -u $UserName --password=$PassWord -e 'show databases;';; 
	3) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database;;
        4) mysql --version;;
	5) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database -e 'show tables;';echo -e "\nShow index from table \n\nType table name\n";read table;mysql -u $UserName --password=$PassWord --database=$database -e 'show index from '$table'';;
	6) echo -e "\nCreate Database\n"; read NewDb ; mysql -u $UserName --password=$PassWord -e 'CREATE DATABASE '$NewDb';';;
	7) echo -e "\nType fileName example: mydatabase.sql\n"; read dbfilename ; mysqldump -u $UserName --password=$PassWord --all-databases > $dbfilename;;
	8) printf "MysqlCG is a Mysql Client Gui. MysqlCG is open-source and free to use and reproduce. I do not take any ownership of this script and you can do with it what you want.";  
esac
