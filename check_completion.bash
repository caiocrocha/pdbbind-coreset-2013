#!/bin/bash

project="/home/caio/Documentos/COVID-19/pdbbind_v2013/docking"

# Step 1 - List pdbind names
complex_list=$(ls -v ${project}/v2013-core )

todo=0
finished=0

for ex in 8 32 ; do 
  for complex in ${complex_list} ; do
    	for run in $(seq 3) ; do
           folder="${project}/pdbbind-2019.chemflow/DockFlow/qvina_ex${ex}_${run}/${complex}"

           complete[${run}]=0

           if [ -f ${folder}/out.pdbqt ] ; then 
               complete[${run}]=1
	       let finished=${finished}+1
           fi
           let todo=${todo}+1
        done
   echo "${ex} ${complex} ${complete[@]}"

    done 
  
done

echo "Todo: ${todo} Finished ${finished}"

