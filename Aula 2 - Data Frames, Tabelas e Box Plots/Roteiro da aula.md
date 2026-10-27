# Aula 2: Data frames, tabelas e box plots aplicados à Administração

Roteiro do professor para uma aula de aproximadamente 3 horas, destinada a alunos de graduação em Administração que tiveram o primeiro contato com o R na aula anterior (operações aritméticas, vetores atômicos e fatores, conforme o `Script 4 - Estrutura de Dados Vetores e Fatores.R`).

## 1. Objetivos de aprendizagem

Ao final da aula, o aluno deverá ser capaz de:

1. explicar o que é um data frame e relacioná-lo aos vetores atômicos vistos na aula anterior;
2. criar data frames a partir de vetores, tanto pequenos quanto com dezenas de observações;
3. inspecionar um data frame, acessar colunas com `$`, criar novas colunas e selecionar observações com `subset()`;
4. elaborar tabelas de frequência simples e de dupla entrada, com percentuais, e tabelas de médias e somas por grupo;
5. construir e interpretar box plots, identificando mediana, quartis, amplitude interquartil e valores atípicos;
6. usar tabelas e box plots para fundamentar uma recomendação gerencial simples.

## 2. Pré-requisitos e nível de exigência

A aula pressupõe apenas o conteúdo da primeira aula: atribuição com `=`, criação de vetores com `c()`, as funções `mode()`, `str()` e `factor()`. Por decisão didática, a aula **não** utiliza a notação de colchetes (`dados[linha, coluna]`), matrizes nem as variações de subscritos dos scripts 5 a 7. A seleção de colunas é feita sempre com `$` e a seleção de linhas com `subset()`, em sua forma mais simples. Os únicos elementos novos de lógica são os operadores de comparação, a função `ifelse()` e, como desafio opcional, o operador `&`.

Todas as funções utilizadas pertencem à instalação básica do R. Não é preciso instalar pacotes.

## 3. Materiais

| Arquivo | Uso |
|---|---|
| `Parte 1 - Data Frames.R` | Script demonstrado pelo professor no Bloco 1 |
| `Parte 2 - Tabelas.R` | Script demonstrado pelo professor no Bloco 2 |
| `Parte 3 - Box Plots.R` | Script demonstrado pelo professor no Bloco 3 |
| `Exercícios.R` | Lista do aluno, com espaço para o código de cada exercício |
| `Gabarito.R` | Solução completa, com os resultados esperados em comentário |

Os dois conjuntos de dados são **fictícios**, criados para fins didáticos. Convém dizer isso à turma.

## 4. Preparação antes da aula

1. Disponibilize os scripts da pasta `Aula 2 - Data Frames, Tabelas e Box Plots`. Os dados estão digitados nos próprios scripts, em vetores, e por isso nenhum arquivo externo precisa ser lido. Cada script funciona sozinho, tanto no RStudio instalado quanto no Posit Cloud: basta abri-lo ou enviá-lo pelo painel *Files > Upload*.
2. Confirme que os computadores do laboratório abrem o RStudio.
3. Oriente os alunos a rodar cada bloco de dados inteiro de uma vez, selecionando do primeiro vetor até a linha do `data.frame()` e pressionando Ctrl + Enter. Um vetor rodado pela metade é a causa mais provável de erro nesta aula.
4. Não distribua o `Gabarito.R` antes do fim da aula.

## 5. Cronograma

| Horário | Duração | Etapa | Material |
|---|---|---|---|
| 0:00 a 0:10 | 10 min | Abertura e retomada dos vetores | Script 4 da aula anterior |
| 0:10 a 0:55 | 45 min | Bloco 1: data frames (25 min de demonstração e 20 min de exercícios) | Parte 1; exercícios 1 a 4 |
| 0:55 a 1:35 | 40 min | Bloco 2: elaboração de tabelas (22 min de demonstração e 18 min de exercícios) | Parte 2; exercícios 5 a 8 |
| 1:35 a 1:50 | 15 min | Intervalo | |
| 1:50 a 2:30 | 40 min | Bloco 3: box plots para análise (22 min de demonstração e 18 min de exercícios) | Parte 3; exercícios 9 a 12 |
| 2:30 a 2:50 | 20 min | Atividade integradora em duplas | Exercícios, atividade final |
| 2:50 a 3:00 | 10 min | Correção comentada e fechamento | Gabarito |

Se o tempo ficar curto, os exercícios 4, 8 e 12 e os desafios podem ser deixados como tarefa para casa sem prejuízo da sequência.

## 6. Desenvolvimento

### 6.1 Abertura (10 min)

