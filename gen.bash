#!/bin/bash

IFS=
find "$@" -type f -iname '*.md' |
while read i
do
    target="$(sed -e 's/\.md$/.html/' -e 's/^md-pages/html-pages/' <<< "$i")"
    mkdir -p "$(dirname $target)" && make "$target"
done

