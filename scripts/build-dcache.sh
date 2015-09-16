#!/bin/sh

if [ -z "$1" ]
then
  echo "Usage: build-dache.sh <tag>"
  echo "tag: dcache tag or branch name"
  exit 2
fi

tag="$1"

if [ ! -d ../dcache/${tag} ]
then
  echo "Tag: $1 does not exist. Exiting."
  exit 3
fi

docker build --rm --no-cache -t dcache/db:${tag} ../dcache/${tag}/db/ \
&& \
docker build --rm --no-cache -t dcache/deps:${tag} ../dcache/${tag}/deps/ \
&& \
docker build --rm --no-cache -t dcache/build:${tag} ../dcache/${tag}/build/ \
&& \
docker build --rm --no-cache -t dcache/dcache:${tag} ../dcache/${tag}/dcache/

echo "building finished."
echo
echo "Next build the single-purpose containers using ./build-container.sh"
echo
