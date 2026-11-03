# Aula 3: Importação, exportação e estatísticas descritivas aplicadas à Administração

Roteiro do professor para a última aula do curso, com duração aproximada de 3 horas, destinada a alunos de graduação em Administração que já trabalharam com vetores e fatores (Aula 1) e com data frames, tabelas e box plots (Aula 2).

## 1. Objetivos de aprendizagem

Ao final da aula, o aluno deverá ser capaz de:

1. localizar o diretório de trabalho e colocar nele os arquivos de dados, no Posit Cloud ou no RStudio instalado;
2. importar arquivos CSV nos padrões brasileiro e internacional, arquivos de texto separados por tabulação e planilhas do Excel, escolhendo a função adequada a cada formato;
3. conferir uma importação e diagnosticar os problemas mais comuns (separador errado, acentos trocados, valores ausentes);
4. exportar data frames e tabelas para CSV, para o Excel (com uma ou várias abas) e gráficos para arquivos de imagem;
5. calcular e interpretar medidas de posição, dispersão e separatrizes, inclusive por grupo e na presença de valores ausentes;
6. montar uma tabela de estatísticas descritivas, exportá-la e usá-la para fundamentar uma recomendação gerencial.

## 2. Pré-requisitos e nível de exigência

A aula mantém as escolhas didáticas das aulas anteriores: atribuição com `=`, colunas acessadas com `$`, linhas selecionadas com `subset()` e nenhuma notação de colchetes. As funções `str()`, `summary()`, `table()`, `prop.table()`, `aggregate()` e `boxplot()` já são conhecidas e reaparecem aplicadas a dados importados.

Os elementos novos são de três tipos:

- **funções de leitura e gravação**: `read.csv2()`, `read.csv()`, `read.delim()`, `write.csv2()`, `write.csv()`, `png()`, `saveRDS()` e `readRDS()`, todas do R básico;
- **pacotes**: pela primeira vez a turma instala e carrega pacotes, o `readxl` (leitura de `.xlsx`) e o `writexl` (gravação de `.xlsx`). O R básico não lê nem grava planilhas do Excel, e esses dois pacotes são leves e não dependem de outros programas;
- **estatísticas**: `mean()`, `median()`, `var()`, `sd()`, `quantile()`, `IQR()`, `range()`, `cor()`, o argumento `na.rm = TRUE` e as funções `is.na()` e `which.max()`.

Na Aula 2 os dados ficaram digitados nos scripts, por causa de erros de leitura no Posit Cloud. Nesta aula a leitura de arquivos é o próprio conteúdo, e por isso o roteiro reserva tempo para o diretório de trabalho e oferece dois caminhos de contingência (o arquivo `.zip` e o script `Baixar arquivos.R`).

## 3. Materiais

| Arquivo | Uso |
|---|---|
| `Parte 1 - Importação.R` | Script demonstrado pelo professor no Bloco 1 |
| `Parte 2 - Exportação.R` | Script demonstrado pelo professor no Bloco 2 |
| `Parte 3 - Estatísticas Descritivas.R` | Script demonstrado pelo professor no Bloco 3 |
| `Exercícios.R` | Lista do aluno, com espaço para o código de cada exercício |
| `Gabarito.R` | Solução completa, com os resultados esperados em comentário |
| `Baixar arquivos.R` | Plano B: baixa os arquivos de dados do GitHub para o diretório de trabalho |
| `materiais_aula3.zip` | Todos os scripts e arquivos de dados em um único arquivo, para um só upload |

**Arquivos de dados** (todos fictícios, criados para fins didáticos; convém dizer isso à turma)

