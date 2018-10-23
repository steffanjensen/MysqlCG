#!/bin/bash

echo -e "Welcome To MysqlCG\n" 

echo -e "What is your Username?\n"

read UserName

echo -e "\nWhat is your Password?\n"

read -s PassWord

echo -e "select your option\n1. Login to mysql\n2. See Databases\n3. Show Mysql Version\n4. Infomation" 

read n

case $n in
       	1) mysql -u $UserName --password=$PassWord;;
	2) mysql -u $UserName --password=$PassWord -e 'show databases;';; 
	3) mysql --version;; 
	4) printf "MysqlCG is a Mysql Client Gui. MysqlCG is open-source and free to use and reproduce. I do not take any ownership of this script and you can do with it what you want." for opn 4;; 
	*) echo "invalid option";; 
esac
