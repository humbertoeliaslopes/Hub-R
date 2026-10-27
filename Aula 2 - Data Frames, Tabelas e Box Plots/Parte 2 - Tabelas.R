#Aula 2 - Parte 2 - Elaboração de tabelas

#Tabelas resumem muitos dados em poucos números e são a forma mais
#comum de levar informação para uma reunião ou um relatório gerencial.

#Preparando os dados (as mesmas linhas da Parte 1)

funcionarios = read.csv2("dados/funcionarios.csv", fileEncoding = "UTF-8")

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