Retome rapidamente a criação de um vetor numérico e de um vetor de texto e pergunte à turma como uma empresa guardaria, ao mesmo tempo, o nome, o preço e o estoque de seus produtos. A resposta esperada é "em uma planilha". Apresente o data frame como a planilha do R: cada coluna é um vetor que eles já sabem criar, e todas as colunas têm o mesmo número de elementos.

Apresente a pergunta que guiará a aula: **como transformar uma base de dados de pessoal ou de vendas em informação para decidir?**

### 6.2 Bloco 1: data frames (45 min)

**Demonstração (25 min), script `Parte 1 - Data Frames.R`.**

| Seção do script | O que enfatizar |
|---|---|
| 1. Criando a partir de vetores | Os quatro vetores têm cinco elementos. Mostre o que acontece se um deles tiver quatro (o R acusa erro). Abra o data frame com `View()`. |
| 2. Conhecendo o data frame | `str()` é a primeira função a rodar em qualquer base nova: mostra o tipo de cada coluna. Em `summary()`, chame atenção para a média e a mediana do preço. |
| 3. Operador `$` | `produtos$preco` devolve um vetor atômico. Por isso `mean()`, `sum()` e `max()` funcionam como na aula anterior. |
| 4. Nova coluna | Valor do estoque é uma conta que o gestor faz no Excel; no R, a conta é feita para todas as linhas de uma vez. |
| 5. Data frame maior | É o mesmo procedimento da seção 1, agora com 60 funcionários: um vetor por coluna e `data.frame()` ao final. Destaque que a ordem dos valores precisa ser a mesma em todos os vetores, porque cada posição corresponde a um funcionário. Comente que, nas empresas, esses dados costumam vir de planilhas ou de sistemas, assunto de uma aula futura. |
| 6. Exploração | Pergunte: qual é a folha de pagamento mensal da empresa? Os alunos devem chegar a `sum(funcionarios$salario)`. |
| 7. Fatores | Conecte explicitamente com o Script 4. Mostre que a ordem dos níveis hierárquicos só fica correta quando informada em `levels`. |
| 8. Novas colunas | `ifelse()` cria categorias a partir de números. A coluna `faixa_tempo` será usada no Bloco 2. |
| 9. `subset()` | Escreva no quadro a tabela de operadores. Insista que `==` compara e `=` atribui. Compare as horas de treinamento dos destaques com as de toda a empresa e pergunte o que isso sugere ao RH. |
| 10. Exportação | O arquivo gerado abre no Excel. Mostre-o aberto, se houver tempo. |

**Exercícios 1 a 4 (20 min).** Circule pela sala. O exercício 1 repete a lógica da seção 1 em outro contexto; o exercício 2 monta o data frame de vendas a partir dos vetores já digitados; os exercícios 3 e 4 combinam `$`, nova coluna, fator e `subset()`.

### 6.3 Bloco 2: elaboração de tabelas (40 min)

**Demonstração (22 min), script `Parte 2 - Tabelas.R`.** O início do script repete os vetores de dados e a criação dos fatores, para que a parte funcione de forma independente.

| Seção do script | O que enfatizar |
|---|---|
| 1. Frequência absoluta | `table()` conta quantas vezes cada categoria aparece. Vendas concentra 18 dos 60 funcionários. |
| 2. Frequência relativa | `prop.table()` transforma contagens em proporções; multiplicar por 100 e usar `round()` produz os percentuais de um relatório. |
| 3. Tabela como data frame | A tabela vira um data frame com colunas renomeadas e uma coluna de percentual. É o formato que será exportado e levado para uma apresentação. |
| 4. Dupla entrada | Leia com a turma: Logística é praticamente presencial (13 de 14), o que faz sentido para uma operação física, enquanto Vendas é majoritariamente híbrida. Explique a diferença entre percentual por linha (`margin = 1`) e por coluna (`margin = 2`) com uma pergunta para cada: "em Vendas, que parte trabalha em regime híbrido?" e "dos remotos, que parte é do Financeiro?". O rótulo `Sum` de `addmargins()` significa total. |
| 5. `aggregate()` | Leia a fórmula em voz alta: "salário em função do departamento". Compare a média com a mediana do salário por departamento: em Logística a média (5.330) fica bem acima da mediana (4.671), sinal de alguns salários altos puxando a média. Essa observação prepara o Bloco 3. |
| 6. Exportação | `getwd()` mostra onde os arquivos foram gravados. |

**Exercícios 5 a 8 (18 min).** O exercício 8 abre uma discussão gerencial importante: a filial com mais reclamações também é a que atende mais clientes, e por isso indicadores relativos (por mil clientes) são mais justos para comparar unidades de portes diferentes.

