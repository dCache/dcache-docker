#!/bin/bash

DCACHE="/usr/bin/dcache"

stopDcache() {
  ${DCACHE} stop
}

${DCACHE} database update

if [ ! -d /pools/pools ]
then
  dcache pool create --size=10000000000 /pools/pools pool1 pools
fi

${DCACHE} start

lock=$(${DCACHE} property dcache.paths.lock.file)

trap "stopDcache;" SIGINT SIGTERM

while [ -f "$lock" ]; do
  sleep 10
done

