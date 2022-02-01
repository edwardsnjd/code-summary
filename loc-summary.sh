#!/usr/bin/env bash

# Usage: loc.sh repo1 repo2 | loc-summary.sh {report}
# where report is one of:
#  - summary   = counts by repo and extension
#  - ext       = counts by extension
#  - repo      = counts by repo
#  - cross     = cross referenced by repo and extension
#
# Summarise the raw LOC report in various ways.

set -o nounset
set -o errexit

Main() {
  local report="${1:-}"

  case "$report" in
    "summary" ) ReportSummary ;;
    "ext" ) ReportExtension ;;
    "repo" ) ReportRepo ;;
    "cross" ) ReportExtRepo ;;
    * ) echo "Unknown report: '${report}'"; exit 1 ;;
  esac
}

# Report filters

ReportSummary() {
  sort -nrk3,3 \
    | sort -k1,1 --stable \
    | AddHeaders repo ext count \
    | Tabulate
}

ReportExtension() {
  datamash --sort groupby 2 sum 3 \
    | sort -nrk2,2 \
    | AddHeaders ext count \
    | Tabulate
}

ReportRepo() {
  datamash --sort groupby 1 sum 3 \
    | sort -nrk2,2 \
    | AddHeaders repo count \
    | Tabulate
}

ReportExtRepo() {
  datamash --sort crosstab 2,1 sum 3 \
    | sed "1s/^/(ext)/;s#N/A#0#g" \
    | Tabulate
}

# Formatting

AddHeaders() {
  local headers=$( JoinBy "\t" "$*" )
  sed "1i${headers}"
}

JoinBy() {
  local IFS="$1"
  shift
  echo "$*"
}

Tabulate() {
  column -t \
    | sed "1p;1s/\S/-/g"
}

# Entry point

Main "$@"