### 6.4 Intervalo (15 min)

### 6.5 Bloco 3: box plots para análise (40 min)

**Demonstração (22 min), script `Parte 3 - Box Plots.R`.**

| Seção do script | O que enfatizar |
|---|---|
| 1. Quartis e AIQ | Antes do gráfico, mostre os números: metade dos funcionários ganha até R$ 5.091,59 (mediana); os 50% centrais estão entre R$ 3.201,51 e R$ 6.759,23. Desenhe no quadro a caixa e indique onde ficam Q1, mediana e Q3. |
| 2. Primeiro box plot | Use o roteiro de leitura que está no comentário do script. |
| 3. Valores atípicos | Calcule os limites com a turma: o limite superior é de R$ 12.095,81 e o inferior é negativo, o que significa que não há atípicos por baixo. Os quatro atípicos são coordenadores. Discuta: atípico não é sinônimo de erro. |
| 4. Comparação de grupos | No gráfico por nível, o salário de coordenadores fica totalmente acima dos demais níveis. Aparece um assistente atípico (R$ 7.900, em Logística) que não aparecia no gráfico geral. Esse é um bom momento para mostrar que um valor é atípico em relação a um grupo de referência. Nos gráficos de avaliação por modalidade e de treinamento por nível, as caixas se sobrepõem bastante; pergunte se os dados permitem afirmar que uma modalidade gera melhor desempenho (a resposta é não). |
| 5. Grupo selecionado | Em Vendas há só dois coordenadores. Use o exemplo para alertar sobre caixas construídas com poucas observações. |
| 6. Salvar a imagem | `png()`, o gráfico e `dev.off()` sempre juntos. Mostre também o botão *Export* da aba *Plots*. |

**Exercícios 9 a 12 (18 min).** No exercício 10, quase todos os pontos acima das caixas são de novembro e dezembro, efeito da sazonalidade do varejo. No exercício 11, o mês de junho em Betim é o caso que exige investigação antes de qualquer decisão.

Nota técnica para o professor: o `boxplot()` do R calcula a caixa pelas "dobradiças" de Tukey (função `fivenum()`), enquanto `quantile()` usa, por padrão, outro método de interpolação. Em alguns conjuntos de dados os valores diferem ligeiramente, sem alterar a interpretação. O script menciona isso em uma linha para evitar dúvidas caso algum aluno compare os números.

### 6.6 Atividade integradora (20 min, em duplas)

A diretoria comercial vai escolher uma filial para receber um programa de capacitação da equipe de vendas. As duplas devem montar uma tabela-resumo por filial, construir o box plot do faturamento mensal por filial e redigir um parecer de 5 a 8 linhas. O enunciado completo está ao fim do arquivo `Exercícios.R`.

**Resultados esperados da tabela-resumo**

| Filial | Faturamento anual (mil R$) | Média mensal (mil R$) | Meses com meta atingida |
|---|---|---|---|
| Belo Horizonte | 5.050,2 | 420,9 | 5 |
| Betim | 2.379,9 | 198,3 | 3 |
| Contagem | 3.254,0 | 271,2 | 7 |
| Juiz de Fora | 3.673,7 | 306,1 | 6 |
| Uberlândia | 4.099,9 | 341,7 | 5 |

**Padrão de resposta do parecer.** A recomendação mais bem sustentada pelos dados é **Betim**. Um parecer completo deve conter os seguintes elementos:

1. a indicação clara da filial recomendada;
2. o indicador de metas: Betim atingiu a meta em apenas 3 dos 12 meses (25%), o pior resultado da rede, e esse indicador compara filiais de portes diferentes de forma mais justa que o faturamento bruto;
3. evidência do box plot: Betim tem a menor mediana de faturamento mensal (190,6 mil reais) e a caixa posicionada abaixo de todas as demais;
4. a ressalva sobre junho (88,2 mil reais, valor atípico): a causa deve ser investigada antes da decisão, porque um fato pontual (reforma, falta de estoque, falha de sistema) não seria resolvido por capacitação;
5. linguagem objetiva, com números, dirigida a quem decide.

Também deve ser aceita uma recomendação diferente, desde que fundamentada nos dados. Recomendar Belo Horizonte apenas por ser a maior filial, ou Betim apenas por faturar menos sem considerar a meta, revela leitura incompleta. Para referência do professor, as metas mensais usadas na construção dos dados foram de 420 mil reais para Belo Horizonte, 260 para Contagem, 210 para Betim, 300 para Juiz de Fora e 340 para Uberlândia.

