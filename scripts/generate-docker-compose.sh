#/bin/bash

if [ -z $1 ];
then
  echo "Usage: generate-docker-compose.sh <tag>"
  exit 1
fi

tag=$1

EOF=EOF_$RANDOM; eval echo "\"$(cat <<$EOF
$(<docker-compose.yml)
$EOF
)\"" > ../dcache/${tag}/head/docker-compose.yml

