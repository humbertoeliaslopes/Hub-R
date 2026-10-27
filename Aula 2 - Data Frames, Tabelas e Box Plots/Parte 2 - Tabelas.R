#Aula 2 - Parte 2 - Elaboração de tabelas

#Tabelas resumem muitos dados em poucos números e são a forma mais
#comum de levar informação para uma reunião ou um relatório gerencial.

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
funcionarios$faixa_tempo = ifelse(funcionarios$tempo_empresa >= 5,
                                  "5 anos ou mais", "Menos de 5 anos")


#1. Tabela de frequência absoluta

#Pergunta: quantos funcionários há em cada departamento?

table(funcionarios$departamento)

#Ordenando do maior para o menor departamento

sort(table(funcionarios$departamento), decreasing = TRUE)

#Outras tabelas simples

table(funcionarios$nivel)
table(funcionarios$modalidade)


#2. Tabela de frequência relativa (proporções e percentuais)

#prop.table() divide cada contagem pelo total

prop.table(table(funcionarios$departamento))

#Multiplicando por 100 e arredondando para uma casa decimal

round(prop.table(table(funcionarios$departamento)) * 100, 1)

#Para não repetir comandos longos, guardamos a tabela em um objeto

tab_dep = table(funcionarios$departamento)
tab_dep
round(prop.table(tab_dep) * 100, 1)


#3. Montando uma tabela de frequência completa como data frame

#Convertendo a tabela em data frame

tabela_dep = data.frame(tab_dep)
tabela_dep
names(tabela_dep) #O R chama as colunas de Var1 e Freq

#Dando nomes claros às colunas

names(tabela_dep) = c("Departamento", "Funcionarios")

#Acrescentando a coluna de percentual

tabela_dep$Percentual = round(tabela_dep$Funcionarios /
                                sum(tabela_dep$Funcionarios) * 100, 1)
tabela_dep

#Conferência: os percentuais devem somar 100 (ou quase, por arredondamento)

sum(tabela_dep$Percentual)


#4. Tabela de dupla entrada (tabela de contingência)

#Pergunta: como cada departamento adota o trabalho presencial,
#híbrido ou remoto?

tab_dep_mod = table(funcionarios$departamento, funcionarios$modalidade)
tab_dep_mod

#Acrescentando os totais de linhas e colunas

addmargins(tab_dep_mod)

#Percentual por linha: em cada departamento, qual a participação
#de cada modalidade? (margin = 1 indica linhas)

round(prop.table(tab_dep_mod, margin = 1) * 100, 1)

#Percentual por coluna: em cada modalidade, de quais departamentos
#vêm os funcionários? (margin = 2 indica colunas)

round(prop.table(tab_dep_mod, margin = 2) * 100, 1)

#Outra tabela de dupla entrada: nível hierárquico por tempo de casa

table(funcionarios$nivel, funcionarios$faixa_tempo)


#5. Tabelas com médias e outras medidas por grupo

#aggregate(variável ~ grupo, data = data frame, FUN = função)
#Lê-se: calcule a função da variável para cada grupo.

#Salário médio por departamento

aggregate(salario ~ departamento, data = funcionarios, FUN = mean)

#Salário mediano por departamento

aggregate(salario ~ departamento, data = funcionarios, FUN = median)

#Salário médio por nível hierárquico

aggregate(salario ~ nivel, data = funcionarios, FUN = mean)

#Avaliação média de desempenho por modalidade de trabalho

aggregate(avaliacao ~ modalidade, data = funcionarios, FUN = mean)

#O resultado do aggregate() é um data frame, então podemos tratá-lo

salario_dep = aggregate(salario ~ departamento, data = funcionarios, FUN = mean)
names(salario_dep) = c("Departamento", "Salario_medio")
salario_dep$Salario_medio = round(salario_dep$Salario_medio, 2)
salario_dep

#Folha de pagamento mensal por departamento (soma em vez de média)

folha_dep = aggregate(salario ~ departamento, data = funcionarios, FUN = sum)
names(folha_dep) = c("Departamento", "Folha_mensal")
folha_dep$Participacao = round(folha_dep$Folha_mensal /
                                 sum(folha_dep$Folha_mensal) * 100, 1)
folha_dep

#Duas variáveis ao mesmo tempo com cbind()

aggregate(cbind(salario, avaliacao) ~ departamento,
          data = funcionarios, FUN = mean)

#Dois grupos ao mesmo tempo: salário médio por departamento e nível

aggregate(salario ~ departamento + nivel, data = funcionarios, FUN = mean)


#6. Exportando as tabelas para o Excel

write.csv2(tabela_dep, "tabela_departamentos.csv", row.names = FALSE)
write.csv2(folha_dep, "tabela_folha_departamentos.csv", row.names = FALSE)

#Os arquivos são gravados na pasta de trabalho. Para saber qual é:

getwd()
