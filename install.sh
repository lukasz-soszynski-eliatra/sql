#!/bin/bash
set -e
OS_HOME="/home/lukasz/software/eliatra/opensearch-2.13.0"

./gradlew assemble

$OS_HOME/bin/opensearch-plugin remove opensearch-sql || echo "SQL plugin not installed"
$OS_HOME/bin/opensearch-plugin install -b file://$PWD/plugin/build/distributions/opensearch-sql-2.13.0.0-SNAPSHOT.zip
$OS_HOME/bin/opensearch-plugin list