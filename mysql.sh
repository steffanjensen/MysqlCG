#!/bin/bash

# MysqlCG - Mysql Client Gui #
# We need developers for this script, so you are more than welcome to join us on Github. #
# Our Github: https://github.com/reliefs/MysqlCG #
# This script is free to use, modify and resell #

# Clear Terminal and GET MysqlCG Information
clear
# Text Color Code
NORMAL=`echo "\033[m"`
MENU=`echo "\033[34m"` #blue
NUMBER=`echo "\033[33m"` #yellow
FGRED=`echo "\033[41m"`
RED_TEXT=`echo "\033[31m"`
ENTER_LINE=`echo "\033[33m"`
BOLD_TEXT=`echo "\e[1m"`
T_BLUE=`echo "\e[34m"`
T_BLINK=`echo "\e[15m"`





echo -e "${RED_TEXT}------------------------------------------------------${NORMAL}"
echo -e "${RED_TEXT}---- ${BOLD_TEXT}Welcome To MysqlCG - Mysql Client Gui V 0.01 ${NORMAL}${RED_TEXT}----${NORMAL}"
echo -e "${T_BLINK}Visit our Github:${NORMAL}${RED_TEXT}https://github.com/reliefs/MysqlCG ${NORMAL}"
echo -e "${RED_TEXT}------------------------------------------------------\n${NORMAL}"
# Type user information

echo -e "${T_BLUE}What is your Mysql Username?\n${NORMAL}"

read UserName

echo -e "\n${T_BLUE}What is your Mysql Password?\n${NORMAL}"

read -s PassWord

# Echo Table for Options
options(){
echo -e "${NUMBER}1.${NORMAL}${T_BLUE}Login to mysql\n${NORMAL}${NUMBER}2.${NORMAL}${MENU}See Databases\n${NORMAL}${NUMBER}3.${NORMAL}${MENU}Select Database\n${NORMAL}${NUMBER}4.${NORMAL}${MENU}Mysql Version\n${NORMAL}${NUMBER}5.${NORMAL}${MENU}Show Tables\n${NORMAL}${NUMBER}6.${NORMAL}${MENU}Create Database\n${NORMAL}${NUMBER}7.${NORMAL}${MENU}Backup Databases\n${NORMAL}${NUMBER}8.${NORMAL}${MENU}Remove Database\n${NORMAL}${NUMBER}9.${NORMAL}${MENU}Information\n${NORMAL}${RED_TEXT}0.Exit${NORMAL}\n\n${ENTER_LINE}Select your option${NORMAL}\n"

read n

# All different options in a menu from 1-9
# 1. Connect to mysql
# 2. Mysql Show Databases
# 3. Select Database
# 4. Mysql Version Show
# 5. Show Tables inside database
# 6. Create Database
# 7. Backup database and databases
# 8. Remove Database
# 9. Information
# 0. Exit
case $n in
	1) mysql -u $UserName --password=$PassWord;; 
	2) echo -e "${MENU}";mysql -u $UserName --password=$PassWord -e 'show databases;';echo -e "${NORMAL}";; 
	3) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database;;
        4) echo -e "\n";mysql --version;;
	5) echo -e "\nType database name\n"; read database ; mysql -u $UserName --password=$PassWord --database=$database -e 'show tables;';echo -e "\nShow index from table \n\nType table name\n";read table;mysql -u $UserName --password=$PassWord --database=$database -e 'show index from '$table'';;
	6) echo -e "\nCreate Database\n"; read NewDb ; mysql -u $UserName --password=$PassWord -e 'CREATE DATABASE '$NewDb';';echo -e "\nDatabase "$Newdb" Created\n";;
	7) echo -e "\nSelect your option\n1.Backup database\n2.Backup all databases\n"; 
		
		# When option 7) typed new window for Backup options
		while read dboption ;
		do case $dboption in
		1) echo -e "\nType fileName example: mydatabase.sql\n"; read dbfilename ; echo -e "\nType database name\n"; read dbname; mysqldump -u $UserName --password=$PassWord --databases $dbname > $dbfilename;echo -e "\nBackup Completed!";;
		2) echo -e "\nType fileName example: mydatabase.sql\n"; read dbfilename ; mysqldump -u $UserName --password=$PassWord --all-databases > $dbfilename;echo -e "Backup Completed!";; 
		esac
	break
done;;
	8) echo -e "\nRemove Database\n";read rmdatabase;mysql -u $UserName --password=$PassWord --database=$rmdatabase -e "DROP DATABASE "$rmdatabase"";echo -e "\nDatabase Removed\n";; 
	9) echo -e "\n";printf "MysqlCG is a Mysql Client Gui. MysqlCG is open-source and free to use and reproduce. I do not take any ownership of this script and you can do with it what you want.";;
	0) exit 0 ;
esac
}
options
sleep 5
options
sleep 5
options
sleep 5
options
sleep 5
