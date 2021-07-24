#!/bin/bash -x

file=$1
temp=$(mktemp)
signature="$HOME/.signature"
vim $temp && pandoc -s -f markdown -t html -o $file $temp $signature

