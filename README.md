# *Docking* molecular com o *PDBbind coreset* 2013

Este é um experimento que conduzi durante um trabalho de Iniciação Científica como membro do GET Engenharia Computacional na Universidade Federal de Juiz de Fora (UFJF).

Este ensaio faz parte do estudo da atracagem molecular, também conhecida como *docking* molecular, para seu uso na busca de candidatos a fármacos contra a SARS-CoV-2, a protease principal da COVID-19. Nesse contexto, com o objetivo de estudar a influência de parâmetros disponíveis em programas de *docking*, foram realizadas vários experimentos de atracagem molecular com base no banco de dados **PDBbind coreset**, versão 2013.

## Link para o artigo original (PDF)
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
