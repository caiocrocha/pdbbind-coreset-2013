#!/bin/bash

project="pdbbind-2019.chemflow"
output_file="qvina_ex8_1.csv"

echo "id,pose,qvina" > ${output_file}

ligands="$(ls ${project}/DockFlow/qvina_ex8_1/)"

for LIGAND in ${ligands} ; do
    awk -v LIGAND="${LIGAND}" $'/-----/{flag=1;next}/Writing/{flag=0}BEGIN{OFS=","}flag{print LIGAND,$1,$2}' ${project}/DockFlow/qvina_ex8_1/${LIGAND}/out.log

done >>${output_file}
