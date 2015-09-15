#!/bin/bash

for envkv in $(env); do
  varkey=$(expr "${envkv}" : "\(^[^=]*\)")
  varval=$(echo ${envkv} | sed "s!${varkey}=!!")
  for f in /etc/dcache/*; do
    if [ -f "${f}" ]; then
      sed -i "s!%%${varkey}%%!${varval}!" ${f}
    fi
  done
  for f in /etc/dcache/layouts/*; do
    if [ -f "${f}" ]; then
      sed -i "s!%%${varkey}%%!${varval}!" ${f}
    fi
  done
done
