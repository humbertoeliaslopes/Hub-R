#Aula 3 - Gabarito dos exercícios

#Os resultados indicados nos comentários foram obtidos com os arquivos
#pedidos_loja_virtual.csv, vendas_filiais.xlsx e fornecedores_latin1.csv
#da pasta da aula. Antes de rodar, confira se eles estão no diretório de
#trabalho com list.files().


#BLOCO 1: IMPORTAÇÃO


#Exercício 1

#a)
getwd() #No Posit Cloud: "/cloud/project"

list.files()

file.exists("pedidos_loja_virtual.csv") #TRUE

file.exists("vendas_filiais.xlsx") #TRUE

#b) As colunas são separadas por ponto e vírgula e o separador decimal é
#a vírgula (por exemplo, 90,88). É o padrão brasileiro, lido com
#read.csv2().


#Exercício 2

pedidos = read.csv2("pedidos_loja_virtual.csv")

str(pedidos)

nrow(pedidos) #200 pedidos

ncol(pedidos) #7 colunas

names(pedidos)

summary(pedidos)

#Respostas:
#a) 200 pedidos e 7 colunas.
#b) Apenas a coluna avaliacao tem valores ausentes: 31 NA's, que são os
#clientes que não avaliaram a compra.
#c) valor, frete, prazo_entrega_dias e avaliacao aparecem como num ou
#int, o que confirma que a vírgula decimal foi lida corretamente.


#Exercício 3

library(readxl) #Se necessário, antes: install.packages("readxl")

excel_sheets("vendas_filiais.xlsx") #"vendas" e "metas"

vendas = as.data.frame(read_excel("vendas_filiais.xlsx", sheet = "vendas"))

metas = as.data.frame(read_excel("vendas_filiais.xlsx", sheet = "metas"))

str(vendas)

nrow(vendas) #60 linhas: 5 filiais x 12 meses

metas

sum(vendas$faturamento_mil) #18.457,7 mil reais no ano

#A meta mensal de Belo Horizonte é de 420 mil reais (aba metas).
subset(metas, filial == "Belo Horizonte")


#Exercício 4

#a) O código abaixo produz o erro "more columns than column names".
#Por isso ele está comentado neste gabarito.
#teste = read.csv("pedidos_loja_virtual.csv")

#b) read.csv() espera vírgula entre as colunas. No arquivo de pedidos, a
#vírgula é o separador decimal, então o R encontra mais colunas nos
#dados (cada número com vírgula vira duas colunas) do que nomes no
#cabeçalho. A solução é usar read.csv2().

#c)
fornecedores = read.csv2("fornecedores_latin1.csv")

fornecedores #Acentos trocados por códigos como "\xe1"

fornecedores = read.csv2("fornecedores_latin1.csv", fileEncoding = "latin1")

fornecedores #Acentos corretos


#BLOCO 2: EXPORTAÇÃO


#Exercício 5

pedidos_nordeste = subset(pedidos, regiao == "Nordeste")

nrow(pedidos_nordeste) #44 pedidos

write.csv2(pedidos_nordeste, "pedidos_nordeste.csv", row.names = FALSE)

conferencia = read.csv2("pedidos_nordeste.csv")

nrow(conferencia) #44, igual ao data frame exportado

str(conferencia) #Os tipos das colunas foram preservados


#Exercício 6

pedidos$valor_total = pedidos$valor + pedidos$frete

head(pedidos)

sum(pedidos$valor_total) #R$ 53.608,80 com o frete incluído

library(writexl) #Se necessário, antes: install.packages("writexl")

write_xlsx(pedidos, "pedidos_tratados.xlsx")


#Exercício 7

criticos = subset(pedidos, avaliacao <= 2)

nrow(criticos) #19 pedidos com avaliação 1 ou 2

atrasados = subset(pedidos, prazo_entrega_dias > 10)

nrow(atrasados) #20 pedidos entregues em mais de 10 dias

#subset() deixa de fora as linhas com NA na condição: os pedidos sem
#avaliação não entram na aba criticos.

write_xlsx(list(criticos = criticos, atrasados = atrasados),
           "pedidos_para_analise.xlsx")

#Para baixar no Posit Cloud: painel Files, marcar o arquivo,
#More > Export > Download.


#BLOCO 3: ESTATÍSTICAS DESCRITIVAS


#Exercício 8

