#!/bin/sh
./Allclean
opv1812
blockMesh -region fluid
cp -r 0.orig 0
checkMesh -allGeometry -allTopology -region fluid
topoSet -region fluid
rm output.log
initAlphaField -region fluid
opv2012
setExprFields -region fluid
opv1812
multiRegionPhaseChangeFlow > output.log &


# decomposePar -allRegions
# mpirun -np 6 multiRegionPhaseChangeFlow -parallel > output.log &
# setFields -region fluid
