#!/bin/bash

dirs=$(find -mindepth 1 -maxdepth 1 -type d)
exts="py js jsx java xml css"

for dir in ${dirs}; do
  echo "--- ${dir} ---" 
  for ext in ${exts}; do
    echo -n ".${ext} "
    find "${dir}" -type f -name "*.${ext}" -print0 \
    | xargs -0 wc -l \
    | tail -1 \
    | sed -E -e 's/^\s*(\S+).*/\1/'
  done
done
