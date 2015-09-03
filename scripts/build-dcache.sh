#!/bin/sh

docker build --rm --no-cache -t dcache/base-master ../dcache/master/base/ \
&& \
docker build --rm --no-cache -t dcache/db-master ../dcache/master/db/ \
&& \
docker build --rm --no-cache -t dcache/standalone-master ../dcache/master/standalone/ \
&& \
echo "building finished."
echo
echo "To run dcache do:"
echo
echo "# docker run -d -v <somedir>/dcache-db:/var/lib/postgresql/data --name db /dcache/db-master"
echo
echo "and then:"
echo
echo "# docker run -d -p 2049:2049 -p 2880:2880 -p 22224:22224 --hostname=\$HOST -v <somedir>/dcache-logs:/var/log/dcache -v <somedir>/dcache-pools:/pools --name dcache --link db:dcachedb dcache/standalone-master"
echo
