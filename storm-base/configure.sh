#!/bin/bash

ZOOKEEPER_HOST=${1:-ZOOKEEPER_HOST}
NIMBUS_HOST=${2:-NIMBUS_HOST}


echo "ZOOKEEPER_HOST is set to: $ZOOKEEPER_HOST"
echo "NIMBUS_HOST is set to: $NIMBUS_HOST"

if [ -z "$ZOOKEEPER_HOST"]; then
    echo "ZOOKEEPER_HOST environment variable is not set. Exiting..."
    exit 1
fi

if [-z "$NIMBUS_HOST"]; then
    echo "NIMBUS_HOST environment variable is not set. Exiting..."
    exit 1
fi

STORM_CONFIG_FILE="/opt/storm/conf/storm.yaml"

echo "storm.local.dir: \"/tmp\"" > $STORM_CONFIG_FILE
echo "storm.zookeeper.servers:" >> $STORM_CONFIG_FILE
echo "-\"$ZOOKEEPER_HOST\"" >> $STORM_CONFIG_FILE

echo "nimbus.seeds: [\"$NIMBUS_HOST\"]" >> $STORM_CONFIG_FILE

echo "storm.log.dir: \"/logs\"" >> $STORM_CONFIG_FILE
echo "nimbus.thrift.port: 6667" >> $STORM_CONFIG_FILE
echo "ui.port: 8081" >> $STORM_CONFIG_FILE
echo "supervisor.slots.ports:" >> $STORM_CONFIG_FILE
echo " - 6700" >> $STORM_CONFIG_FILE
echo " - 6701" >> $STORM_CONFIG_FILE
echo " - 6702" >> $STORM_CONFIG_FILE
echo " - 6703" >> $STORM_CONFIG_FILE
echo " - 6704" >> $STORM_CONFIG_FILE
echo " - 6705" >> $STORM_CONFIG_FILE

cat $STORM_CONFIG_FILE

echo "Configuration complete."