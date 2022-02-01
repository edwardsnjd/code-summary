#!/bin/bash

# Usage: ./loc_all.sh directories...
#
# Print a summary of the number of lines in each type of file by the given
# directories.
#
# Dependencies: Bash, GNU utils, fd, datamash

function Main {
  for dir
  do
    DirectoryExtensionCounts "$dir"
  done
}

function DirectoryExtensionCounts {
  local dir="$1"

  DirectoryFileCounts "$dir" \
    | datamash --sort groupby 1,2 sum 3
}

function DirectoryFileCounts {
  local dir="$1"

  fd --type file --hidden --exclude ".git/" . "${dir}" -x wc -l {} \; \
    | awk \
      -v OFS="\t" \
      -v dir="$dir" \
      '{ print dir, gensub(".*(/|\\.)", "", "g", $2), $1, $2 }'
}

Main "$@"
