#Aula 2 - Parte 1 - Estruturas de dados: Data Frames

#Na aula anterior criamos vetores atômicos com a função c().
#Um data frame é uma tabela formada por vetores de mesmo tamanho,
#colocados lado a lado. Cada vetor vira uma coluna (uma variável)
#e cada linha representa uma observação (um produto, um cliente,
#um funcionário, uma venda).


#1. Criando um data frame a partir de vetores

#Cadastro de produtos de uma pequena loja de material de escritório

#Produto	    Categoria	  Preço (R$)  Estoque (unidades)
#Caneta	            Escrita	   2,50	        340
#Caderno	    Papelaria	  18,90	        125
#Grampeador	    Escritório	  32,00	         40
#Resma de papel	    Papelaria	  27,50	         80
#Marca-texto	    Escrita	   4,20	        210

#Criando os vetores necessários

produto = c("Caneta", "Caderno", "Grampeador", "Resma de papel", "Marca-texto")
produto
mode(produto)

categoria = c("Escrita", "Papelaria", "Escritório", "Papelaria", "Escrita")
categoria
mode(categoria)

preco = c(2.50, 18.90, 32.00, 27.50, 4.20)
preco
mode(preco)

estoque = c(340, 125, 40, 80, 210)
estoque
mode(estoque)

#Juntando os vetores em um data frame

produtos = data.frame(produto, categoria, preco, estoque)
produtos
View(produtos) #Abre o data frame em uma aba, como uma planilha


#2. Conhecendo o data frame

nrow(produtos)  #Número de linhas (observações)
ncol(produtos)  #Número de colunas (variáveis)
dim(produtos)   #Linhas e colunas ao mesmo tempo
names(produtos) #Nomes das colunas
str(produtos)   #Estrutura: tipo de cada coluna e primeiros valores
summary(produtos) #Resumo estatístico de cada coluna


#3. Acessando uma coluna com o operador $

#O $ retira uma coluna do data frame. O resultado é um vetor atômico,
#exatamente como os que criamos na aula anterior.

produtos$preco
mode(produtos$preco)

produtos$produto

#Como o resultado é um vetor, podemos fazer contas com ele

mean(produtos$preco)    #Preço médio dos produtos
sum(produtos$estoque)   #Total de unidades em estoque
max(produtos$preco)     #Maior preço
min(produtos$estoque)   #Menor estoque


#4. Criando uma nova coluna

#Valor do estoque de cada produto = preço x quantidade em estoque

produtos$valor_estoque = produtos$preco * produtos$estoque
produtos

#Valor total do estoque da loja

sum(produtos$valor_estoque)


#5. Um data frame maior: o quadro de pessoal da empresa

#Vamos montar, com os mesmos passos da seção 1, o cadastro fictício de
#uma empresa comercial com 60 funcionários. Primeiro criamos um vetor
#para cada coluna e depois juntamos todos com data.frame().

#Cada vetor abaixo tem 60 elementos, um para cada funcionário, sempre
#na mesma ordem: o primeiro valor de cada vetor é do funcionário 1001,
#o segundo é do funcionário 1002, e assim por diante.
#Dica: selecione todo o bloco, do vetor matricula até o data.frame(),
#e rode de uma só vez com Ctrl + Enter.

matricula = 1001:1060 #Números de 1001 a 1060, em sequência

departamento = c("Vendas", "Recursos Humanos", "Logística", "Logística",
                 "Vendas", "Marketing", "Financeiro", "Vendas", "Vendas",
                 "Vendas", "Logística", "Marketing", "Vendas", "Vendas",
                 "Vendas", "Logística", "Logística", "Financeiro", "Vendas",
                 "Recursos Humanos", "Marketing", "Financeiro", "Vendas",
                 "Recursos Humanos", "Logística", "Financeiro", "Logística",
                 "Marketing", "Vendas", "Logística", "Vendas",
                 "Recursos Humanos", "Vendas", "Vendas", "Vendas",
                 "Marketing", "Financeiro", "Marketing", "Logística",
                 "Logística", "Marketing", "Logística", "Vendas",
                 "Recursos Humanos", "Recursos Humanos", "Logística",
                 "Financeiro", "Financeiro", "Recursos Humanos",
                 "Financeiro", "Recursos Humanos", "Financeiro", "Vendas",
                 "Marketing", "Marketing", "Financeiro", "Marketing",
                 "Logística", "Logística", "Vendas")

