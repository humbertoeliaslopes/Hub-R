#Aula 2 - Gabarito dos exercícios

#Os resultados indicados nos comentários foram obtidos com os dados do
#bloco abaixo, os mesmos do arquivo Exercícios.R.


#DADOS

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

vendas = data.frame(filial, mes, faturamento_mil, clientes,
                    meta_atingida, reclamacoes)
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
