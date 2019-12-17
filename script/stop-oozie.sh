#!/bin/bash

set -x

#service oozie stop
$OOZIE_HOME/bin/oozied.sh stop
$ACTIVEMQ_HOME/bin/activemq stop
