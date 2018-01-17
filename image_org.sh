#!/bin/bash

let index="(${1} * 20)"
indx=`printf "%02g" ${index}`
let neg="(${index} - 20)"

mkdir image-${1}
while [ ${neg} -lt ${index} ] ; do
	
	tmp=`printf "%02g" ${neg}`
	find -name angles-${tmp}.dat -exec mv {} image-${1} \;
	
let neg++
done
