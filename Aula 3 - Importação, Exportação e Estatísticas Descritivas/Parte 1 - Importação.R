#Aula 3 - Parte 1 - Importação de arquivos de dados

#Nas aulas anteriores, os dados foram digitados no próprio script, em
#vetores. Nas empresas, porém, os dados chegam prontos: planilhas do
#Excel, arquivos CSV exportados por sistemas (ERP, CRM, plataformas de
#comércio eletrônico, formulários de pesquisa) e arquivos de texto.
#Importar é trazer esses arquivos para dentro do R como um data frame.

#Arquivos usados nesta parte (todos com dados fictícios):
#funcionarios.csv         cadastro de pessoal (o mesmo da Aula 2)
#satisfacao_clientes.csv  pesquisa de satisfação de clientes
#estoque.txt              posição de estoque de materiais
#despesas.xlsx            despesas por departamento, em Excel
#fornecedores_latin1.csv  cadastro de fornecedores salvo em Latin-1


#1. Onde o R procura os arquivos: o diretório de trabalho

#O R lê e grava arquivos em uma pasta chamada diretório de trabalho.
#Se o arquivo não estiver nessa pasta, o R não o encontra.

getwd() #Mostra o diretório de trabalho (no Posit Cloud: "/cloud/project")

list.files() #Lista os arquivos do diretório de trabalho

file.exists("funcionarios.csv") #TRUE se o arquivo está na pasta, FALSE se não está

#Como colocar os arquivos de dados no diretório de trabalho:
#Posit Cloud: no painel Files (canto inferior direito), clique em
#Upload, depois em Escolher arquivo, selecione o arquivo e clique em OK.
#O arquivo vai para a pasta que está aberta no painel, que deve ser a
#pasta inicial do projeto (Cloud > project).
#RStudio instalado no computador: salve os arquivos de dados na mesma
#pasta deste script e use o menu Session > Set Working Directory >
#To Source File Location.
#Se o list.files() não mostrar os arquivos, rode o script
#"Baixar arquivos.R", que copia todos eles da internet para a pasta.


#2. CSV no padrão brasileiro: read.csv2()

#CSV (comma-separated values) é um arquivo de texto em que cada linha é
#uma observação e as colunas são separadas por um caractere.
#No Brasil, o Excel grava o CSV com ponto e vírgula entre as colunas e
#vírgula como separador decimal. Exemplo das primeiras linhas:
#"matricula";"departamento";"nivel";...;"salario";...
#1001;"Vendas";"Assistente";...;3157,8;...
#Para ver o conteúdo bruto, clique no arquivo no painel Files e escolha
#View File.

#Para esse padrão, a função é read.csv2()
funcionarios = read.csv2("funcionarios.csv")

View(funcionarios) #Abre a tabela em uma aba, como uma planilha


#3. Conferindo a importação

#Sempre confira um arquivo recém-importado antes de analisá-lo.

str(funcionarios) #Tipo de cada coluna: salario precisa ser num, não chr

nrow(funcionarios) #Número de linhas (observações): 60

ncol(funcionarios) #Número de colunas (variáveis): 8

names(funcionarios) #Nomes das colunas, exatamente como o R os reconhece

head(funcionarios) #Seis primeiras linhas

tail(funcionarios) #Seis últimas linhas

summary(funcionarios) #Resumo de cada coluna

#Os dados são os mesmos da Aula 2. A folha de pagamento deve dar o
#mesmo valor que calculamos naquela aula:
sum(funcionarios$salario)

#Roteiro de conferência:
#a) O número de linhas e de colunas confere com o arquivo?
#b) Os nomes das colunas estão corretos?
#c) As colunas numéricas aparecem como num ou int (e não como chr)?
#d) Os acentos aparecem corretamente?


#4. CSV no padrão internacional: read.csv()

#Sistemas e plataformas on-line costumam exportar o CSV no padrão
#internacional: vírgula entre as colunas e ponto como separador
#decimal. Exemplo:
#"id_cliente","canal","idade","tempo_espera_min",...
#1,"Aplicativo",39,6,,10,424.04,"Sim"

satisfacao = read.csv("satisfacao_clientes.csv")

str(satisfacao)

summary(satisfacao) #Repare na linha NA's de algumas colunas

#Células vazias no arquivo viram NA (not available, valor ausente).
#Na pesquisa, NA significa que o cliente não respondeu à pergunta.
#Valores ausentes serão tratados na Parte 3.

#Resumo das duas funções:
#Arquivo                              Função
#colunas com ; e decimal com vírgula  read.csv2()
#colunas com , e decimal com ponto    read.csv()


#5. O que acontece quando a função não combina com o arquivo

