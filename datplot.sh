#!/bin/bash

echo Processing ${1} ...
awk 'FNR==NR{a[FNR]=$2; next}{print a[FNR],$2}' tors-angles/phi-${1}.dat tors-angles/psi-${1}.dat > tors-angles/angles-${1}.dat

echo Done
