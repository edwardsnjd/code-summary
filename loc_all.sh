#!/bin/bash

dirs=$(ls -d *)

for dir in ${dirs}; do
  echo "--- ${dir} ---" 

  exts=$(find ${dir} -type f -name "*.*" | sed -e 's/.*\.//' | sort -u)

  for ext in ${exts}; do
    echo -n ".${ext} "
    find ${dir} -type f -name "*.${ext}" \
    | xargs wc -l \
    | tail -1 \
    | sed -E -e 's/^\s*(\S+).*/\1/'
  done
done