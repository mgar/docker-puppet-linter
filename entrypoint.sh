#!/bin/bash

set -e

case $1 in
    parser)
        cd puppet/ && find -name '*.pp' | xargs -n 1 -t puppet parser validate
        ;;
    lint)
        cd puppet/ && puppet-lint modules/*
        cd puppet/ && puppet-lint manifests/*
        ;;
    erb)
        cd puppet/ && find -name '*.erb' | xargs -n 1 -t erb -x -P -T '-' | ruby -c 2>&1
        ;;
    *)
        echo "This is not a valid choice."
        ;;
esac