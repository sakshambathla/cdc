#!/bin/bash
echo 'Enter the mysql server address in the format 10.10.10.10:5656'
read server
echo 'Enter the username for the mysql user you want to connect as'
read uname
echo 'Enter the password for that user'
read -s pwd
echo 'The string is'
echo 
echo 'mysql://'$uname'%2F'$pwd'@'$server'/12345/mysql-bin'
echo
echo 'The end point is'
echo
echo $uname'%2F'$pwd'@'$server
echo
echo 'Run this script again is you want to change the end point. Note: %2F is just a unicode. it can be ignored'
echo
echo 'The Line is'
src='<property name="uri" value="mysql://'$uname'%2F'$pwd'@'$server'/12345/mysql-bin"/>' 
echo $src
head -75 resources/external/spring-relay-config.xml >> resources/external/spring-relay2-config.xml
echo $src >> resources/external/spring-relay2-config.xml
tail -40   resources/external/spring-relay-config.xml >> resources/external/spring-relay2-config.xml
rm resources/external/spring-relay-config.xml
mv resources/external/spring-relay2-config.xml resources/external/spring-relay-config.xml 
