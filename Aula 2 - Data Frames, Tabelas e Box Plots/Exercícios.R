#Aula 2 - Exercícios

#Escreva o código de cada exercício logo abaixo do enunciado.
#Lembre-se: Session > Set Working Directory > To Source File Location

#Contexto: você é analista na diretoria comercial de uma rede de lojas
#com cinco filiais em Minas Gerais. O arquivo dados/vendas_filiais.csv
#traz o desempenho mensal de cada filial ao longo de um ano (dados
#fictícios). As colunas são:
#filial           nome da filial
#mes              mês de referência (Jan a Dez)
#faturamento_mil  faturamento do mês, em milhares de reais
#clientes         número de clientes atendidos no mês
#meta_atingida    "Sim" se a filial alcançou a meta mensal, "Não" caso contrário
#reclamacoes      número de reclamações registradas no SAC no mês


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
#Importe o arquivo dados/vendas_filiais.csv para um objeto chamado vendas.
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
#colunas e exporte a tabela para o arquivo faturamento_por_filial.csv.




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
#Construa o box plot do ticket médio por filial e salve-o no arquivo
#boxplot_ticket_filial.png.




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
