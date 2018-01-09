#!/bin/bash

num=1
name=$1

if [[ -z ${name} ]] ; then
        echo "Enter the name of the .dat file you would like to create."

else
        echo "Creating ${name}.dat"
        echo >> ${1}.dat
fi


echo Looking through phi and psi .dat files...
while [ ${num} -le 20 ]
do

if [[ ${num} -lt 10 ]] ; then

        awk 'FNR==NR{a[FNR]=$2; next}{print a[FNR],$2}' psi-0${num}.dat phi-0${num}.dat > ${name}.dat

else

        awk 'FNR==NR{a[FNR]=$2; next}{print a[FNR],$2}' psi-${num}.dat phi-${num}.dat > ${name}.dat

fi

let num++
done

echo Success. Phi and psi torsion angles written to ${name}.dat
