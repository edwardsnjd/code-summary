#!/bin/bash

column -t \
| (sed -u 1q; sort -nk2) \
| sed -e '1p;1s/\S/-/g'
