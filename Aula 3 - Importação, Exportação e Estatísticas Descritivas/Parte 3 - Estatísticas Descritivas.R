#Aula 3 - Parte 3 - Estatísticas descritivas dos dados importados

#Estatísticas descritivas resumem uma base de dados em poucos números:
#onde está o centro dos valores (medidas de posição), quanto eles
#variam (medidas de dispersão) e como se distribuem (quartis).
#Usaremos a pesquisa de satisfação de clientes de uma rede varejista,
#respondida por 150 clientes de três canais de venda.

#Preparando os dados (importação vista na Parte 1)

satisfacao = read.csv("satisfacao_clientes.csv")

str(satisfacao)

#Colunas da pesquisa:
#id_cliente        número do questionário
#canal             Loja física, Site ou Aplicativo
#idade             idade do cliente, em anos
#tempo_espera_min  tempo de espera até o atendimento, em minutos
#nota_atendimento  nota dada ao atendimento, de 0 a 10
#nota_produto      nota dada ao produto, de 0 a 10
#valor_compra      valor da compra, em reais
#recomendaria      "Sim" se o cliente recomendaria a empresa


#1. Medidas de posição: média e mediana

mean(satisfacao$valor_compra) #Média: soma dos valores dividida pela quantidade

median(satisfacao$valor_compra) #Mediana: valor do meio, com os dados em ordem

#A média (R$ 259,77) ficou bem acima da mediana (R$ 186,62).
#Isso acontece quando há valores muito altos puxando a média.
#Quem são esses clientes?
subset(satisfacao, valor_compra > 1000)

#São três compras corporativas, de R$ 1.980 a R$ 3.120.
#Para descrever a compra típica de um cliente, a mediana é mais
#representativa. Para projetar o faturamento total, a média é a medida
#adequada, porque considera todos os valores.

#Média sem as compras corporativas: R$ 213,71, bem mais próxima da
#mediana
pessoa_fisica = subset(satisfacao, valor_compra <= 1000)

mean(pessoa_fisica$valor_compra)


#2. Moda: o valor mais frequente

#Atenção: a função mode() da Aula 1 mostra o tipo do objeto e não
#calcula a moda estatística. Para encontrar a moda, usamos table().

table(satisfacao$canal) #Contagem de cada canal

which.max(table(satisfacao$canal)) #Categoria mais frequente: Loja física

table(satisfacao$nota_atendimento) #A nota mais frequente é 8

#A moda é a única medida de posição que serve para variáveis de texto,
#como canal ou recomendaria.


#3. Valores ausentes (NA)

#A coluna nota_atendimento tem respostas em branco.
mean(satisfacao$nota_atendimento) #Resultado: NA

#Basta um NA para que a conta inteira dê NA. O argumento na.rm = TRUE
#(NA remove) faz a conta só com os valores disponíveis.
mean(satisfacao$nota_atendimento, na.rm = TRUE)

#Quantos valores estão ausentes?
is.na(satisfacao$nota_atendimento) #TRUE onde há NA

sum(is.na(satisfacao$nota_atendimento)) #9 clientes não deram nota

sum(is.na(satisfacao$tempo_espera_min)) #6 tempos de espera não registrados

summary(satisfacao) #A linha NA's mostra a contagem em cada coluna

#Nunca substitua NA por zero: um cliente que não respondeu não deu nota
#zero. Trocar NA por zero derruba a média artificialmente.

#Clientes que responderam à pergunta sobre atendimento
respondentes = subset(satisfacao, !is.na(nota_atendimento))

nrow(respondentes) #141 clientes. O sinal ! significa "não"


#4. Medidas de dispersão

#Duas lojas podem ter o mesmo tempo médio de espera e serviços muito
#diferentes: em uma, todos esperam cerca de 10 minutos; na outra, uns
#esperam 2 e outros 25. A dispersão mede essa diferença.

min(satisfacao$tempo_espera_min, na.rm = TRUE) #Menor valor

max(satisfacao$tempo_espera_min, na.rm = TRUE) #Maior valor

range(satisfacao$tempo_espera_min, na.rm = TRUE) #Mínimo e máximo juntos

#Amplitude: diferença entre o maior e o menor valor
max(satisfacao$tempo_espera_min, na.rm = TRUE) -
  min(satisfacao$tempo_espera_min, na.rm = TRUE)

#Variância: média dos quadrados dos desvios em relação à média.
#Está em minutos ao quadrado, por isso é pouco usada na interpretação.
var(satisfacao$tempo_espera_min, na.rm = TRUE)

#Desvio padrão: raiz quadrada da variância, na mesma unidade dos dados.
#Indica quanto os valores se afastam, em geral, da média.
sd(satisfacao$tempo_espera_min, na.rm = TRUE)

#var() e sd() usam a fórmula da amostra (divisão por n - 1).

#Coeficiente de variação (CV): desvio padrão em percentual da média.
#Permite comparar a dispersão de variáveis com unidades diferentes.
media_espera = mean(satisfacao$tempo_espera_min, na.rm = TRUE)
dp_espera = sd(satisfacao$tempo_espera_min, na.rm = TRUE)

cv_espera = dp_espera / media_espera * 100

round(cv_espera, 1) #Em percentual

#Quanto maior o CV, maior a variação em relação à média. Não há um
#limite universal para dizer que um CV é alto: ele é mais útil para
#comparar variáveis, filiais ou períodos entre si.

cv_compra = sd(satisfacao$valor_compra) / mean(satisfacao$valor_compra) * 100

