#Aula 3 - Exercícios

#Escreva o código de cada exercício logo abaixo do enunciado.

#Contexto: você é analista de uma loja virtual de artigos para casa que
#vende para todo o Brasil. A plataforma de vendas exportou os 200
#pedidos do último mês no arquivo pedidos_loja_virtual.csv (dados
#fictícios). As colunas são:
#pedido              número do pedido
#regiao              região de entrega (Sudeste, Sul, Nordeste,
#                    Centro-Oeste ou Norte)
#forma_pagamento     Pix, Cartão ou Boleto
#valor               valor dos produtos, em reais
#frete               valor do frete, em reais
#prazo_entrega_dias  dias entre a compra e a entrega
#avaliacao           nota de 1 a 5 dada pelo cliente (vazia quando o
#                    cliente não avaliou)

#Alguns exercícios também usam o arquivo vendas_filiais.xlsx, com o
#faturamento mensal das cinco filiais da rede de lojas da Aula 2, e o
#arquivo fornecedores_latin1.csv.

#Antes de começar, coloque os três arquivos no diretório de trabalho
#(Posit Cloud: painel Files > Upload).


#BLOCO 1: IMPORTAÇÃO (20 minutos)


#Exercício 1
#a) Mostre o diretório de trabalho, liste os arquivos dessa pasta e
#confirme com file.exists() que pedidos_loja_virtual.csv e
#vendas_filiais.xlsx estão lá.
#b) No painel Files, clique em pedidos_loja_virtual.csv e escolha View
#File. Qual é o separador de colunas? E o separador decimal? Qual
#função de importação deve ser usada? Responda em comentário.




#Exercício 2
#Importe o arquivo de pedidos para um data frame chamado pedidos e
#confira a importação com str(), nrow(), ncol(), names() e summary().
#Responda em comentário:
#a) Quantos pedidos e quantas colunas há na base?
#b) Que coluna tem valores ausentes (NA)? Quantos?
#c) As colunas numéricas foram reconhecidas como números?




#Exercício 3
#a) Carregue o pacote readxl e liste as abas de vendas_filiais.xlsx.
#b) Importe as duas abas para os data frames vendas e metas (use
#as.data.frame()).
#c) Confira se vendas tem 60 linhas e calcule o faturamento total da
#rede no ano (coluna faturamento_mil).
#d) Use subset() para mostrar a meta mensal de Belo Horizonte.




#Exercício 4
#a) Um colega tentou importar os pedidos com o código abaixo. Rode-o e
#leia a mensagem que aparece no console.
#teste = read.csv("pedidos_loja_virtual.csv")
#b) Explique em comentário por que o erro aconteceu e como corrigi-lo.
#c) Importe fornecedores_latin1.csv com read.csv2(), observe os acentos
#e corrija a importação com o argumento fileEncoding.




#BLOCO 2: EXPORTAÇÃO (15 minutos)


#Exercício 5
#A gerência regional do Nordeste pediu os pedidos da região.
#Selecione-os com subset(), grave-os em pedidos_nordeste.csv no padrão
#brasileiro (sem a coluna de números das linhas) e importe o arquivo
#gravado para conferir o número de linhas.




#Exercício 6
#Crie a coluna valor_total (valor + frete), calcule a soma dessa coluna
#e exporte a base completa para o Excel, no arquivo
#pedidos_tratados.xlsx. Lembre-se de carregar o pacote writexl.




#Exercício 7
#O SAC quer uma planilha com duas abas: criticos, com os pedidos de
#avaliação 1 ou 2, e atrasados, com os pedidos entregues em mais de 10
#dias. Monte os dois data frames, informe quantos pedidos há em cada um
#e grave o arquivo pedidos_para_analise.xlsx. Depois, baixe o arquivo
#para o seu computador.




#BLOCO 3: ESTATÍSTICAS DESCRITIVAS (25 minutos)


#Exercício 8
#a) Calcule a média e a mediana do valor dos pedidos. Por que são
#diferentes?
#b) Calcule os quartis do valor e interprete Q1 e Q3.
#c) Encontre o pedido de maior valor e a moda da forma de pagamento.




#Exercício 9
#a) Para o prazo de entrega, calcule o mínimo, o máximo, a amplitude, a
#variância, o desvio padrão e o coeficiente de variação.
#b) Na base vendas (Exercício 3), calcule a média, o desvio padrão e o
#CV do faturamento mensal de cada filial e reúna os resultados em um
#data frame.
#c) Qual filial tem o maior desvio padrão? Qual é a mais instável em
#termos relativos? Por que o CV é mais adequado para essa comparação?




#Exercício 10
#a) Calcule a avaliação média dos pedidos. O que acontece? Corrija.
#b) Quantos pedidos não foram avaliados? Que percentual da base isso
#representa?
#c) Monte a tabela de frequência das notas, com percentuais, e indique
#a moda.




#Exercício 11
#Com aggregate(), calcule por região a média e a mediana do prazo de
#entrega e a avaliação média; por forma de pagamento, calcule o valor
#médio. Construa o box plot do prazo por região e comente em duas
#linhas a relação entre prazo e avaliação.




#Exercício 12
#Monte um data frame com média, mediana, desvio padrão, mínimo, máximo
#e CV (%) das colunas valor, frete e prazo_entrega_dias, com valores
#arredondados em duas casas, e exporte-o para estatisticas_pedidos.xlsx.




#ATIVIDADE INTEGRADORA (em duplas, 20 minutos)

#A diretoria de operações vai instalar um novo centro de distribuição
#para reduzir prazos de entrega e precisa escolher a região.
#Com a base de pedidos:
#1. Monte uma tabela-resumo por região com: número de pedidos,
#participação percentual no total, faturamento com frete, prazo médio,
#desvio padrão do prazo e avaliação média.
#2. Grave o box plot do prazo de entrega por região em um arquivo .png.
#3. Exporte a tabela-resumo e a base de pedidos para um arquivo .xlsx
#com duas abas, chamado relatorio_centro_distribuicao.xlsx.
#4. Escreva, em comentário, um parecer de 5 a 8 linhas para a
#diretoria, com a região recomendada e os números que sustentam a
#escolha.

#Dica: as tabelas do aggregate() saem em ordem alfabética de região.
#Por isso, colunas de vários aggregate() podem ser juntadas em um único
#data frame, como na seção 8 da Parte 3.