| Arquivo | Formato | Usado em |
|---|---|---|
| `funcionarios.csv` | CSV brasileiro (`;` e vírgula decimal), UTF-8 | Partes 1 e 2 (mesmos dados da Aula 2) |
| `satisfacao_clientes.csv` | CSV internacional (`,` e ponto decimal), com células vazias | Partes 1 e 3 |
| `estoque.txt` | Texto separado por tabulação | Partes 1 e 2 |
| `despesas.xlsx` | Excel, abas `despesas` e `responsaveis` | Parte 1 |
| `fornecedores_latin1.csv` | CSV brasileiro gravado em Latin-1 | Parte 1 e Exercício 4 |
| `pedidos_loja_virtual.csv` | CSV brasileiro, com células vazias | Exercícios e atividade integradora |
| `vendas_filiais.xlsx` | Excel, abas `vendas` e `metas` (dados de vendas da Aula 2) | Exercícios 3 e 9 |

## 4. Preparação antes da aula

1. **Pacotes.** No projeto do Posit Cloud que será usado (ou nos computadores do laboratório), rode uma vez `install.packages("readxl")` e `install.packages("writexl")`. Se cada aluno trabalhar no próprio projeto, a instalação acontece no início do Bloco 1 e leva cerca de um minuto; peça que a turma a execute logo na abertura, enquanto o professor apresenta a aula.
2. **Arquivos.** Disponibilize o `materiais_aula3.zip`. No Posit Cloud, o aluno abre o painel *Files*, clica em *Upload*, escolhe o `.zip` e confirma. O diálogo de upload do RStudio no navegador descompacta automaticamente arquivos `.zip`, de modo que scripts e dados chegam juntos à pasta do projeto (`/cloud/project`). No RStudio instalado, basta descompactar o arquivo em uma pasta e abrir os scripts dali.
3. **Teste.** Antes da aula, abra um projeto novo no Posit Cloud, faça o upload do `.zip` e rode `list.files()`. Os sete arquivos de dados e os seis scripts devem aparecer.
4. **Plano B.** Se o upload falhar para algum aluno, ele pode abrir o script `Baixar arquivos.R` (ou copiar o código dele) e rodá-lo: os arquivos de dados são baixados do repositório do curso no GitHub para o diretório de trabalho. O script e a seção 9 da Parte 1 leem da ramificação `main` do repositório, portanto os arquivos precisam estar publicados nela.
5. Não distribua o `Gabarito.R` antes do fim da aula.

## 5. Cronograma

| Horário | Duração | Etapa | Material |
|---|---|---|---|
| 0:00 a 0:10 | 10 min | Abertura, upload dos arquivos e instalação dos pacotes | `materiais_aula3.zip` |
| 0:10 a 0:55 | 45 min | Bloco 1: importação (25 min de demonstração e 20 min de exercícios) | Parte 1; exercícios 1 a 4 |
| 0:55 a 1:25 | 30 min | Bloco 2: exportação (15 min de demonstração e 15 min de exercícios) | Parte 2; exercícios 5 a 7 |
| 1:25 a 1:40 | 15 min | Intervalo | |
| 1:40 a 2:30 | 50 min | Bloco 3: estatísticas descritivas (25 min de demonstração e 25 min de exercícios) | Parte 3; exercícios 8 a 12 |
| 2:30 a 2:50 | 20 min | Atividade integradora em duplas | Exercícios, atividade final |
| 2:50 a 3:00 | 10 min | Correção comentada e encerramento do curso | Gabarito |

Se o tempo ficar curto, os exercícios 4, 7 e 12 podem ser deixados como tarefa para casa sem prejuízo da sequência. A atividade integradora não deve ser cortada, porque reúne os três blocos.

## 6. Desenvolvimento

### 6.1 Abertura (10 min)

Enquanto a turma faz o upload do `.zip` e instala os pacotes, pergunte: **de onde vêm os dados que um analista usa na empresa?** As respostas esperadas são planilhas do Excel, relatórios exportados do ERP, do CRM ou da plataforma de vendas, formulários de pesquisa. Mostre que, nas duas aulas anteriores, os dados foram digitados no script, o que não é viável com milhares de linhas.

