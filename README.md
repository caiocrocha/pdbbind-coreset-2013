# *Docking* molecular com o *PDBbind coreset* 2013

Este é um experimento que conduzi durante um trabalho de Iniciação Científica como membro do GET da Engenharia Computacional na Universidade Federal de Juiz de Fora.

Este ensaio faz parte do estudo da atracagem molecular, também conhecida como *docking* molecular, para seu uso na busca de candidatos a fármacos contra a SARS-CoV-2, a protease principal da COVID-19. Nesse contexto, com o objetivo de estudar a influência de parâmetros disponíveis em programas de *docking*, foram realizadas vários experimentos de atracagem molecular com base no banco de dados **PDBbind coreset**, versão 2013.

## Link para o artigo original (PDF)
[A influência dos parâmetros no *docking* com o QuickVina 2](https://github.com/caiocrocha/pdbbind-coreset-2013/blob/825fc73452f831058bee519ac63e43a1b72d0a41/A%20influ%C3%AAncia%20dos%20par%C3%A2metros%20no%20docking%20com%20o%20QuickVina%202.pdf)

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