#read.csv2() procura ponto e vírgula entre as colunas. Como o arquivo
#da pesquisa usa vírgula, o R não encontra as colunas e coloca tudo em
#uma só.
errado = read.csv2("satisfacao_clientes.csv")

str(errado) #1 variável só, com o texto de todas as colunas juntas

ncol(errado) #1 coluna: sinal de separador errado

#O erro inverso, read.csv("funcionarios.csv"), nem chega a criar o data
#frame: as vírgulas decimais são tomadas como separadores de coluna e o
#R mostra a mensagem "more columns than column names".

#Lição: se o data frame tiver uma única coluna, ou se aparecer a
#mensagem acima, troque read.csv() por read.csv2() ou vice-versa.


#6. Arquivo de texto separado por tabulação: read.delim()

#Muitos sistemas exportam relatórios em .txt, com as colunas separadas
#por tabulação (a tecla Tab). A função para esse caso é read.delim().

estoque = read.delim("estoque.txt")

str(estoque)

estoque #Com poucas linhas, basta digitar o nome para ver tudo

#Uma vez importado, o data frame é usado como na Aula 2
estoque$valor_estoque = estoque$estoque * estoque$custo_unitario

sum(estoque$valor_estoque) #Valor total do estoque, em reais

#Produtos que chegaram ao ponto de pedido e precisam ser comprados
repor = subset(estoque, estoque <= ponto_pedido)

repor


#7. Planilhas do Excel: read_excel()

#O R básico não lê arquivos .xlsx. Para isso, usamos um pacote: um
#conjunto de funções extras, criado pela comunidade.
#O pacote readxl lê planilhas do Excel.

#Instalação: só uma vez em cada computador ou projeto do Posit Cloud.
#Se o pacote já estiver instalado, pule esta linha.
install.packages("readxl")

#Carregamento: uma vez a cada sessão, antes de usar as funções
library(readxl)

#Um arquivo do Excel pode ter várias planilhas (abas).
#excel_sheets() lista os nomes das abas.
excel_sheets("despesas.xlsx")

#read_excel() lê uma aba. O argumento sheet indica qual.
despesas = read_excel("despesas.xlsx", sheet = "despesas")

#read_excel() devolve um tibble, uma versão moderna do data frame.
#as.data.frame() o transforma no data frame que já conhecemos.
despesas = as.data.frame(despesas)

str(despesas)

head(despesas)

responsaveis = as.data.frame(read_excel("despesas.xlsx",
                                        sheet = "responsaveis"))

responsaveis

#Despesa realizada em relação ao orçado, por departamento
despesas$diferenca_mil = despesas$realizado_mil - despesas$orcado_mil

aggregate(diferenca_mil ~ departamento, data = despesas, FUN = sum)

#Dica: se a planilha tiver linhas de título antes do cabeçalho, use o
#argumento skip para pulá-las. Exemplo: read_excel("arquivo.xlsx",
#skip = 2) ignora as duas primeiras linhas.


#8. Acentos estranhos: o argumento fileEncoding

#Arquivos gravados por programas antigos ou pelo Excel no Windows podem
#usar a codificação Latin-1, enquanto o R trabalha em UTF-8.
#O sintoma são acentos trocados por códigos como "Log\xedstica".

fornecedores = read.csv2("fornecedores_latin1.csv")

fornecedores #Veja as colunas de texto com acentos

#Solução: informar a codificação do arquivo
fornecedores = read.csv2("fornecedores_latin1.csv", fileEncoding = "latin1")

fornecedores #Agora os acentos aparecem corretamente


#9. Importando direto da internet

#As funções de leitura também aceitam um endereço da internet no lugar
#do nome do arquivo. É útil para bases públicas (IBGE, Banco Central,
#portais de dados abertos) e para arquivos guardados no GitHub.
#O endereço abaixo aponta para o mesmo funcionarios.csv, guardado no
#repositório do curso.

endereco = "https://raw.githubusercontent.com/humbertoeliaslopes/Hub-R/main/Aula%203%20-%20Importa%C3%A7%C3%A3o%2C%20Exporta%C3%A7%C3%A3o%20e%20Estat%C3%ADsticas%20Descritivas/funcionarios.csv"

funcionarios_web = read.csv2(endereco)

nrow(funcionarios_web) #60 linhas, como o arquivo local


#10. Resumo da Parte 1

#Formato do arquivo                    Função
#.csv com ; e decimal com vírgula      read.csv2("arquivo.csv")
#.csv com , e decimal com ponto        read.csv("arquivo.csv")
#.txt separado por tabulação           read.delim("arquivo.txt")
#.xlsx do Excel                        read_excel("arquivo.xlsx", sheet = "aba")
#Acentos trocados                      acrescente fileEncoding = "latin1"