round(cv_compra, 1) #O valor das compras varia muito mais que a espera


#5. Quartis e percentis

#Os quartis dividem os dados ordenados em quatro partes, cada uma com
#25% das observações. São os valores que formam a caixa do box plot da
#Aula 2.
quantile(satisfacao$tempo_espera_min, na.rm = TRUE)

#Percentis: o argumento probs escolhe as posições desejadas.
#Exemplo: 90% dos clientes esperaram até quantos minutos?
quantile(satisfacao$tempo_espera_min, probs = 0.9, na.rm = TRUE)

#Amplitude interquartil (Q3 - Q1): dispersão dos 50% centrais
IQR(satisfacao$tempo_espera_min, na.rm = TRUE)

#summary() reúne mínimo, quartis, média e máximo de uma só vez
summary(satisfacao$tempo_espera_min)


#6. Estatísticas por grupo

#aggregate() calcula uma medida para cada categoria (Aula 2).
#Com a fórmula, as linhas com NA na variável analisada são deixadas de
#fora automaticamente.

aggregate(tempo_espera_min ~ canal, data = satisfacao, FUN = mean)

aggregate(tempo_espera_min ~ canal, data = satisfacao, FUN = sd)

aggregate(nota_atendimento ~ canal, data = satisfacao, FUN = mean)

aggregate(valor_compra ~ canal, data = satisfacao, FUN = median)

#Variáveis de texto: frequências e percentuais
table(satisfacao$canal, satisfacao$recomendaria)

round(prop.table(table(satisfacao$canal, satisfacao$recomendaria),
                 margin = 1) * 100, 1) #Percentual por linha (por canal)

#Leitura gerencial: a loja física tem a maior espera média (13,6 min),
#a menor nota de atendimento (6,5) e o menor percentual de clientes que
#recomendariam a empresa (41,9%).

boxplot(tempo_espera_min ~ canal, data = satisfacao,
        main = "Tempo de espera por canal",
        xlab = "Canal", ylab = "Minutos", col = "lightblue")


#7. Relação entre duas variáveis numéricas

#Clientes que esperam mais dão notas menores ao atendimento?
plot(satisfacao$tempo_espera_min, satisfacao$nota_atendimento,
     main = "Espera e nota do atendimento",
     xlab = "Tempo de espera (min)", ylab = "Nota do atendimento",
     pch = 19, col = "steelblue")

#O coeficiente de correlação vai de -1 a 1. Valores negativos indicam
#que uma variável diminui quando a outra aumenta.
#use = "complete.obs" usa apenas os clientes com as duas respostas.
cor(satisfacao$tempo_espera_min, satisfacao$nota_atendimento,
    use = "complete.obs")

#Resultado: -0,76, uma associação negativa forte.
#Correlação não prova causa e efeito, mas indica onde investigar: reduzir
#a espera na loja física é uma hipótese de melhoria a ser testada.


#8. Tabela de estatísticas descritivas para o relatório

#Uma tabela com as principais medidas, pronta para exportar.

espera = satisfacao$tempo_espera_min
compra = satisfacao$valor_compra

estatisticas = data.frame(
  medida = c("Observações válidas", "Média", "Mediana",
             "Desvio padrão", "Mínimo", "Máximo", "CV (%)"),
  tempo_espera_min = c(sum(!is.na(espera)),
                       mean(espera, na.rm = TRUE),
                       median(espera, na.rm = TRUE),
                       sd(espera, na.rm = TRUE),
                       min(espera, na.rm = TRUE),
                       max(espera, na.rm = TRUE),
                       sd(espera, na.rm = TRUE) / mean(espera, na.rm = TRUE) * 100),
  valor_compra = c(sum(!is.na(compra)),
                   mean(compra),
                   median(compra),
                   sd(compra),
                   min(compra),
                   max(compra),
                   sd(compra) / mean(compra) * 100))

estatisticas$tempo_espera_min = round(estatisticas$tempo_espera_min, 2)
estatisticas$valor_compra = round(estatisticas$valor_compra, 2)

estatisticas

#Tabela por canal, juntando três aggregate() em um data frame
media_canal = aggregate(tempo_espera_min ~ canal, data = satisfacao, FUN = mean)
mediana_canal = aggregate(tempo_espera_min ~ canal, data = satisfacao, FUN = median)
dp_canal = aggregate(tempo_espera_min ~ canal, data = satisfacao, FUN = sd)

espera_por_canal = data.frame(canal = media_canal$canal,
                              media = round(media_canal$tempo_espera_min, 1),
                              mediana = mediana_canal$tempo_espera_min,
                              desvio_padrao = round(dp_canal$tempo_espera_min, 1))

espera_por_canal

#Exportando as duas tabelas para o Excel (Parte 2)
library(writexl)

write_xlsx(list(geral = estatisticas, por_canal = espera_por_canal),
           "estatisticas_satisfacao.xlsx")


#9. Resumo da Parte 3

#Medida                 Função
#Média                  mean(x)
#Mediana                median(x)
#Moda                   table(x) e which.max(table(x))
#Mínimo e máximo        min(x), max(x), range(x)
#Variância              var(x)
#Desvio padrão          sd(x)
#CV (%)                 sd(x) / mean(x) * 100
#Quartis e percentis    quantile(x), quantile(x, probs = 0.9)
#Amplitude interquartil IQR(x)
#Resumo geral           summary(x)
#Por grupo              aggregate(x ~ grupo, data = dados, FUN = mean)
#Correlação             cor(x, y, use = "complete.obs")
#Com valores ausentes, acrescente na.rm = TRUE
