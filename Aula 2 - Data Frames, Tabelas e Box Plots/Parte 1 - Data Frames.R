#Aula 2 - Parte 1 - Estruturas de dados: Data Frames

#Na aula anterior criamos vetores atômicos com a função c().
#Um data frame é uma tabela formada por vetores de mesmo tamanho,
#colocados lado a lado. Cada vetor vira uma coluna (uma variável)
#e cada linha representa uma observação (um produto, um cliente,
#um funcionário, uma venda).

#Antes de começar, no RStudio, clique em:
#Session > Set Working Directory > To Source File Location
#Assim o R passa a procurar os arquivos na pasta desta aula.


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


#5. Importando dados de um arquivo

#Na prática, os dados de uma empresa raramente são digitados no R.
#Eles chegam em planilhas ou arquivos exportados de sistemas (ERP, CRM).
#O arquivo funcionarios.csv contém dados fictícios do quadro de pessoal
#de uma empresa comercial com 60 funcionários.

#A função read.csv2() lê arquivos no padrão brasileiro do Excel:
#colunas separadas por ponto e vírgula (;) e decimais com vírgula (,).

funcionarios = read.csv2("dados/funcionarios.csv", fileEncoding = "UTF-8")

#Se aparecer o erro "cannot open file", o R não encontrou o arquivo.
#Alternativa: a linha abaixo abre uma janela para escolher o arquivo.
#funcionarios = read.csv2(file.choose(), fileEncoding = "UTF-8")

View(funcionarios)


#6. Explorando o data frame importado

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
