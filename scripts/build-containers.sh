#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: build-containers.sh <tag>"
  echo "tag: dcache tag or branch name"
  exit 2
fi

tag="$1"

if [ ! -d ../dcache//branches/${tag} ]
then
  echo "Tag: $1 does not exist. Exiting."
  exit 3
fi

docker build --rm --no-cache -t dcache/head:${tag} ../dcache/branches/${tag}/head/ \
&& \
docker build --rm --no-cache -t dcache/pool:${tag} ../dcache/branches/${tag}/pool/ \
&& \
docker build --rm --no-cache -t dcache/webdav:${tag} ../dcache/branches/${tag}/webdav/ \
&& \
docker build --rm --no-cache -t dcache/nfs:${tag} ../dcache/branches/${tag}/nfs/ \
&& \
docker build --rm --no-cache -t dcache/xrootd:${tag} ../dcache/branches/${tag}/xrootd/ 

echo "Generating docker-compose.yml file in ../dcache/branches/${tag}/head/docker-compose.yml"

./generate-docker-compose.sh $tag

echo "finished."
echo
echo "To run dcache do:"
echo
echo "# cd ../dcache/branches/${tag}/head"
echo "# docker-compose up"
echo
