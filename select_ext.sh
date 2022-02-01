#!/bin/bash

# Usage: loc.sh repo1 repo2 | select_ext.sh
#
# Limit input to only lines refering to relevant extensions.

# The extensions to keep
EXT_WHITELIST=(
 c cpp cs css h html java js json jsx meta prefab
 py ts tsx xml yaml yml
)

# Filter stdin to only select lines matching whitelisted extensions
function SelectWhitelistedExtensions {
  local extensionsChoice=$( JoinBy "|" "${EXT_WHITELIST[@]}" )

  grep -E "\b(${extensionsChoice})\b"
}

# Join given positional parameters by the given separator
function JoinBy {
  local IFS="$1"
  shift
  echo "$*"  # "$*" uses IFS
}

SelectWhitelistedExtensions "$@"
