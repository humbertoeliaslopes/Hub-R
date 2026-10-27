#Aula 2 - Exercícios

#Escreva o código de cada exercício logo abaixo do enunciado.

#Contexto: você é analista na diretoria comercial de uma rede de lojas
#com cinco filiais em Minas Gerais. Os vetores do bloco DADOS, logo
#abaixo, trazem o desempenho mensal de cada filial ao longo de um ano
#(dados fictícios). Os vetores são:
#filial           nome da filial
#mes              mês de referência (Jan a Dez)
#faturamento_mil  faturamento do mês, em milhares de reais
#clientes         número de clientes atendidos no mês
#meta_atingida    "Sim" se a filial alcançou a meta mensal, "Não" caso contrário
#reclamacoes      número de reclamações registradas no SAC no mês


#DADOS (rode este bloco antes de começar os exercícios)

#Cada vetor abaixo tem 60 elementos, um para cada combinação de filial e
#mês, sempre na mesma ordem: os 12 primeiros valores são de Belo
#Horizonte (Jan a Dez), os 12 seguintes de Contagem, depois Betim, Juiz
#de Fora e Uberlândia.
#A função rep() repete valores: each = 12 repete cada filial 12 vezes
#seguidas, e times = 5 repete a sequência dos meses 5 vezes.
#Selecione todo o bloco e rode de uma só vez com Ctrl + Enter.

filial = rep(c("Belo Horizonte", "Contagem", "Betim",
               "Juiz de Fora", "Uberlândia"),
             each = 12) #Cada filial repetida 12 vezes, uma por mês

mes = rep(c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
            "Jul", "Ago", "Set", "Out", "Nov", "Dez"),
          times = 5) #Os 12 meses repetidos 5 vezes, uma por filial

faturamento_mil = c(308.2, 344.8, 374.7, 366, 397.2, 422, 427.9, 375.5,
                    419.8, 447.3, 542.4, 624.4, 239.8, 203.2, 236.6, 254.3,
                    271, 274.6, 265, 262.9, 269.2, 254.6, 365.1, 357.7,
                    158.1, 170.7, 202.4, 186, 195.1, 88.2, 231, 173.7, 172.1,
                    196.8, 282.2, 323.6, 240, 246.8, 297.4, 288.5, 311.2,
                    298.1, 313, 261.7, 330.6, 305, 387.9, 393.5, 281.6,
                    293.6, 326.3, 322, 308.9, 344.7, 334.4, 291.5, 340.6,
                    350.6, 403.2, 502.5)

clientes = c(1894, 1642, 2392, 1937, 2179, 2470, 2264, 2085, 2065, 2604,
             2698, 3258, 1392, 1112, 1359, 1580, 1303, 1347, 1420, 1565,
             1408, 1470, 1900, 1830, 844, 927, 1023, 940, 1027, 481, 1177,
             927, 850, 1160, 1534, 1633, 1358, 1502, 1551, 1622, 1737, 1535,
             1488, 1410, 1684, 1912, 2085, 2397, 1711, 1454, 1687, 1678,
             1730, 2032, 1759, 1700, 1591, 1886, 2136, 3026)

meta_atingida = c("Não", "Não", "Não", "Não", "Não", "Sim", "Sim", "Não",
                  "Não", "Sim", "Sim", "Sim", "Não", "Não", "Não", "Não",
                  "Sim", "Sim", "Sim", "Sim", "Sim", "Não", "Sim", "Sim",
                  "Não", "Não", "Não", "Não", "Não", "Não", "Sim", "Não",
                  "Não", "Não", "Sim", "Sim", "Não", "Não", "Não", "Não",
                  "Sim", "Não", "Sim", "Não", "Sim", "Sim", "Sim", "Sim",
                  "Não", "Não", "Não", "Não", "Não", "Sim", "Não", "Não",
                  "Sim", "Sim", "Sim", "Sim")

reclamacoes = c(12, 13, 10, 10, 17, 16, 14, 15, 12, 26, 16, 22, 10, 6, 9, 14,
                10, 7, 9, 9, 3, 5, 7, 14, 3, 5, 8, 1, 10, 1, 9, 2, 3, 3, 8,
                12, 6, 9, 3, 13, 4, 5, 15, 5, 7, 12, 15, 12, 7, 5, 15, 8, 15,
                13, 14, 12, 7, 15, 10, 17)


