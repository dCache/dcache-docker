#!/bin/sh

echo "Creating Pool dirs for:\n"

createDirs() {
  echo $1
  mkdir -p $1/data
  mkdir -p $1/control
  chown -R dcache:dcache $1
}

createDirs /var/pools/pool
echo "\n"
