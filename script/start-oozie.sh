#!/bin/bash

set -x

#service oozie start

$ACTIVEMQ_HOME/bin/activemq start
$OOZIE_HOME/bin/oozied.sh start
