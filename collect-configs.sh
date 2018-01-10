!#/bin/bash

echo Processing image ${1}

echo Creating string-${1}.coor
echo >> string-${1}.coor

find -name alad.job0*.image*${1}.iter[0-9]*.coor -exec cp {} string-${1}.coor \;

echo Done
