#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

filename=$1

if [ ! -f $filename ]; then
    echo "No such file: $filename"
    exit 1
fi

docker run --rm -it -v $(pwd):/texsrc k1z3/texlive /bin/sh -c "latexmk ./$filename && latexmk -c && rm *.dvi *.gz"