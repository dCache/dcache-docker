#!/bin/bash

DCACHE="/usr/bin/dcache"

stopDcache() {
  ${DCACHE} stop
}

for f in /init-dcache/*; do
  if [ -x "${f}" ]; then
    ./${f} 
  fi
done

${DCACHE} start

lock=$(${DCACHE} property dcache.paths.lock.file)

trap "stopDcache;" SIGINT SIGTERM

while [ -f "$lock" ]; do
  sleep 10
done