mean(pedidos$valor) #R$ 240,83

median(pedidos$valor) #R$ 204,34

#a) A média é maior que a mediana porque alguns pedidos de valor alto
#(o maior chega a R$ 917,50) puxam a média para cima. Metade dos
#pedidos tem valor de até R$ 204,34.

quantile(pedidos$valor)

#b) Q1 = R$ 141,66 e Q3 = R$ 294,60: a metade central dos pedidos está
#entre esses dois valores.

max(pedidos$valor) #R$ 917,50

subset(pedidos, valor == max(pedidos$valor)) #Pedido 50063, do Sudeste, pago com boleto

#c) Moda da forma de pagamento
table(pedidos$forma_pagamento)

which.max(table(pedidos$forma_pagamento)) #Pix, com 88 pedidos


#Exercício 9

#a)
min(pedidos$prazo_entrega_dias) #1 dia

max(pedidos$prazo_entrega_dias) #16 dias

max(pedidos$prazo_entrega_dias) - min(pedidos$prazo_entrega_dias) #Amplitude: 15 dias

var(pedidos$prazo_entrega_dias) #10,80 dias ao quadrado

sd(pedidos$prazo_entrega_dias) #3,29 dias

sd(pedidos$prazo_entrega_dias) / mean(pedidos$prazo_entrega_dias) * 100 #CV: 62,9%

#b)
media_filial = aggregate(faturamento_mil ~ filial, data = vendas, FUN = mean)
dp_filial = aggregate(faturamento_mil ~ filial, data = vendas, FUN = sd)

cv_filial = data.frame(filial = media_filial$filial,
                       media = round(media_filial$faturamento_mil, 1),
                       desvio_padrao = round(dp_filial$faturamento_mil, 1),
                       cv = round(dp_filial$faturamento_mil /
                                    media_filial$faturamento_mil * 100, 1))

cv_filial

#           filial media desvio_padrao   cv
#   Belo Horizonte 420.9          87.0 20.7
#            Betim 198.3          60.1 30.3
#         Contagem 271.2          46.5 17.2
#     Juiz de Fora 306.1          48.0 15.7
#       Uberlândia 341.7          60.2 17.6

#c) Belo Horizonte tem o maior desvio padrão (87,0 mil reais), mas é a
#maior filial. Em termos relativos, a mais instável é Betim (CV de
#30,3%), influenciada pelo mês de junho, e a mais estável é Juiz de
#Fora (15,7%). O CV permite comparar filiais de portes diferentes.


#Exercício 10

mean(pedidos$avaliacao) #NA, por causa dos pedidos sem avaliação

mean(pedidos$avaliacao, na.rm = TRUE) #3,91

sum(is.na(pedidos$avaliacao)) #31 pedidos sem avaliação

sum(is.na(pedidos$avaliacao)) / nrow(pedidos) * 100 #15,5% dos pedidos

table(pedidos$avaliacao)

#  1  2  3  4  5
#  8 11 33 54 63

which.max(table(pedidos$avaliacao)) #Moda: nota 5

round(prop.table(table(pedidos$avaliacao)) * 100, 1)

#Entre os pedidos avaliados (169), 37,3% deram nota 5 e 11,2% deram
#nota 1 ou 2 (8 + 11 = 19 pedidos). prop.table() calcula os
#percentuais sobre os pedidos avaliados, porque table() ignora os NA.


#Exercício 11

aggregate(prazo_entrega_dias ~ regiao, data = pedidos, FUN = mean)

aggregate(prazo_entrega_dias ~ regiao, data = pedidos, FUN = median)

aggregate(avaliacao ~ regiao, data = pedidos, FUN = mean)

aggregate(valor ~ forma_pagamento, data = pedidos, FUN = mean)

boxplot(prazo_entrega_dias ~ regiao, data = pedidos,
        main = "Prazo de entrega por região",
        xlab = "Região", ylab = "Dias", col = "lightblue")

#Médias de prazo: Centro-Oeste 5,86; Nordeste 9,02; Norte 11,00;
#Sudeste 2,96; Sul 4,76 dias.
#Avaliação média: Centro-Oeste 4,00; Nordeste 2,93; Norte 2,33;
#Sudeste 4,50; Sul 4,00.
#Leitura: quanto maior o prazo da região, menor a avaliação média.
#O box plot mostra que o Nordeste tem a caixa mais alta depois do
#Norte e a maior dispersão de prazos.


