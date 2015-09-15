#!/bin/sh

if [ -z "$1" ]
then
  echo "Usage: build-containers.sh <tag>"
  echo "tag: dcache tag or branch name"
  exit 2
fi

tag="$1"

if [ ! -d ../dcache/${tag} ]
then
  echo "Tag: $1 does not exist. Exiting."
  exit 3
fi

docker build --rm --no-cache -t dcache/dcache:${tag} ../dcache/${tag}/dcache/ \
&& \
docker build --rm --no-cache -t dcache/head:${tag} ../dcache/${tag}/head/ \
&& \
docker build --rm --no-cache -t dcache/pool:${tag} ../dcache/${tag}/pool/ \
&& \
docker build --rm --no-cache -t dcache/webdav:${tag} ../dcache/${tag}/webdav/ \
&& \
docker build --rm --no-cache -t dcache/nfs:${tag} ../dcache/${tag}/nfs/ 

echo "building finished."
echo
echo "To run dcache do:"
echo
echo "# cd ../dcache/${tag}/head"
echo "# docker-compose up"
echo
