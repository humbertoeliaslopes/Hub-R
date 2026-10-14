#Subscritos

#Cria um vetor atômico com 1000 dados extraídos aleatoriamente
#de uma distribuição normal com média 0 e desvio-padrão 1

vetor.subscrito = rnorm(1000, 0, 1)
vetor.subscrito
mode(vetor.subscrito)

#Subscrito para identificar o 850o elemento

vetor.subscrito[850]

#Subscrito para identificar todos os valores inferiores a 0,15

vetor.subscrito[vetor.subscrito < 0.15]

#Subscrito para identificar todos os valores iguais ou maiores que 1,33

vetor.subscrito[vetor.subscrito >= 1.33]

#Subscrito para calcular a soma de todos os valores menores ou iguais a 1,23

sum(vetor.subscrito[vetor.subscrito <= 1.23])

#Os subscritos também funcionam em matrizes

#Cria uma matriz 3x4

matriz.exemplo = matrix(data = seq(102, 113), nrow = 3, ncol = 4,
                        byrow = TRUE)
matriz.exemplo

#Subscrito para identificar o elemento que está na
#interseção da segunda linha com a terceira coluna

matriz.exemplo[2, 3]

#Subscrito para identificar os elementos que estão
#interseção da terceira linha com a primeira, terceira e quarta colunas

matriz.exemplo [3, c(1, 3, 4)]

#Subscrito para identificar todos os valores da primeira linha

matriz.exemplo [1, ]

#Subscrito para identificar todos os valores da segunda coluna

matriz.exemplo [ , 2]

#Função subset para armazenar todos os valores 
#do vetor que são inferiores ou iguais a 0,1

subset.vetor = subset(vetor.subscrito, vetor.subscrito <= 0.1)
subset.vetor
mode(subset.vetor)