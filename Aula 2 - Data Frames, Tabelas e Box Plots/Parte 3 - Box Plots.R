#Aula 2 - Parte 3 - Box plots para análise

#O box plot (diagrama de caixa) mostra, em uma única figura, onde está
#o centro dos dados, quanto eles variam e se há valores atípicos.
#É muito útil para comparar grupos: salários entre áreas, vendas
#entre filiais, prazos de entrega entre fornecedores.

#Preparando os dados (os mesmos da Parte 1)

#Os vetores com os dados dos 60 funcionários são os mesmos da Parte 1.
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

funcionarios = data.frame(matricula, departamento, nivel, modalidade,
                          tempo_empresa, salario, horas_treinamento,
                          avaliacao)

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
