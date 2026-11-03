#Aula 3 - Baixar os arquivos de dados da internet

#Use este script apenas se os arquivos de dados não aparecerem no
#list.files() depois do upload (por exemplo, se o upload falhar no
#Posit Cloud). Ele copia os arquivos da aula, guardados no repositório
#do curso no GitHub, para o diretório de trabalho.
#Selecione todo o script e rode com Ctrl + Enter.

getwd() #Os arquivos serão gravados nesta pasta

endereco = "https://raw.githubusercontent.com/humbertoeliaslopes/Hub-R/main/Aula%203%20-%20Importa%C3%A7%C3%A3o%2C%20Exporta%C3%A7%C3%A3o%20e%20Estat%C3%ADsticas%20Descritivas/"

#paste0() junta o endereço da pasta e o nome do arquivo.
#mode = "wb" grava o arquivo sem alterações, o que é indispensável para
#o .xlsx e para o arquivo em Latin-1.

download.file(paste0(endereco, "funcionarios.csv"), "funcionarios.csv", mode = "wb")
download.file(paste0(endereco, "satisfacao_clientes.csv"), "satisfacao_clientes.csv", mode = "wb")
download.file(paste0(endereco, "estoque.txt"), "estoque.txt", mode = "wb")
download.file(paste0(endereco, "despesas.xlsx"), "despesas.xlsx", mode = "wb")
download.file(paste0(endereco, "fornecedores_latin1.csv"), "fornecedores_latin1.csv", mode = "wb")
download.file(paste0(endereco, "pedidos_loja_virtual.csv"), "pedidos_loja_virtual.csv", mode = "wb")
download.file(paste0(endereco, "vendas_filiais.xlsx"), "vendas_filiais.xlsx", mode = "wb")

list.files() #Os sete arquivos de dados devem aparecer aqui
