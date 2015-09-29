#/bin/bash

EOF=EOF_$RANDOM; eval echo "\"$(cat <<$EOF
$(<docker-compose.yml)
$EOF
)\"" > ../dcache/head/docker-compose.yml

