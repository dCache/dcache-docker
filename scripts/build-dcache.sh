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
echo "# docker run -d -P --name db dcache/db-master"
echo 
echo "and then:"
echo
echo "# docker run -ti -P --name dcache --link db:dcachedb dcache/standalone-master /bin/bash"
echo
