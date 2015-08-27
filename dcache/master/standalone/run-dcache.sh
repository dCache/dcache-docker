#!/bin/bash

DCACHE="/usr/bin/dcache"

${DCACHE} database update

${DCACHE} start

lock=$(${DCACHE} property dcache.paths.lock.file)

trap "{ \${DCACHE} stop }" SIGINT SIGTERM

while [ -n "$lock" ]; do
  sleep 10
done


