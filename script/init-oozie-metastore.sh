#!/bin/bash

set -x

PASSWORD=Metatron123$

expect -c "
set timeout 3
spawn mysql -uroot -p
expect \"Enter password:\"
send \"$PASSWORD\\r\"
expect \"mysql>\"
send \"create database oozie_metastore;\\r\"
expect \"mysql>\"
send \"create user 'oozie'@'%' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'oozie'@'%';\\r\"
expect \"mysql>\"
send \"grant all privileges on oozie_metastore.* to 'oozie'@'%';\\r\"
expect \"mysql>\"
send \"create user 'oozie'@'localhost' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'oozie'@'localhost';\\r\"
expect \"mysql>\"
send \"grant all privileges on oozie_metastore.* to 'oozie'@'localhost';\\r\"
expect \"mysql>\"
send \"flush privileges;\\r\"
expect \"mysql>\"
send \"quit\\r\"
expect eof
"

#schematool -initSchema -dbType mysql

$OOZIE_HOME/bin/oozie-setup.sh prepare-war
$OOZIE_HOME/bin/ooziedb.sh create -run
$OOZIE_HOME/bin/oozie-setup.sh sharelib create -fs hdfs://localhost:9000
