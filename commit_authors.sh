#!/bin/bash

dirs=$(find -mindepth 1 -maxdepth 1 -type d)
format="%ae"

for dir in ${dirs}; do
  echo "--- ${dir} ---" 

  git -C ${dir} log --pretty="tformat:${format}" | sort | uniq -c | awk '{ print $2, $1 }'
done
