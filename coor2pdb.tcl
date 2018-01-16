for {set i 0} {${i}<10} {incr i} {
  mol new alad.psf
  mol addfile string-0${i}.coor
  set sel [atomselect top all]
  $sel writepdb string-0${i}.pdb }
  
for {set i 10} {${i}>=10 && ${i}<20} {incr i} {
  mol new alad.psf
  mol addfile string-${i}.coor
  set sel [atomselect top all]
  $sel writepdb string-${i}.pdb }
