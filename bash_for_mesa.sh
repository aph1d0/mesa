#!/bin/bash
initial_mass=2.4
overshootsf=( 0.01 0.02 0.03)
sed -i "s/initial_mass =.*/initial_mass = $initial_mass/"  inlist_ZAMStoWD
for i in ${overshootsf[*]}
do 
	sed -i "s/overshoot_f(1) =.*/overshoot_f(1) = $i/"  inlist_ZAMStoWD
	sed -i "s/overshoot_f0(1) =.*/overshoot_f0(1) = $(python -c "print($i*0.2)")/"  inlist_ZAMStoWD
	git add .
	git commit -m "$initial_mass\_$i"
	git push
	curl http://35.240.16.76/git/notifyCommit?url=https://github.com/aph1d0/mesa.git
	sleep 600
done

