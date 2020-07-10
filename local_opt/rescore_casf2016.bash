#!/bin/bash

base=~/Documentos/COVID-19
project=CASF-2016/coreset

run_smina() {
smina --cpu 1 --minimize \
      --receptor ${dir}/receptor.pdbqt \
      --ligand ${filename} \
      ${coordinates}
}

run_smina_vinardo() {
smina --cpu 1 --minimize --scoring vinardo \
      --receptor ${dir}/receptor.pdbqt \
      --ligand ${filename} \
      ${coordinates}
}

get_score() {

awk -v LIGAND=${LIGAND} 'BEGIN{OFS=" ";}/Affinity/ {print LIGAND,$2}'

}

ligands=$(ls ${project})
total=$(ls ${project} | wc -l)
count=1

echo '#code score' > Smina.dat
echo '#code score' > Smina_vinardo.dat

for LIGAND in ${ligands} ; do

    echo -en "${LIGAND}  ${count}/${total} \r"

    dir="${project}/${LIGAND}"
    filename="${dir}/ligand.pdbqt"
            
    coordinates="$(~/Documentos/CASF-2016/bbox.py ${dir}/ligand.mol2 --padding 2.0)"
            
    run_smina | get_score >>Smina.dat & 
    run_smina_vinardo | get_score >>Smina_vinardo.dat &

    wait

    let count=${count}+1
done