Apresente o fluxo que organiza a aula, que é o fluxo típico de uma análise: **importar, conferir, analisar e exportar**.

### 6.2 Bloco 1: importação (45 min)

**Demonstração (25 min), script `Parte 1 - Importação.R`.**

| Seção do script | O que enfatizar |
|---|---|
| 1. Diretório de trabalho | `getwd()` e `list.files()` são o primeiro passo diante de qualquer erro de leitura. Mostre o painel *Files* e o caminho `/cloud/project`. A maior parte dos erros desta aula é de arquivo fora da pasta. |
| 2. `read.csv2()` | Abra o `funcionarios.csv` em *Files > View File* e mostre o ponto e vírgula e a vírgula decimal. É o padrão do Excel em português. |
| 3. Conferência | Leia o roteiro de quatro perguntas do script. A soma dos salários (R$ 351.048,00) é a mesma da Aula 2, o que comprova que a importação está correta. |
| 4. `read.csv()` | O mesmo tipo de arquivo, no padrão internacional. Em `summary()`, mostre a linha `NA's`: células vazias viram valores ausentes. |
| 5. Função errada | `read.csv2()` aplicado a um arquivo com vírgulas devolve uma única coluna; o caso inverso gera a mensagem `more columns than column names`. Escreva no quadro: uma coluna só ou essa mensagem significam troca de função. |
| 6. `read.delim()` | Relatórios em `.txt` de sistemas. Depois de importado, o data frame é usado como na Aula 2: o valor do estoque é de R$ 59.829,80 e três produtos estão no ponto de pedido. |
| 7. `read_excel()` | Diferencie **instalar** (uma vez, como instalar um aplicativo no celular) de **carregar** (`library()`, a cada sessão, como abrir o aplicativo). Mostre `excel_sheets()` e o argumento `sheet`. Explique em uma frase que `as.data.frame()` converte o tibble no data frame já conhecido. Logística gastou 173,2 mil reais acima do orçado no ano. |
| 8. `fileEncoding` | Mostre os acentos trocados e a correção com `fileEncoding = "latin1"`. Arquivos gerados pelo Excel no Windows em "CSV (separado por vírgulas)" costumam apresentar esse problema; o formato "CSV UTF-8" do Excel o evita. |
| 9. Internet | As funções de leitura aceitam endereços. Cite portais de dados abertos (IBGE, Banco Central, dados.gov.br) como fontes para trabalhos da graduação. |

**Exercícios 1 a 4 (20 min).** O exercício 1 obriga o aluno a olhar o arquivo antes de escolher a função. No exercício 2, a base tem 200 pedidos, 7 colunas e 31 avaliações ausentes. No exercício 4, o erro é proposital: o aluno deve ler a mensagem do console e relacioná-la à seção 5 do script.

### 6.3 Bloco 2: exportação (30 min)

**Demonstração (15 min), script `Parte 2 - Exportação.R`.**

| Seção do script | O que enfatizar |
|---|---|
| 2. `write.csv2()` | O argumento `row.names = FALSE` evita a coluna extra de números de linha. Mostre o arquivo aparecendo no painel *Files* e a boa prática de reimportar para conferir. |
| 3. `write.csv()` | A regra de simetria: o que foi gravado com `write.csv2()` é lido com `read.csv2()`. |
| 4. `write_xlsx()` | Com `list()`, cada data frame vira uma aba, e o nome à esquerda do `=` é o nome da aba. Abra o `relatorio_rh.xlsx` baixado no Excel para mostrar o resultado. |
| 5. Exemplo gerencial | A lista de compras (R$ 8.989,90 para três produtos) é um exemplo de entrega real: o analista envia a planilha ao setor de suprimentos. |
| 6. `png()` | Gráfico gravado por código é refeito igual a cada execução, o que facilita atualizar relatórios mensais. Não esqueça o `dev.off()`. |
| 7. `.rds` | Formato do R, que preserva fatores. Mencione rapidamente; não abre no Excel. |
| 8. Download | Faça o caminho completo no Posit Cloud: marcar o arquivo, *More > Export > Download*. |

