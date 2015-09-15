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
echo "To run dcache do:"
echo
echo "# docker run -d -v <somedir>/dcache-db:/var/lib/postgresql/data --name db /dcache/db:${tag}"
echo
echo "and then:"
echo
echo "# docker run -d -p 2049:2049 -p 2880:2880 -p 22224:22224 --hostname=\$HOST -v <somedir>/dcache-logs:/var/log/dcache -v <somedir>/dcache-pools:/pools --name dcache --link db:dcachedb dcache/standalone:${tag}"
echo
