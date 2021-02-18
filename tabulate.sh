#!/bin/bash

awk '
/---/ {
    # Start of group
    group = $2
    group_totals[group] = 0
}

!/---/ {
    # Category count for current group
    category = $1
    count = $2
    group_totals[group] += count
    category_totals[category] += count
    group_category_totals[group][category] = count
}

END {
    # Loop over dictionaries in ascending order of string keys
    PROCINFO["sorted_in"] = "@ind_str_asc"

    # Print header
    printf "Dir"
    printf "\t(total)"
    for (category in category_totals) {
        printf "\t%s", category
    }
    printf "\n"

    # Print rows
    for (group in group_category_totals) {
        printf group
        printf "\t%s", group_totals[group]
        for (category in category_totals) {
            count = 0
            if (category in group_category_totals[group]) {
                count = group_category_totals[group][category]
            }
            printf "\t%s", count
        }
        printf "\n"
    }
}
' -
