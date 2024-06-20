#!/bin/bash

/usr/local/bin/configure.sh "$ZOOKEEPER_HOST" "$NIMBUS_HOST"

exec storm nimbus