#!/bin/sh

createDirs() {
  echo $1
  mkdir -p $1/data
  mkdir -p $1/control
  chown -R dcache:dcache $1
}

if [ -z ${POOLNAME} ]; then
  POOLNAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
  POOLNAME="pool-${POOLNAME}"
  echo "WARNING: You did not set POOLNAME, will use ${POOLNAME}"
fi

echo "INFO: Creating Pool dirs for:"
createDirs /var/pools/pool

echo "INFO: Replacing %%POOLNAME%% with ${POOLNAME} in layout file:"
sed -i "s/%%POOLNAME%%/${POOLNAME}/" /etc/dcache/layouts/*

echo
