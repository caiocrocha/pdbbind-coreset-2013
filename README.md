# *Docking* molecular com o *PDBbind coreset* 2013

*Description in English bellow.*

Este é um experimento que conduzi com o Prof. Diego Enry durante um trabalho de Iniciação Científica como membro do GET Engenharia Computacional na Universidade Federal de Juiz de Fora (UFJF).

Este ensaio faz parte do estudo da atracagem molecular, também conhecida como *docking* molecular, para seu uso na busca de candidatos a fármacos contra a SARS-CoV-2, a protease principal da COVID-19. Nesse contexto, com o objetivo de estudar a influência de parâmetros disponíveis em programas de *docking*, foram realizadas vários experimentos de atracagem molecular com base no banco de dados **PDBbind coreset**, versão 2013 (Wang et al. 2019).

## Link para o artigo rascunho (PDF)
[A influência dos parâmetros no *docking* com o QuickVina 2](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/A_influ_ncia_dos_par_metros_no_docking_com_o_QuickVina_2.pdf)

## Mesa de conteúdos

> [RESULTS](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/RESULTS.ipynb)    
> [Local optimization scores](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/local_opt/Local%20optimization%20scores.ipynb)    
> [RESCORE](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/rescore/RESCORE.ipynb)

### RESULTS
Neste notebook, são apresentados os resultados do ensaio primário, em que foram conduzidas simulações de *docking* molecular para diferentes complexos proteína-ligante, cada qual realizada com parâmetros variados utilizando o programa *QuickVina 2*.

### Local optimization scores
Aqui, encontram-se os resultados de um experimento no qual foram realizadas otimizações locais do ligante na sua protéina correspondente. Assim, são avaliadas diferentes funções de pontuação e os dados obtidos são comparados com os valores experimentais *in vitro*.

### RESCORE

Neste último notebook, são interpretadas as repontuações de diferentes funções de pontuação após simulações de *redocking* dos resultados do primeiro ensaio, utilizando o *QuickVina 2*.

## Referências
Minyi Su, Qifan Yang, Yu Du, Guoqin Feng, Zhihai Liu, Yan Li,* Renxiao Wang,*, "Comparative Assessment of Scoring Functions: The CASF-2016 Update", J. Chem. Inf. Model, 2019, Vol. 59: pp 895-913.

# Molecular *Docking* with *PDBbind coreset* 2013

This is an experiment I made with Prof. Diego Enry during a Scientific Initiation work as a member of GET Computational Engineering at the Federal University of Juiz de Fora (UFJF).

This assay is part of the study of molecular docking, also known as molecular *docking*, for its use in the search for drug candidates against SARS-CoV-2, the main protease of COVID-19. In this context, in order to study the influence of parameters available in *docking* programs, several molecular docking experiments were performed based on the **PDBbind coreset** database, version 2013 (Wang et al. 2019).

## Link to the draft article, only available in portuguese (PDF).
[The influence of parameters on *docking* with QuickVina 2](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/A_influ_ncia_dos_par_metros_no_docking_com_o_QuickVina_2.pdf)

## Table of Contents

> [RESULTS](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/RESULTS.ipynb)    
> [Local optimization scores](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/local_opt/Local%20optimization%20scores.ipynb)    
> [RESCORE](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/master/rescore/RESCORE.ipynb)

### RESULTS
In this notebook, the results of the primary assay are presented. Several molecular *docking* simulations were ran for different protein-ligand complexes, each one ran with a different parameter using *QuickVina 2*.

### Local optimization scores
The results of the experiment ran with local optimizations of the ligand are presented here. Different scoring functions are evaluated and the obtained data are compared with experimental values *in vitro*.

### RESCORE

In this last notebook, I present the re-scoring result of different scoring functions after *redocking* the conformers generated in the first assay using *QuickVina 2*.

## References
Minyi Su, Qifan Yang, Yu Du, Guoqin Feng, Zhihai Liu, Yan Li,* Renxiao Wang,* "Comparative Assessment of Scoring Functions: The CASF-2016 Update," J. Chem. Inf. Model, 2019, Vol. 59: pp 895-913.