#Exercício 12

valor = pedidos$valor
frete = pedidos$frete
prazo = pedidos$prazo_entrega_dias

estatisticas_pedidos = data.frame(
  medida = c("Média", "Mediana", "Desvio padrão", "Mínimo", "Máximo", "CV (%)"),
  valor = c(mean(valor), median(valor), sd(valor), min(valor), max(valor),
            sd(valor) / mean(valor) * 100),
  frete = c(mean(frete), median(frete), sd(frete), min(frete), max(frete),
            sd(frete) / mean(frete) * 100),
  prazo_entrega_dias = c(mean(prazo), median(prazo), sd(prazo), min(prazo),
                         max(prazo), sd(prazo) / mean(prazo) * 100))

estatisticas_pedidos$valor = round(estatisticas_pedidos$valor, 2)
estatisticas_pedidos$frete = round(estatisticas_pedidos$frete, 2)
estatisticas_pedidos$prazo_entrega_dias = round(estatisticas_pedidos$prazo_entrega_dias, 2)

estatisticas_pedidos

#          medida  valor frete prazo_entrega_dias
#           Média 240.83 27.21               5.22
#         Mediana 204.34 24.80               4.00
#   Desvio padrão 148.35  9.17               3.29
#          Mínimo  39.79 12.44               1.00
#          Máximo 917.50 53.62              16.00
#          CV (%)  61.60 33.70              62.89

write_xlsx(estatisticas_pedidos, "estatisticas_pedidos.xlsx")


#ATIVIDADE INTEGRADORA

#Tabela-resumo por região. Todas as tabelas do aggregate() saem em
#ordem alfabética de região, por isso podem ser juntadas lado a lado.

qtd = aggregate(pedido ~ regiao, data = pedidos, FUN = length)
fat = aggregate(valor_total ~ regiao, data = pedidos, FUN = sum)
pz_media = aggregate(prazo_entrega_dias ~ regiao, data = pedidos, FUN = mean)
pz_dp = aggregate(prazo_entrega_dias ~ regiao, data = pedidos, FUN = sd)
aval = aggregate(avaliacao ~ regiao, data = pedidos, FUN = mean)

resumo_regioes = data.frame(regiao = qtd$regiao,
                            pedidos = qtd$pedido,
                            participacao = round(qtd$pedido / sum(qtd$pedido) * 100, 1),
                            faturamento = round(fat$valor_total, 2),
                            prazo_medio = round(pz_media$prazo_entrega_dias, 1),
                            prazo_dp = round(pz_dp$prazo_entrega_dias, 1),
                            avaliacao_media = round(aval$avaliacao, 2))

resumo_regioes

#         regiao pedidos participacao faturamento prazo_medio prazo_dp avaliacao_media
#   Centro-Oeste      14          7.0     3297.11         5.9      1.4            4.00
#       Nordeste      44         22.0    13437.62         9.0      3.2            2.93
#          Norte       9          4.5     2547.89        11.0      2.6            2.33
#        Sudeste      92         46.0    21595.67         3.0      1.1            4.50
#            Sul      41         20.5    12730.51         4.8      1.5            4.00

png("prazo_por_regiao.png", width = 900, height = 600)
boxplot(prazo_entrega_dias ~ regiao, data = pedidos,
        main = "Prazo de entrega por região",
        xlab = "Região", ylab = "Dias", col = "lightblue")
dev.off()

write_xlsx(list(resumo_regioes = resumo_regioes, pedidos = pedidos),
           "relatorio_centro_distribuicao.xlsx")

#Parecer (exemplo):
#Recomendamos instalar o novo centro de distribuição no Nordeste. A
#região responde por 22% dos pedidos (44 de 200) e por R$ 13,4 mil de
#faturamento no período, o segundo maior volume, atrás apenas do
#Sudeste. Seu prazo médio de entrega é de 9 dias, três vezes o do Sudeste,
#com a maior variação entre as regiões (desvio padrão de 3,2 dias), e
#a avaliação média dos clientes é de 2,93, bem abaixo da média geral de
#3,91. O Norte tem prazo e avaliação ainda piores, mas concentra só 9
#pedidos (4,5%), o que não justifica, por ora, o investimento. Antes da
#decisão final, convém verificar o custo do frete e acompanhar o
#volume do Norte nos próximos meses.
