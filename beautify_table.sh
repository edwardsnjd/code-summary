#!/bin/bash

column -t \
| sed -e '1p;1s/\S/-/g'