nivel = c("Assistente", "Coordenador", "Analista", "Analista", "Analista",
          "Coordenador", "Assistente", "Coordenador", "Assistente",
          "Analista", "Analista", "Analista", "Analista", "Analista",
          "Assistente", "Analista", "Assistente", "Assistente", "Assistente",
          "Analista", "Analista", "Analista", "Analista", "Assistente",
          "Analista", "Assistente", "Coordenador", "Assistente",
          "Assistente", "Assistente", "Analista", "Analista", "Coordenador",
          "Assistente", "Analista", "Coordenador", "Analista", "Assistente",
          "Assistente", "Analista", "Analista", "Assistente", "Assistente",
          "Assistente", "Assistente", "Assistente", "Analista", "Analista",
          "Analista", "Assistente", "Coordenador", "Coordenador", "Analista",
          "Assistente", "Assistente", "Coordenador", "Analista",
          "Coordenador", "Analista", "Analista")

modalidade = c("Híbrido", "Remoto", "Presencial", "Presencial", "Híbrido",
               "Híbrido", "Híbrido", "Híbrido", "Híbrido", "Híbrido",
               "Presencial", "Híbrido", "Presencial", "Híbrido", "Híbrido",
               "Presencial", "Presencial", "Híbrido", "Presencial",
               "Presencial", "Remoto", "Remoto", "Presencial", "Híbrido",
               "Presencial", "Híbrido", "Presencial", "Presencial",
               "Híbrido", "Presencial", "Presencial", "Híbrido", "Híbrido",
               "Híbrido", "Híbrido", "Híbrido", "Presencial", "Presencial",
               "Presencial", "Presencial", "Presencial", "Híbrido",
               "Híbrido", "Híbrido", "Presencial", "Presencial",
               "Presencial", "Híbrido", "Presencial", "Presencial", "Remoto",
               "Remoto", "Presencial", "Híbrido", "Presencial", "Remoto",
               "Híbrido", "Presencial", "Presencial", "Híbrido")

tempo_empresa = c(9.5, 7, 10.3, 2.8, 13.5, 15, 3.1, 13.8, 8.4, 14.7, 2.6,
                  1.4, 14.3, 11.5, 3.5, 2.1, 6.4, 5.9, 14.5, 13.2, 6.9, 12.5,
                  11.8, 6.5, 5.2, 5.5, 13, 8.7, 3.4, 8.5, 2.3, 0.6, 13.1,
                  4.6, 13.9, 18.8, 2.3, 7.2, 9.3, 9.1, 6.1, 13.1, 2.2, 2.8,
                  9.8, 3.1, 11.9, 6.6, 1, 5.8, 8.8, 10.7, 3.6, 11.8, 6.6,
                  15.8, 11.7, 10, 4.3, 11)

salario = c(3157.8, 9791.43, 5775.89, 4469.97, 5780.78, 12704.88, 3286.08,
            11013.83, 3212.56, 6086.79, 4387.04, 5502.17, 6766.26, 6756.88,
            2557.94, 4348.67, 2533.79, 3167.14, 3132.59, 6147.4, 5906.33,
            7022.49, 6408.51, 2813.35, 4872.25, 3468.69, 10767.71, 3032,
            2602.67, 3094.7, 5103.11, 4446.08, 19800, 2909.86, 6417.65,
            11991.81, 6316.46, 3129.3, 3279.08, 5080.07, 5827.24, 3202.04,
            2745.22, 2512.35, 2898.96, 7900, 6888.62, 6480.87, 5043.23,
            3204.46, 10073.43, 12223, 5421.31, 3359.38, 3199.9, 12927.9,
            6998.67, 9967.85, 4945.96, 6185.59)