**Exercícios 5 a 7 (15 min).** No exercício 7, chame a atenção para o comportamento do `subset()` com valores ausentes: os pedidos sem avaliação não entram na aba `criticos`, o que é o desejado.

### 6.4 Intervalo (15 min)

### 6.5 Bloco 3: estatísticas descritivas (50 min)

**Demonstração (25 min), script `Parte 3 - Estatísticas Descritivas.R`.**

| Seção do script | O que enfatizar |
|---|---|
| 1. Média e mediana | A média do valor de compra (R$ 259,77) supera a mediana (R$ 186,62) por causa de três compras corporativas. Sem elas, a média cai para R$ 213,71. Discuta qual medida usar para cada pergunta: compra típica (mediana) ou projeção de receita (média). |
| 2. Moda | A função `mode()` da Aula 1 informa o tipo do objeto, e não a moda estatística. A moda é obtida com `table()` e `which.max()` e é a única medida de posição que se aplica a variáveis de texto. |
| 3. Valores ausentes | Um único `NA` contamina a conta. `na.rm = TRUE` resolve; `is.na()` conta os ausentes. Insista: substituir `NA` por zero distorce a média. |
| 4. Dispersão | Use o exemplo das duas lojas do comentário. O desvio padrão do tempo de espera é de 5,67 minutos. O CV (55,8% na espera e 135,9% no valor de compra) compara variáveis de unidades diferentes. Comente que `var()` e `sd()` usam o denominador n − 1, próprio de amostras. |
| 5. Quartis e percentis | Retome a caixa do box plot da Aula 2. O percentil 90 responde a uma pergunta gerencial concreta: 90% dos clientes esperaram até 19 minutos. |
| 6. Por grupo | A loja física tem a maior espera média (13,6 min), a menor nota de atendimento (6,5) e só 41,9% dos clientes a recomendariam, contra 71,1% no aplicativo. |
| 7. Correlação | `cor()` calcula o coeficiente de correlação de Pearson, de −1 a 1. O resultado de −0,76 indica associação negativa forte entre espera e nota. Reforce que correlação não prova causalidade. |
| 8. Tabela para relatório | O data frame de estatísticas é montado com `c()`, como os vetores da Aula 1, e exportado com `write_xlsx()`. É o fechamento do fluxo importar, analisar e exportar. |

**Exercícios 8 a 12 (25 min).** No exercício 9, Belo Horizonte tem o maior desvio padrão do faturamento (87,0 mil reais), mas a filial relativamente mais instável é Betim (CV de 30,3%), efeito do mês de junho já discutido na Aula 2; a mais estável é Juiz de Fora (15,7%). No exercício 10, a média das avaliações é 3,91 e 15,5% dos pedidos não foram avaliados. No exercício 11, os alunos devem perceber que as regiões com maior prazo têm as menores avaliações.

### 6.6 Atividade integradora (20 min, em duplas)

A diretoria de operações vai instalar um centro de distribuição e precisa escolher a região. As duplas montam a tabela-resumo por região, gravam o box plot do prazo, exportam o relatório em Excel e redigem um parecer de 5 a 8 linhas. O enunciado completo está ao fim do arquivo `Exercícios.R`.

**Resultados esperados da tabela-resumo**

| Região | Pedidos | Participação (%) | Faturamento com frete (R$) | Prazo médio (dias) | Desvio padrão do prazo | Avaliação média |
|---|---|---|---|---|---|---|
| Centro-Oeste | 14 | 7,0 | 3.297,11 | 5,9 | 1,4 | 4,00 |
| Nordeste | 44 | 22,0 | 13.437,62 | 9,0 | 3,2 | 2,93 |
| Norte | 9 | 4,5 | 2.547,89 | 11,0 | 2,6 | 2,33 |
| Sudeste | 92 | 46,0 | 21.595,67 | 3,0 | 1,1 | 4,50 |
| Sul | 41 | 20,5 | 12.730,51 | 4,8 | 1,5 | 4,00 |

