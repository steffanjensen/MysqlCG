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

echo -e "Select your option\n1. Login to mysql\n2. See Databases\n3. Select Database\n4. Mysql Version\n5. Show Tables\n6. Information" 

read n

# All different options
case $n in
	1) mysql -u $UserName --password=$PassWord;;
	2) mysql -u $UserName --password=$PassWord -e 'show databases;';; 
	3) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database;;
        4) mysql --version;;
	5) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database -e 'show tables;';echo -e "Type table name";read table;;
	6) printf "MysqlCG is a Mysql Client Gui. MysqlCG is open-source and free to use and reproduce. I do not take any ownership of this script and you can do with it what you want.";  
esac
