#!/bin/sh

echo "Creating Pool dirs for:\n"

createDirs() {
  echo $1
  mkdir -p $1/data
  mkdir -p $1/control
  chown -R dcache:dcache $1
}

createDirs /var/pools/pool_write
createDirs /var/pools/pool_read
createDirs /var/pools/pool_r1
createDirs /var/pools/pool_r2
createDirs /var/pools/pool_r3
createDirs /var/pools/pool_sm
echo "\n"