**Padrão de resposta do parecer.** A recomendação mais bem sustentada pelos dados é o **Nordeste**. Um parecer completo deve conter:

1. a indicação clara da região recomendada;
2. o volume: 44 pedidos (22% do total) e o segundo maior faturamento, atrás apenas do Sudeste;
3. o problema de serviço: prazo médio de 9 dias, três vezes o do Sudeste, com a maior variabilidade entre as regiões (desvio padrão de 3,2 dias);
4. o efeito sobre o cliente: avaliação média de 2,93, abaixo da média geral de 3,91;
5. a ressalva sobre o Norte: prazo e avaliação piores, porém com apenas 9 pedidos (4,5%), volume que ainda não justifica o investimento, mas que deve ser acompanhado;
6. linguagem objetiva, com números, dirigida a quem decide.

Deve ser aceita uma recomendação diferente, desde que fundamentada nos dados. Recomendar o Norte apenas por ter o pior prazo, sem considerar o volume, ou o Sudeste apenas por concentrar mais pedidos, sem considerar que ali o prazo já é baixo, revela leitura incompleta.

**Rubrica analítica (avaliação formativa)**

| Critério (peso) | Insuficiente | Básico | Proficiente | Avançado |
|---|---|---|---|---|
| Importação e tabela-resumo (30%) | Não importa a base ou a tabela está errada | Monta parte das colunas | Monta todas as colunas corretamente | Colunas corretas, com nomes claros e valores arredondados |
| Exportação (20%) | Não exporta | Exporta só a tabela ou só o gráfico | Exporta o `.xlsx` com duas abas e o `.png` | Arquivos exportados, conferidos e com nomes adequados |
| Uso de evidências (30%) | Parecer sem números | Cita um indicador | Cita volume, prazo e avaliação | Cita volume, prazo, dispersão e avaliação e trata o caso do Norte |
| Recomendação gerencial (20%) | Não recomenda | Recomenda sem justificar | Recomenda com justificativa coerente | Recomendação clara, com ressalva e próximo passo |

### 6.7 Correção comentada e encerramento do curso (10 min)

Projete a solução da atividade a partir do `Gabarito.R` e leia um ou dois pareceres das duplas. Feche a aula com a síntese:

1. antes de importar, confira o diretório de trabalho e o formato do arquivo;
2. depois de importar, confira linhas, colunas, tipos e acentos;
3. medidas de posição e de dispersão devem ser lidas em conjunto, e valores ausentes exigem `na.rm = TRUE`, nunca a troca por zero;
4. a análise só gera valor quando chega a quem decide, em um arquivo que essa pessoa consiga abrir.

