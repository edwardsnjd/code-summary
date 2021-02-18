#!/bin/bash

dirs=$(find -mindepth 1 -maxdepth 1 -type d)

for dir in ${dirs}; do
  echo "--- ${dir} ---" 

  exts=$(
    fd --type file --hidden --exclude ".git/" . "${dir}" \
    | sed -e 's/.*\.//' \
    | sort -u
  )

  for ext in ${exts}; do
    echo -n ".${ext} "
    fd --type file --hidden --exclude ".git/" -e ".${ext}" --print0 . "${dir}" \
    | xargs -0 wc -l \
    | tail -1 \
    | sed -E -e 's/^\s*(\S+).*/\1/'
  done
done
