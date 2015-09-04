#!/bin/bash

DCACHE="/usr/bin/dcache"

stopDcache() {
  ${DCACHE} stop
}

sleep 15 # wait for db to come up

${DCACHE} database update

if [ ! -d /pools/pool1 ]
then
  mkdir -p /pools/pool1/data
  mkdir -p /pools/pool1/control
  chown -R dcache /pools/pool1
fi

${DCACHE} start

lock=$(${DCACHE} property dcache.paths.lock.file)

trap "stopDcache;" SIGINT SIGTERM

while [ -f "$lock" ]; do
  sleep 10
done

