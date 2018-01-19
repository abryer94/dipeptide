#!/bin/bash

echo >> out-${1}.R                                                          
                                                                            
for i in {1..1..1} ; do                                                     
  printf "library(ggplot2)"                                                   
  printf "\ndata${1} <- read.table(\"Rline-${1}.dat\", header = FALSE, sep=\" 
  \", skip=1)"                                                                
  printf "\n\tgg${1} <- ggplot(data${1}, aes(x=V1, y=V2)) +"                  
  printf "\n\tgeom_point(col=\"${2}\", size=3) +"                             
  printf "\n\tcoord_cartesian(xlim=c(-150,150), ylim=c(-150,150))"            
                                                                            
done > out-${1}.R                                                           
echo Done writing file: out-${1}.R                                          
                                       