Em seguida, retome o percurso do curso: vetores e fatores (Aula 1), data frames, tabelas e box plots (Aula 2) e o ciclo completo de uma análise com dados reais (Aula 3). Para quem quiser continuar, indique o livro *R for Data Science*, de Hadley Wickham, Mine Çetinkaya-Rundel e Garrett Grolemund (2. ed., O'Reilly, 2023), disponível gratuitamente em [r4ds.hadley.nz](https://r4ds.hadley.nz), que apresenta o conjunto de pacotes tidyverse, passo natural depois do R básico visto no curso.

Ao final, disponibilize o `Gabarito.R` à turma.

## 7. Dificuldades frequentes e como resolvê-las

| Sintoma | Causa provável | Orientação |
|---|---|---|
| `cannot open the connection`, acompanhado do aviso `No such file or directory` | O arquivo não está no diretório de trabalho ou o nome foi digitado errado | Rodar `list.files()` e copiar o nome exatamente como aparece, com a extensão |
| O data frame tem uma única coluna | Função de leitura trocada (`read.csv2()` em arquivo com vírgulas) | Usar `read.csv()` |
| `more columns than column names` | `read.csv()` em arquivo com ponto e vírgula e vírgula decimal | Usar `read.csv2()` |
| Coluna numérica aparece como `chr` | Vírgula decimal lida como texto, ou símbolos como "R$" no arquivo | Conferir a função de leitura; remover símbolos na planilha de origem |
| Acentos trocados por `\xe1` ou `<e1>` | Arquivo em Latin-1 | Acrescentar `fileEncoding = "latin1"` |
| `could not find function "read_excel"` | Pacote não carregado | Rodar `library(readxl)` (e, se necessário, `install.packages("readxl")`) |
| `there is no package called 'readxl'` | Pacote não instalado neste projeto | Rodar `install.packages("readxl")` |
| `mean()` devolve `NA` | Há valores ausentes na coluna | Acrescentar `na.rm = TRUE` |
| O `.png` gravado está vazio ou o gráfico não aparece mais na aba *Plots* | Faltou `dev.off()` | Rodar `dev.off()` até o console mostrar `null device` |
| O arquivo exportado não aparece no computador | No Posit Cloud, ele fica na nuvem | Painel *Files*, marcar o arquivo, *More > Export > Download* |

## 8. Dicionário de dados

**`satisfacao_clientes.csv`** (150 linhas, dados fictícios, Partes 1 e 3)

| Coluna | Descrição | Tipo |
|---|---|---|
| `id_cliente` | Número do questionário | número inteiro |
| `canal` | Loja física, Site ou Aplicativo | texto (categoria) |
| `idade` | Idade do cliente, em anos | número inteiro |
| `tempo_espera_min` | Tempo de espera até o atendimento, em minutos (6 ausentes) | número inteiro |
| `nota_atendimento` | Nota do atendimento, de 0 a 10 (9 ausentes) | número inteiro |
| `nota_produto` | Nota do produto, de 0 a 10 | número inteiro |
| `valor_compra` | Valor da compra, em reais | número |
| `recomendaria` | "Sim" se o cliente recomendaria a empresa | texto (categoria) |

**`pedidos_loja_virtual.csv`** (200 linhas, dados fictícios, exercícios)

| Coluna | Descrição | Tipo |
|---|---|---|
| `pedido` | Número do pedido | número inteiro |
| `regiao` | Sudeste, Sul, Nordeste, Centro-Oeste ou Norte | texto (categoria) |
| `forma_pagamento` | Pix, Cartão ou Boleto | texto (categoria) |
| `valor` | Valor dos produtos, em reais | número |
| `frete` | Valor do frete, em reais | número |
| `prazo_entrega_dias` | Dias entre a compra e a entrega | número inteiro |
| `avaliacao` | Nota do cliente, de 1 a 5 (31 ausentes) | número inteiro |

**`estoque.txt`** (18 linhas): `codigo`, `produto`, `categoria`, `estoque` (unidades), `custo_unitario` (reais) e `ponto_pedido` (unidades).

**`despesas.xlsx`**: aba `despesas` (60 linhas: `departamento`, `mes`, `orcado_mil` e `realizado_mil`, em milhares de reais) e aba `responsaveis` (5 linhas: `departamento`, `responsavel` e `centro_custo`).

**`fornecedores_latin1.csv`** (6 linhas): `fornecedor`, `cidade`, `categoria`, `prazo_medio_dias` e `avaliacao` (0 a 10).

**`funcionarios.csv`** e **`vendas_filiais.xlsx`**: mesmos dados e colunas dos data frames `funcionarios` e `vendas` da Aula 2 (ver o dicionário de dados daquele roteiro). A aba `metas` traz a meta mensal de cada filial, em milhares de reais, e o nome do gerente.
