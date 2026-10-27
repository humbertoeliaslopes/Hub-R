#Aula 2 - Gabarito dos exercícios

#Os resultados indicados nos comentários foram obtidos com o arquivo
#dados/vendas_filiais.csv distribuído com esta aula.


#BLOCO 1 - DATA FRAMES

#Exercício 1

nome = c("Alfa Embalagens", "Beta Papéis", "Gama Suprimentos", "Delta Distribuidora")
prazo_entrega = c(7, 12, 5, 9)
preco_unitario = c(3.80, 3.20, 4.10, 3.55)
nota_qualidade = c(8.5, 7.0, 9.2, 8.1)

fornecedores = data.frame(nome, prazo_entrega, preco_unitario, nota_qualidade)
fornecedores
nrow(fornecedores) #4
str(fornecedores)

mean(fornecedores$prazo_entrega) #8,25 dias

fornecedores$custo_lote = fornecedores$preco_unitario * 500
fornecedores #Alfa 1900; Beta 1600; Gama 2050; Delta 1775

#Exercício 2

vendas = read.csv2("dados/vendas_filiais.csv", fileEncoding = "UTF-8")
dim(vendas)   #60 linhas e 6 colunas
names(vendas)
head(vendas)
summary(vendas)

#Exercício 3

sum(vendas$faturamento_mil)  #Faturamento total do ano: 18.457,7 mil reais
mean(vendas$faturamento_mil) #Média por filial e mês: 307,6 mil reais

vendas$ticket_medio = vendas$faturamento_mil * 1000 / vendas$clientes
head(vendas)

#Exercício 4

vendas$filial = factor(vendas$filial)
vendas$mes = factor(vendas$mes,
                    levels = c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
                               "Jul", "Ago", "Set", "Out", "Nov", "Dez"))
str(vendas)

vendas_bh = subset(vendas, filial == "Belo Horizonte")
nrow(vendas_bh)                #12 meses
sum(vendas_bh$faturamento_mil) #5.050,2 mil reais

#Desafio: meses de Contagem com mais de 300 mil reais

subset(vendas, filial == "Contagem" & faturamento_mil > 300) #Nov e Dez


#BLOCO 2 - TABELAS

#Exercício 5

table(vendas$meta_atingida)                          #Não 34; Sim 26
round(prop.table(table(vendas$meta_atingida)) * 100, 1) #Não 56,7%; Sim 43,3%

#Exercício 6

tab_meta = table(vendas$filial, vendas$meta_atingida)
addmargins(tab_meta)
round(prop.table(tab_meta, margin = 1) * 100, 1)

#Contagem atingiu a meta em mais meses (7 de 12, 58,3%).
#Betim foi a que menos atingiu (3 de 12, 25,0%).
#Como cada filial tem a sua própria meta, este indicador permite comparar
#filiais de portes diferentes de forma mais justa que o faturamento bruto.

#Exercício 7

fat_filial = aggregate(faturamento_mil ~ filial, data = vendas, FUN = sum)
names(fat_filial) = c("Filial", "Faturamento_anual")
fat_filial$Participacao = round(fat_filial$Faturamento_anual /
                                  sum(fat_filial$Faturamento_anual) * 100, 1)
fat_filial

#Belo Horizonte tem o maior faturamento anual (5.050,2 mil reais, 27,4%)
#e Betim o menor (2.379,9 mil reais, 12,9%).

write.csv2(fat_filial, "faturamento_por_filial.csv", row.names = FALSE)

#Exercício 8

aggregate(reclamacoes ~ filial, data = vendas, FUN = mean)
aggregate(ticket_medio ~ filial, data = vendas, FUN = mean)

#Belo Horizonte tem a maior média de reclamações por mês (15,3), o que é
#esperado por atender mais clientes. Para comparar filiais de tamanhos
#diferentes, o ideal seria calcular reclamações por mil clientes.
#O ticket médio fica entre 182 e 190 reais em todas as filiais.
#Mesmo por mil clientes, Belo Horizonte continua com o maior índice (6,6).

#Desafio: reclamações por mil clientes

vendas$recl_mil_clientes = vendas$reclamacoes / vendas$clientes * 1000
aggregate(recl_mil_clientes ~ filial, data = vendas, FUN = mean)


#BLOCO 3 - BOX PLOTS

#Exercício 9

quantile(vendas$faturamento_mil)
IQR(vendas$faturamento_mil)

boxplot(vendas$faturamento_mil,
        main = "Faturamento mensal das filiais",
        ylab = "Faturamento (mil R$)",
        col = "lightblue")

#Exercício 10

boxplot(faturamento_mil ~ filial, data = vendas,
        main = "Faturamento mensal por filial",
        xlab = "Filial",
        ylab = "Faturamento (mil R$)",
        col = "lightgreen")

aggregate(faturamento_mil ~ filial, data = vendas, FUN = median)
aggregate(faturamento_mil ~ filial, data = vendas, FUN = IQR)

#Maior mediana: Belo Horizonte (408,5 mil reais). Menor: Betim (190,6).
#Maior variação (caixa mais alta): Belo Horizonte, com AIQ de 60,2 mil reais.
#Contagem tem a caixa mais baixa (AIQ de 21,2), ou seja, a receita mais estável.
#Quase todos os pontos isolados acima das caixas são de novembro e dezembro,
#efeito da sazonalidade do comércio (Black Friday e Natal). São valores
#atípicos, mas não são erros. O ponto de Betim abaixo da caixa é diferente:
#é o mês de junho, muito abaixo do padrão da filial.

#Exercício 11

vendas_betim = subset(vendas, filial == "Betim")
boxplot.stats(vendas_betim$faturamento_mil)$out
#Resultado: 88,2 (junho, abaixo) e 323,6 (dezembro, acima)
subset(vendas_betim, faturamento_mil < 150) #Junho, 88,2 mil reais e 481 clientes

#O mês de junho em Betim ficou muito abaixo dos demais. Antes de qualquer
#decisão, o gestor deve investigar a causa (falta de estoque, reforma da
#loja, problema no sistema, erro de lançamento). Não se exclui o dado sem
#entender o que aconteceu.

#Exercício 12

png("boxplot_ticket_filial.png", width = 800, height = 600)
boxplot(ticket_medio ~ filial, data = vendas,
        main = "Ticket médio por filial",
        xlab = "Filial",
        ylab = "Ticket médio (R$)",
        col = "orange")
dev.off()


#ATIVIDADE INTEGRADORA

#a) Tabela-resumo por filial

resumo = aggregate(faturamento_mil ~ filial, data = vendas, FUN = sum)
names(resumo) = c("Filial", "Faturamento_anual")

media_mensal = aggregate(faturamento_mil ~ filial, data = vendas, FUN = mean)
resumo$Media_mensal = round(media_mensal$faturamento_mil, 1)

vendas$bateu_meta = ifelse(vendas$meta_atingida == "Sim", 1, 0)
meses_meta = aggregate(bateu_meta ~ filial, data = vendas, FUN = sum)
resumo$Meses_com_meta = meses_meta$bateu_meta

resumo

#b) Box plot do faturamento mensal por filial (o mesmo do exercício 10)

boxplot(faturamento_mil ~ filial, data = vendas,
        main = "Faturamento mensal por filial",
        xlab = "Filial",
        ylab = "Faturamento (mil R$)",
        col = "lightgreen")

#c) Padrão de resposta do parecer: ver o arquivo Roteiro da aula.md
