#!/bin/bash

DCACHE="/usr/bin/dcache"

stopDcache() {
  ${DCACHE} stop
}

${DCACHE} database update

${DCACHE} start

lock=$(${DCACHE} property dcache.paths.lock.file)

trap "stopDcache;" SIGINT SIGTERM

while [ -f "$lock" ]; do
  sleep 10
done

