#Aula 3 - Parte 2 - Exportação de resultados

#Exportar é gravar um data frame do R em um arquivo que outras pessoas
#possam abrir no Excel ou em outro sistema. É assim que uma análise
#feita no R chega ao relatório, à diretoria ou à equipe.

#Preparando os dados (importação vista na Parte 1)

funcionarios = read.csv2("funcionarios.csv")

estoque = read.delim("estoque.txt")

str(funcionarios)


#1. Preparando o que será exportado

#Equipe do departamento de Vendas
equipe_vendas = subset(funcionarios, departamento == "Vendas")

nrow(equipe_vendas) #18 funcionários

#Tabela de salários por departamento, como na Aula 2
resumo_salarios = aggregate(salario ~ departamento, data = funcionarios,
                            FUN = mean)

names(resumo_salarios) = c("departamento", "salario_medio") #Renomeia as colunas

resumo_salarios$salario_medio = round(resumo_salarios$salario_medio, 2)

resumo_salarios


#2. CSV no padrão brasileiro: write.csv2()

#write.csv2() grava com ponto e vírgula entre as colunas e vírgula
#decimal, o formato que o Excel brasileiro abre corretamente com dois
#cliques.
#O argumento row.names = FALSE evita uma coluna extra com os números
#das linhas.

write.csv2(equipe_vendas, "equipe_vendas.csv", row.names = FALSE)

list.files() #O arquivo equipe_vendas.csv aparece na pasta

#Boa prática: importar o arquivo gravado e conferir
conferencia = read.csv2("equipe_vendas.csv")

nrow(conferencia) #18 linhas, como o data frame original


#3. CSV no padrão internacional: write.csv()

#Para enviar dados a sistemas ou a colegas de outros países, use o
#padrão internacional (vírgula entre as colunas e ponto decimal).

write.csv(resumo_salarios, "resumo_salarios.csv", row.names = FALSE)

#Resumo das funções de gravação de CSV:
#Padrão                                Gravar          Ler
#; entre colunas e decimal com vírgula write.csv2()    read.csv2()
#, entre colunas e decimal com ponto   write.csv()     read.csv()


#4. Planilhas do Excel: write_xlsx()

#Assim como na leitura, o R básico não grava .xlsx. O pacote writexl
#faz esse trabalho.

#Instalação: só uma vez. Se o pacote já estiver instalado, pule esta linha.
install.packages("writexl")

library(writexl)

#Uma tabela em uma aba
write_xlsx(resumo_salarios, "resumo_salarios.xlsx")

#Várias tabelas, uma em cada aba: junte-as com list() e dê um nome a
#cada aba. O nome à esquerda do = será o nome da aba no Excel.
write_xlsx(list(resumo = resumo_salarios,
                equipe_vendas = equipe_vendas,
                cadastro_completo = funcionarios),
           "relatorio_rh.xlsx")

list.files()


#5. Exemplo gerencial: lista de compras para o setor de suprimentos

estoque$valor_estoque = estoque$estoque * estoque$custo_unitario

#Produtos no ponto de pedido ou abaixo dele
repor = subset(estoque, estoque <= ponto_pedido)

#Quantidade sugerida: o dobro do ponto de pedido, menos o que já existe
repor$quantidade_compra = 2 * repor$ponto_pedido - repor$estoque

repor$custo_compra = repor$quantidade_compra * repor$custo_unitario

repor

sum(repor$custo_compra) #Valor total da compra, em reais

write_xlsx(list(compras = repor, estoque_completo = estoque),
           "pedido_de_compras.xlsx")


#6. Gráficos em arquivo: png()

#Na Aula 2, copiamos gráficos pelo botão Export da aba Plots.
#Também é possível gravá-los por código, o que garante que o gráfico
#seja refeito igual sempre que o script rodar.
#png() abre o arquivo, o gráfico é desenhado nele e dev.off() o fecha.

png("boxplot_salario_departamento.png", width = 900, height = 600)
boxplot(salario ~ departamento, data = funcionarios,
        main = "Salário mensal por departamento",
        xlab = "Departamento", ylab = "Salário (R$)",
        col = "lightblue")
dev.off()


#7. Formato do próprio R: saveRDS() e readRDS()

#O formato .rds guarda o data frame exatamente como está no R, inclusive
#os fatores e a ordem dos níveis. Serve para continuar o trabalho
#depois, no R, mas não abre no Excel.

funcionarios$nivel = factor(funcionarios$nivel,
                            levels = c("Assistente", "Analista",
                                       "Coordenador"))

saveRDS(funcionarios, "funcionarios.rds")

funcionarios_salvos = readRDS("funcionarios.rds")

levels(funcionarios_salvos$nivel) #A ordem dos níveis foi preservada


#8. Levando os arquivos para o seu computador (Posit Cloud)

#Os arquivos gravados ficam na pasta do projeto, na nuvem. Para
#baixá-los:
#1. No painel Files, marque a caixa ao lado de cada arquivo.
#2. Clique na engrenagem More e escolha Export.
#3. Confirme o nome e clique em Download. Se vários arquivos estiverem
#marcados, eles são baixados juntos em um arquivo .zip.
#No RStudio instalado no computador, os arquivos já estão na pasta de
#trabalho (veja o caminho com getwd()).


#9. Resumo da Parte 2

#Destino                          Função
#Excel brasileiro (.csv)          write.csv2(dados, "arquivo.csv", row.names = FALSE)
#Sistemas e padrão internacional  write.csv(dados, "arquivo.csv", row.names = FALSE)
#Planilha do Excel (.xlsx)        write_xlsx(dados, "arquivo.xlsx")
#Excel com várias abas            write_xlsx(list(aba1 = d1, aba2 = d2), "arquivo.xlsx")
#Gráfico (.png)                   png("grafico.png"), gráfico, dev.off()
#Continuar no R (.rds)            saveRDS(dados, "arquivo.rds")
