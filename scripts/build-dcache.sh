#!/bin/sh

tag=master

docker build -t dcache/db:latest ../dcache/db/ \
&& \
docker build -t dcache/deps:latest ../dcache/deps/ \
&& \
docker build --rm --no-cache -t dcache/build:${tag} ../dcache/build/ \
&& \
docker build --rm --no-cache -t dcache/dcache:${tag} ../dcache/dcache/

echo "building finished."
echo
echo "Next build the single-purpose containers using ./build-container.sh"
echo