**Rubrica analítica (avaliação formativa)**

| Critério (peso) | Insuficiente | Básico | Proficiente | Avançado |
|---|---|---|---|---|
| Tabela-resumo (30%) | Não monta a tabela ou os valores estão errados | Monta parte das colunas | Monta as três colunas corretamente | Colunas corretas, com nomes claros e valores arredondados |
| Box plot (20%) | Não constrói o gráfico | Gráfico sem título ou rótulos | Gráfico por filial, com título e rótulos | Gráfico legível e comentado no código |
| Uso de evidências (30%) | Parecer sem números | Cita um indicador | Cita metas e mediana | Cita metas, mediana e trata o valor atípico de junho |
| Recomendação gerencial (20%) | Não recomenda | Recomenda sem justificar | Recomenda com justificativa coerente | Recomendação clara, com ressalva e próximo passo |

### 6.7 Correção comentada e fechamento (10 min)

Projete a solução da atividade integradora a partir do `Gabarito.R` e leia em voz alta um ou dois pareceres das duplas. Feche com a síntese da aula:

1. data frame é uma tabela de vetores de mesmo tamanho;
2. `table()`, `prop.table()` e `aggregate()` transformam a base em tabelas para relatório;
3. o box plot compara grupos e revela valores atípicos, que devem ser investigados antes de qualquer exclusão;
4. a decisão gerencial depende do indicador escolhido (faturamento bruto ou cumprimento de meta, contagem de reclamações ou reclamações por mil clientes).

Ao final, disponibilize o `Gabarito.R` à turma.

## 7. Dificuldades frequentes e como resolvê-las

| Sintoma | Causa provável | Orientação |
|---|---|---|
| `arguments imply differing number of rows` | Algum vetor do bloco de dados não foi rodado inteiro ou foi alterado | Rodar novamente o bloco completo, do primeiro vetor até o `data.frame()` |
| `object 'salario' not found` ao criar o data frame | O bloco de vetores não foi rodado antes do `data.frame()` | Rodar o bloco de dados desde o início |
| `object 'Salario' not found` | O R diferencia maiúsculas de minúsculas | Conferir o nome com `names()` |
| `subset()` devolve zero linhas | Texto digitado diferente do dado (por exemplo, "Logistica" sem acento) | Conferir as categorias com `levels()` ou `table()` |
| O console mostra `+` e não responde | Parêntese ou aspas sem fechar | Pressionar Esc e revisar a linha |
| Erro ao usar `=` dentro de `subset()` | Confusão entre atribuir e comparar | Usar `==` para comparar |
| Acentos trocados ao abrir no Excel um CSV exportado pelo R | O Excel não reconheceu a codificação UTF-8 | Abrir por *Dados > De Texto/CSV* e escolher a origem UTF-8 |
| A imagem PNG fica vazia | Faltou o `dev.off()` | Rodar `dev.off()` e repetir o gráfico |

## 8. Dicionário de dados

**Data frame `funcionarios`** (60 linhas, dados fictícios, criado nas Partes 1, 2 e 3)

| Coluna | Descrição | Tipo |
|---|---|---|
| `matricula` | Número de identificação do funcionário | número inteiro |
| `departamento` | Vendas, Financeiro, Logística, Marketing ou Recursos Humanos | texto (categoria) |
| `nivel` | Assistente, Analista ou Coordenador | texto (categoria ordenada) |
| `modalidade` | Presencial, Híbrido ou Remoto | texto (categoria) |
| `tempo_empresa` | Tempo de casa, em anos | número |
| `salario` | Salário mensal, em reais | número |
| `horas_treinamento` | Horas de treinamento realizadas no último ano | número inteiro |
| `avaliacao` | Nota da avaliação de desempenho, de 0 a 10 | número |

**Data frame `vendas`** (60 linhas, 5 filiais por 12 meses, dados fictícios, criado nos exercícios)

| Coluna | Descrição | Tipo |
|---|---|---|
| `filial` | Belo Horizonte, Contagem, Betim, Juiz de Fora ou Uberlândia | texto (categoria) |
| `mes` | Mês de referência, de Jan a Dez | texto (categoria ordenada) |
| `faturamento_mil` | Faturamento do mês, em milhares de reais | número |
| `clientes` | Clientes atendidos no mês | número inteiro |
| `meta_atingida` | "Sim" se a filial alcançou a meta mensal | texto (categoria) |
| `reclamacoes` | Reclamações registradas no SAC no mês | número inteiro |

Os dados são digitados nos scripts. No código do R, o separador decimal é sempre o ponto (por exemplo, `3157.8`), e não a vírgula usada no Excel.
