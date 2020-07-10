#!/bin/bash

base=~/Documentos/COVID-19
project="${base}/pdbbind_v2013_docking/pdbbind-2019.chemflow"

run_vina() {
vina --cpu 1 --local_only \
     --receptor ${dir}/receptor.pdbqt \
     --ligand ${filename} \
     ${coordinates}
}

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

awk -v LIGAND=${LIGAND} -v POSE=${POSE} 'BEGIN{OFS=",";}/Affinity/ {print LIGAND,POSE,$2}'

}

ligands=$(ls ${base}/pdbbind_v2013_docking/v2013-core)
total=$(ls ${base}/pdbbind_v2013_docking/v2013-core | wc -l)
count=1

echo 'id,pose,vina'    >${base}/pdbbind_v2013_docking/rescore_vina.csv
echo 'id,pose,smina'   >${base}/pdbbind_v2013_docking/rescore_smina.csv
echo 'id,pose,vinardo' >${base}/pdbbind_v2013_docking/rescore_vinardo.csv

for LIGAND in ${ligands} ; do

    echo -en "${LIGAND}  ${count}/${total} \r"

    for ex in 8 ; do
        for run in 1 ; do

            dir="${project}/DockFlow/qvina_ex${ex}_${run}/${LIGAND}"

            if [ ! -d ${dir}/poses ] ; then
                mkdir -p ${dir}/poses
            fi
  
            vina_split --input ${dir}/out.pdbqt --ligand ${dir}/poses/ >/dev/null 2>&1

            for filename in ${dir}/poses/* ; do
                POSE="$(basename $filename)"
                POSE="${POSE%.*}"

                coordinates="$(${base}/DockFlow_base/binding_box.py ${base}/pdbbind_v2013_docking/v2013-core/${LIGAND}/${LIGAND}_ligand.mol2 --padding 2.0)"

                run_vina | get_score >>${base}/pdbbind_v2013_docking/rescore_vina.csv & 
                run_smina | get_score >>${base}/pdbbind_v2013_docking/rescore_smina.csv & 
                run_smina_vinardo | get_score >>${base}/pdbbind_v2013_docking/rescore_vinardo.csv &

                wait

            done

            rm -rf ${dir}/poses

        done
    done

    let count=${count}+1
done

