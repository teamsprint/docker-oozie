# Oozie Docker Image

teamsprint/oozie:4.3


# Based on (in a row)

teamsprint/centos:7<br/>
teamsprint/jdk:8<br/>
teamsprint/hadoop:2.7.3<br/>
teamsprint/mysql:5.7<br/>

# Build the image

run build.sh

# Start a container

run run.sh

The container name is "oozie". If you don't want, just edit the scripts.

# Attach a container

run attach.sh

# Destroy containers

run destroy.sh

# IMPORTANT: After attach you might to want to to:
./start-hadoop.sh (HDFS & Yarn)<br/>
./test-hadoop.sh (Optional)<br/>

./init-mysql.sh (MySQL setting)<br/>

./start-mysql.sh (Optional; already started by init-mysql.sh)<br/>
./conn-mysql.sh (Optional)<br/>
./stop-mysql.sh (Optional)<br/>

./init-oozie-metastore.sh (Mandatory)<br/>
./start-oozie.sh (Mandatory)<br/>
./stop-oozie.sh (Optional)<br/>
# Stop Oozie

./stop-oozie.sh

