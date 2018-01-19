#!/bin/bash

echo Gathering line ${1}
echo >> Rline-${1}.dat

for i in {19..399..20} ; do

        indx=$(find -name angles-${i}.dat -exec sed -n ${1}p {} \+)

        echo Processing angles-${i}.dat :: ${indx}
        echo ${indx} >>  Rline-${1}.dat

done
~             
