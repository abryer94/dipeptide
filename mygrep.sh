#!/bin/bash
echo Processing : ${1} ${2}
echo PSI
grep -A1 'bias_swarms_psi' ${1} | grep -o -e '\{ .* \}' | awk {'printf "%3d%8.2f\n", NR, $2'}  > psi-${2}.dat 


echo PHI

grep -A1 'bias_swarms_phi' ${1} | grep -o -e '\{ .* \}' | awk {'printf "%3d%8.2f\n", NR, $2'} > phi-${2}.dat

echo done
