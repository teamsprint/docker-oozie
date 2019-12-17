#!/bin/bash

set -x

# Start activemq & oozie server

$ACTIVEMQ_HOME/bin/activemq start
$OOZIE_HOME/bin/oozied.sh start
