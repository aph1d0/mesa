#!/bin/bash
initial_mass=1.7
overshootsf=( 0.07 0.08 0.09 )
sed -i "s/initial_mass =.*/initial_mass = $initial_mass/"  inlist_ZAMStoWD
for i in ${overshootsf[*]}
do 
	sed -i "s/overshoot_f(1) =.*/overshoot_f(1) = $i/"  inlist_ZAMStoWD
	sed -i "s/overshoot_f0(1) =.*/overshoot_f0(1) = $(python -c "print($i*2)")/"  inlist_ZAMStoWD
	git add .
	git commit -m "$initial_mass\_$i"
	git push
	sleep 600
done
