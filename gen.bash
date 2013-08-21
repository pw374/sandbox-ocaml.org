#!/bin/bash

if which -s mpp && which omd 
then
    true
else
    echo "You don't have mpp and/or omd"
    exit 1
fi

IFS=
find "$@" -type f -iname '*.md' |
while read i
do
    target="$(sed -e 's/\.md$/.html/' -e 's/^md-pages/html-pages/' <<< "$i")"
    mkdir -p "$(dirname $target)" && make "$target"
done