#BLOCO 1 - DATA FRAMES

#Exercício 1
#O setor de compras avalia quatro fornecedores de embalagens:
#Fornecedor	         Prazo (dias)  Preço unitário (R$)  Nota de qualidade
#Alfa Embalagens	  7	        3,80	             8,5
#Beta Papéis		 12	        3,20	             7,0
#Gama Suprimentos	  5	        4,10	             9,2
#Delta Distribuidora	  9	        3,55	             8,1
#a) Crie os vetores e o data frame fornecedores.
#b) Verifique o número de linhas e a estrutura do data frame.
#c) Calcule o prazo médio de entrega.
#d) Crie a coluna custo_lote com o custo de um lote de 500 unidades.




#Exercício 2
#Junte os seis vetores do bloco DADOS em um data frame chamado vendas.
#Mostre as dimensões, os nomes das colunas, as primeiras linhas e o resumo.




#Exercício 3
#a) Calcule o faturamento total do ano, somando todas as filiais.
#b) Calcule o faturamento médio por filial e por mês.
#c) Crie a coluna ticket_medio, que indica quanto cada cliente gastou,
#   em reais, em média: faturamento_mil * 1000 / clientes




#Exercício 4
#a) Transforme a coluna filial em fator.
#b) Transforme a coluna mes em fator, com os meses na ordem do calendário.
#c) Com subset(), crie o objeto vendas_bh apenas com Belo Horizonte e
#   calcule o faturamento anual dessa filial.
#Desafio: o operador & significa "e". Use-o para listar os meses em que
#Contagem faturou mais de 300 mil reais.




#BLOCO 2 - TABELAS

#Exercício 5
#Em quantos registros (filial e mês) a meta foi atingida?
#Apresente a frequência absoluta e o percentual.




#Exercício 6
#Monte uma tabela de dupla entrada de filial por meta_atingida, com totais
#e com o percentual por linha. Qual filial atingiu a meta em mais meses?
#Qual atingiu em menos meses?




#Exercício 7
#Monte uma tabela com o faturamento anual de cada filial e a sua
#participação percentual no faturamento da rede. Dê nomes claros às
#colunas.




#Exercício 8
#Calcule a média mensal de reclamações e o ticket médio de cada filial.
#A filial com mais reclamações é necessariamente a que atende pior? Por quê?
#Desafio: crie a coluna recl_mil_clientes (reclamações por mil clientes)
#e compare as filiais com esse indicador.




#BLOCO 3 - BOX PLOTS

#Exercício 9
#Calcule os quartis e a amplitude interquartil do faturamento mensal
#e construa um box plot com título e rótulo no eixo.




#Exercício 10
#Construa o box plot do faturamento mensal por filial.
#a) Qual filial tem a maior mediana? E a menor?
#b) Qual filial tem o faturamento mais estável (caixa mais baixa)?
#c) Em que meses aparecem os pontos isolados acima das caixas?
#   O que isso sugere sobre o negócio?




#Exercício 11
#Selecione apenas a filial Betim e identifique os valores atípicos do seu
#faturamento com boxplot.stats(). Em que mês ocorreu o valor muito baixo?
#O gestor deveria simplesmente apagar esse mês dos dados? Justifique.




#Exercício 12
#Construa o box plot do ticket médio por filial, com título, rótulos nos
#eixos e cor. As medianas das filiais são parecidas ou muito diferentes?
#O que isso indica sobre a origem das diferenças de faturamento?




#ATIVIDADE INTEGRADORA (em duplas)

#A diretoria comercial vai escolher uma filial para receber, no próximo
#ano, um programa de capacitação da equipe de vendas. Você deve apoiar
#essa decisão com dados.
#a) Monte uma tabela-resumo com uma linha por filial e as colunas
#   faturamento anual, faturamento médio mensal e número de meses em que
#   a meta foi atingida.
#   Dica: ifelse(vendas$meta_atingida == "Sim", 1, 0) cria uma coluna
#   de 1 e 0, que pode ser somada com aggregate().
#b) Construa o box plot do faturamento mensal por filial.
#c) Escreva, nas linhas de comentário abaixo, um parecer de 5 a 8 linhas
#   indicando a filial recomendada e os números que sustentam a escolha.

#Parecer:
#
#
#
#
#
