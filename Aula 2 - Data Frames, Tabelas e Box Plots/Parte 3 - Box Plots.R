#Aula 2 - Parte 3 - Box plots para análise

#O box plot (diagrama de caixa) mostra, em uma única figura, onde está
#o centro dos dados, quanto eles variam e se há valores atípicos.
#É muito útil para comparar grupos: salários entre áreas, vendas
#entre filiais, prazos de entrega entre fornecedores.

#Preparando os dados (as mesmas linhas da Parte 1)

funcionarios = read.csv2("dados/funcionarios.csv", fileEncoding = "UTF-8")

funcionarios$departamento = factor(funcionarios$departamento)
funcionarios$nivel = factor(funcionarios$nivel,
                            levels = c("Assistente", "Analista", "Coordenador"))
funcionarios$modalidade = factor(funcionarios$modalidade)


#1. Os números por trás do box plot

#Quartis dividem os dados ordenados em quatro partes iguais:
#Q1 (25%), mediana ou Q2 (50%) e Q3 (75%)

quantile(funcionarios$salario)
median(funcionarios$salario)

#Amplitude interquartil (AIQ) = Q3 - Q1
#Mostra a faixa em que estão os 50% centrais dos salários

IQR(funcionarios$salario)

#summary() também mostra os quartis, junto com a média

summary(funcionarios$salario)


#2. Primeiro box plot

boxplot(funcionarios$salario)

#Melhorando a apresentação: título, rótulo do eixo e cor

boxplot(funcionarios$salario,
        main = "Distribuição dos salários",
        ylab = "Salário mensal (R$)",
        col = "lightblue")

#Como ler o gráfico:
#Linha grossa no meio da caixa: mediana
#Base e topo da caixa: Q1 e Q3 (a altura da caixa é a AIQ)
#Hastes: vão até o menor e o maior valor que não são atípicos
#Pontos isolados: valores atípicos (outliers)

#Versão horizontal

boxplot(funcionarios$salario,
        main = "Distribuição dos salários",
        xlab = "Salário mensal (R$)",
        col = "lightblue",
        horizontal = TRUE)


#3. Quem são os valores atípicos?

#Regra usada pelo box plot: é atípico o valor que fica acima de
#Q3 + 1,5 x AIQ ou abaixo de Q1 - 1,5 x AIQ

q1 = quantile(funcionarios$salario, 0.25)
q3 = quantile(funcionarios$salario, 0.75)
aiq = IQR(funcionarios$salario)

limite_superior = q3 + 1.5 * aiq
limite_inferior = q1 - 1.5 * aiq
limite_superior
limite_inferior

#Funcionários com salário acima do limite superior

subset(funcionarios, salario > limite_superior)

#O próprio R informa os valores atípicos que desenhou no gráfico

boxplot.stats(funcionarios$salario)$out

#Observação: o box plot calcula a caixa por um método muito parecido
#com o do quantile(). Em alguns conjuntos de dados os limites podem
#diferir ligeiramente, sem mudar a interpretação.

#Um valor atípico não é necessariamente um erro. Pode ser um
#coordenador com remuneração acima do padrão, um erro de digitação
#ou um caso que merece atenção do RH. Investigue antes de excluir.


#4. Comparando grupos com box plots

#O símbolo ~ significa "em função de": salário em função do nível

boxplot(salario ~ nivel, data = funcionarios,
        main = "Salário por nível hierárquico",
        xlab = "Nível",
        ylab = "Salário mensal (R$)",
        col = c("lightyellow", "lightgreen", "lightblue"))

#Salário por departamento, na horizontal, para os nomes caberem
#las = 1 deixa os nomes dos departamentos na horizontal
#par(mar = ...) aumenta a margem esquerda para os nomes longos

par(mar = c(5, 9, 4, 2))
boxplot(salario ~ departamento, data = funcionarios,
        main = "Salário por departamento",
        xlab = "Salário mensal (R$)",
        ylab = "",
        col = "lightblue",
        horizontal = TRUE,
        las = 1)
par(mar = c(5, 4, 4, 2)) #Volta as margens ao padrão

#Avaliação de desempenho por modalidade de trabalho

boxplot(avaliacao ~ modalidade, data = funcionarios,
        main = "Avaliação de desempenho por modalidade",
        xlab = "Modalidade de trabalho",
        ylab = "Nota da avaliação (0 a 10)",
        col = "lightgreen")

#Horas de treinamento por nível

boxplot(horas_treinamento ~ nivel, data = funcionarios,
        main = "Horas de treinamento por nível",
        xlab = "Nível",
        ylab = "Horas de treinamento no ano",
        col = "lightyellow")

#Para conferir a leitura do gráfico com números, use o aggregate()

aggregate(salario ~ nivel, data = funcionarios, FUN = median)
aggregate(avaliacao ~ modalidade, data = funcionarios, FUN = median)


#5. Box plot de um grupo selecionado

#Somente o departamento de Vendas, por nível

equipe_vendas = subset(funcionarios, departamento == "Vendas")

boxplot(salario ~ nivel, data = equipe_vendas,
        main = "Vendas: salário por nível",
        xlab = "Nível",
        ylab = "Salário mensal (R$)",
        col = "orange")

#Atenção: em Vendas há apenas dois coordenadores. Com tão poucas
#observações a caixa fica instável e deve ser lida com cautela.

table(equipe_vendas$nivel)


#6. Salvando o gráfico em arquivo de imagem

#png() abre o arquivo, boxplot() desenha nele e dev.off() fecha e salva

png("boxplot_salario_nivel.png", width = 800, height = 600)
boxplot(salario ~ nivel, data = funcionarios,
        main = "Salário por nível hierárquico",
        xlab = "Nível",
        ylab = "Salário mensal (R$)",
        col = c("lightyellow", "lightgreen", "lightblue"))
dev.off()

#A imagem pode ser inserida em um relatório ou em uma apresentação.
#No RStudio também é possível usar o botão Export da aba Plots.
