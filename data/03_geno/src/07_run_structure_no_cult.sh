#!/bin/bash

admix(){
	admixture -j2 --cv $1 $2 | tee $3/log$2.out
} 

export -f admix

parallel -j 3  admix data/admix/cpepo/cpepo_nocult.bed {} data/admix/cpepo ::: $(seq 1 15) 
mv *.Q data/admix/cpepo/
mv *.P data/admix/cpepo/

parallel -j 3  admix data/admix/cmoschata/cmoschata_nocult.bed {} data/admix/cmoschata ::: $(seq 1 15) 
mv *.Q data/admix/cmoschata/
mv *.P data/admix/cmoschata/

parallel -j 3  admix data/admix/cmaxima/cmaxima_nocult.bed {} data/admix/cmaxima ::: $(seq 1 15) 
mv *.Q data/admix/cmaxima/
mv *.P data/admix/cmaxima/

# Format output logs

grep -h "CV" data/admix/cpepo/log*.out | cut -d " " -f3,4 | tr "(K=):" ":" | sed s/://g | cut -f1,2 > data/admix/cpepo/cv_error.txt

grep -h "CV" data/admix/cmoschata/log*.out | cut -d " " -f3,4 | tr "(K=):" ":" | sed s/://g | cut -f1,2 > data/admix/cmoschata/cv_error.txt

grep -h "CV" data/admix/cmaxima/log*.out | cut -d " " -f3,4 | tr "(K=):" ":" | sed s/://g | cut -f1,2 > data/admix/cmaxima/cv_error.txt