horas_treinamento = c(38, 32, 6, 28, 11, 39, 35, 17, 31, 10, 11, 27, 23, 32,
                      14, 30, 29, 36, 10, 29, 26, 30, 57, 34, 35, 13, 23, 26,
                      18, 27, 24, 37, 48, 30, 22, 20, 21, 23, 27, 14, 22, 38,
                      45, 41, 6, 40, 20, 39, 31, 45, 37, 31, 21, 23, 29, 7,
                      25, 21, 18, 46)

avaliacao = c(8.6, 7.7, 6.1, 8.1, 6, 6.2, 7.1, 6.1, 8.4, 4.3, 6.9, 8.4, 6.9,
              7.7, 4.5, 6.6, 6.6, 6.1, 5.7, 5.9, 6.5, 7.5, 8.6, 7.3, 6.1,
              7.5, 6.6, 5.8, 6.4, 6.1, 6, 7.7, 8.6, 7.9, 6.9, 6.4, 7.2, 7.8,
              9.7, 7, 6.3, 7.6, 9.4, 8.3, 4, 8.7, 8.1, 7.9, 8, 8.7, 6.2, 6.4,
              7.9, 6.2, 6.9, 5.8, 5.2, 5.8, 7.4, 8.9)

#Juntando os vetores no data frame funcionarios

funcionarios = data.frame(matricula, departamento, nivel, modalidade,
                          tempo_empresa, salario, horas_treinamento,
                          avaliacao)

View(funcionarios)


#6. Explorando o data frame da empresa

dim(funcionarios)
names(funcionarios)
head(funcionarios)     #Seis primeiras linhas
head(funcionarios, 10) #Dez primeiras linhas
tail(funcionarios)     #Seis últimas linhas
str(funcionarios)
summary(funcionarios)

#Perguntas gerenciais respondidas com uma coluna de cada vez

mean(funcionarios$salario)           #Salário médio
median(funcionarios$salario)         #Salário mediano
sum(funcionarios$salario)            #Folha de pagamento mensal
mean(funcionarios$horas_treinamento) #Horas médias de treinamento no ano
max(funcionarios$tempo_empresa)      #Maior tempo de casa, em anos


#7. Transformando colunas de texto em fatores

#Na aula anterior vimos que um fator guarda categorias.
#As colunas departamento, nivel e modalidade são categorias.

funcionarios$departamento = factor(funcionarios$departamento)
levels(funcionarios$departamento) #Categorias encontradas

#Os níveis hierárquicos têm uma ordem natural. O argumento levels
#informa essa ordem ao R, e ela será respeitada nas tabelas e gráficos.

funcionarios$nivel = factor(funcionarios$nivel,
                            levels = c("Assistente", "Analista", "Coordenador"))
levels(funcionarios$nivel)

funcionarios$modalidade = factor(funcionarios$modalidade)

str(funcionarios)
summary(funcionarios) #Agora o resumo conta quantos há em cada categoria


#8. Criando novas colunas no data frame da empresa

#Custo anual com salários, considerando 12 salários e o 13º salário

funcionarios$salario_anual = funcionarios$salario * 13
head(funcionarios)

#Classificando os funcionários pelo tempo de empresa com ifelse()
#ifelse(condição, valor se verdadeiro, valor se falso)

funcionarios$faixa_tempo = ifelse(funcionarios$tempo_empresa >= 5,
                                  "5 anos ou mais", "Menos de 5 anos")
head(funcionarios)


#9. Selecionando parte dos dados com subset()

#Recordando os operadores de comparação:
# ==  igual a          !=  diferente de
# >   maior que        >=  maior ou igual a
# <   menor que        <=  menor ou igual a

#Somente os funcionários do departamento de Vendas

equipe_vendas = subset(funcionarios, departamento == "Vendas")
equipe_vendas
nrow(equipe_vendas)
mean(equipe_vendas$salario)

#Funcionários com avaliação de desempenho igual ou superior a 8

destaques = subset(funcionarios, avaliacao >= 8)
nrow(destaques)
mean(destaques$horas_treinamento) #Treinamento médio dos destaques
mean(funcionarios$horas_treinamento) #Treinamento médio de todos


#10. Salvando o data frame em um arquivo

#O arquivo pode ser aberto no Excel e enviado para outra área da empresa

write.csv2(equipe_vendas, "equipe_vendas.csv", row.names = FALSE)
