#!/bin/bash

tag=2.13

docker build --rm --no-cache -t dcache/head:${tag} ../dcache/head/ \
&& \
docker build --rm --no-cache -t dcache/pool:${tag} ../dcache/pool/ \
&& \
docker build --rm --no-cache -t dcache/webdav:${tag} ../dcache/webdav/ \
&& \
docker build --rm --no-cache -t dcache/nfs:${tag} ../dcache/nfs/ \
&& \
docker build --rm --no-cache -t dcache/xrootd:${tag} ../dcache/xrootd/ \
&&
docker build --rm --no-cache -t dcache/standalone${tag} ../dcache/standalone/ \

echo "Generating docker-compose.yml file in ../dcache/head/docker-compose.yml"

./generate-docker-compose.sh

echo "finished."
echo
echo "To run dcache do:"
echo
echo "# cd ../dcache/head"
echo "# docker-compose up"
echo
