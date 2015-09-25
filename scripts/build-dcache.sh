#!/bin/sh

if [ -z "$1" ]
then
  echo "Usage: build-dache.sh <tag>"
  echo "tag: dcache tag or branch name"
  exit 2
fi

tag="$1"

if [ ! -d ../dcache/branches/${tag} ]
then
  echo "Tag: $1 does not exist. Exiting."
  exit 3
fi

docker build -t dcache/db:latest ../dcache/db-image/ \
&& \
docker build -t dcache/deps:latest ../dcache/build-deps-image/ \
&& \
docker build --rm --no-cache -t dcache/build:${tag} ../dcache/branches/${tag}/build/ \
&& \
docker build --rm --no-cache -t dcache/dcache:${tag} ../dcache/branches/${tag}/dcache/

echo "building finished."
echo
echo "Next build the single-purpose containers using ./build-container.sh"
echo
