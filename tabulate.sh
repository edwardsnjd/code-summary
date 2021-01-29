#!/bin/bash

awk '
/---/ {
    # Start of directory
    current_dir = $2
    dir_total[current_dir] = 0
}

!/---/ {
    # Extension count for current directory
    dir_total[current_dir] += $2
    dir_ext_total[current_dir][$1] = $2
    ext_total[$1] += $2

}

END {
    # Print table of data
    printf "Dir"
    printf "\t(total)"
    for (ext in ext_total) {
        printf "\t%s", ext
    }
    printf "\n"

    for (dir in dir_ext_total) {
        printf dir
        printf "\t%s", dir_total[dir]
        for (ext in ext_total) {
            count = 0
            if (ext in dir_ext_total[dir]) {
                count = dir_ext_total[dir][ext]
            }
            printf "\t%s", count
        }
        printf "\n"
    }
}
' -