#!/bin/bash

dirs=$(find -mindepth 1 -maxdepth 1 -type d)
dateformat="%Y-%m"
format="%ad"

for dir in ${dirs}; do
  echo "--- ${dir} ---" 

  git -C ${dir} log --date="format:${dateformat}" --pretty="tformat:${format}" | sort | uniq -c | awk '{ print $2, $1 }'
done
