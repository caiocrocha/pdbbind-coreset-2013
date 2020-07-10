#!/bin/bash

base=~/Documentos/COVID-19/pdbbind_v2013_docking/rescore
project=~/Documentos/COVID-19/pdbbind_dgomes

compare() {
# Para juntar

echo "MODEL 0" > compare.pdbqt
cat ${folder}/${COMPLEX}/ligand.pdbqt >> compare.pdbqt
echo "ENDMDL" >> compare.pdbqt
cat ${folder}/${COMPLEX}/rescore.pdbqt >> compare.pdbqt

pymol compare.pdbqt -c -d "intra_rms compare" | awk '/cmd.intra_rms/{print $2}' > out.rmsd

awk 'BEGIN{OFS=",";}/Affinity/ {print $2}' > out.energy

paste -d ',' ${folder}/out.energy ${folder}/out.rmsd | awk -v data="${complex},${function}" '
    BEGIN { split(data,d,/,/); FS=OFS="," }
    { print data[1], data[2], $1, $2 }
    ' >> ${base}/rmsd.csv
}

echo "id,function,energy,RMSD" > ${base}/rmsd.csv

complexes="$(for complex in ${project}/v2013-core/* ; do printf '%s\n' "$(basename ${complex})" ; done)"

for function in "plants" "qvina" "smina" "vina" "vinardo" ; do
    folder="${project}/v2013-core_${function}"
    for COMPLEX in ${complexes} ; do
        compare
    done
done

rm compare.pdbqt out.energy out.rmsd
