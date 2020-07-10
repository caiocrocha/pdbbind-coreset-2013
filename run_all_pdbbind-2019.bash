#!/bin/bash

###################
# Config
###################
base="/home/caio/Documentos/COVID-19/pdbbind_v2013_docking"
input_folder="${base}/v2013-core"
DockFlow_base="/home/caio/Documentos/COVID-19/DockFlow_base"
verbose=false

###################
# Functions
###################
write_config() {
args=$(${DockFlow_base}/binding_box.py ${input_folder}/${complex}/${complex}_ligand.mol2)
args=($args)
echo "
receptor       = ${folder}/receptor.pdbqt
ligand         = ${folder}/ligand.pdbqt
center_x       = ${args[1]}
center_y       = ${args[3]}
center_z       = ${args[5]}
size_x         = ${args[7]}
size_y         = ${args[9]}
size_z         = ${args[11]}
out            = ${folder}/out.pdbqt
log            = ${folder}/out.log
num_modes      = 10
exhaustiveness = 8
energy_range   = 3.0
cpu            = 1
"
}


###################
# Program
###################

# Step 1 - List pdbbind names
complex_list=$(ls -v ${input_folder})

if ${verbose}; then
    echo ${complex_list}
fi

# Step 2 - Prepare dockings
for complex in ${complex_list} ; do 

    folder="${base}/pdbbind-2019.chemflow/DockFlow/qvina_ex8/${complex}"

    if [ ! -d ${folder} ] ; then
        mkdir -p ${folder}
    fi

    if [ ! -f "${folder}/receptor.pdbqt" ] ; then
        ${MGLTOOLS_BIN}/pythonsh ${MGLTOOLS_UTIL}/prepare_receptor4.py -r ${input_folder}/${complex}/${complex}_protein.pdb -o ${folder}/receptor.pdbqt -U nphs_lps_waters & 
    fi

    if [ ! -f "${folder}/ligand.pdbqt" ]   ; then
        ${MGLTOOLS_BIN}/pythonsh ${MGLTOOLS_UTIL}/prepare_ligand4.py -l ${input_folder}/${complex}/${complex}_ligand.mol2   -o ${folder}/ligand.pdbqt -U lps &
    fi 
 
done

wait

# Step 3 - Run Dockings
for complex in ${complex_list} ; do
    for run in $(seq 3) ; do
	
	folder="${base}/pdbbind-2019.chemflow/DockFlow/qvina_ex32_${run}/${complex}"
        if [ ! -d ${folder} ] ; then
	    mkdir -p ${folder}
	    cp pdbbind-2019.chemflow/DockFlow/qvina_ex8/${complex}/* ${folder}/
	fi

	write_config > ${folder}/config.in

        if [ ! -f "${folder}/out.pdbqt" ] && [ -f ${folder}/receptor.pdbqt ] && [ -f ${folder}/ligand.pdbqt ] ; then
  	    echo "${QVINA_EXEC} --config ${folder}/config.in &>${folder}/out.job"
        fi
    done
done > run.xargs
