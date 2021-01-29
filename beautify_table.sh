#!/bin/bash

column -t \
| sort -nk2 \
| sed -e '1p;1s/\S/-/g'