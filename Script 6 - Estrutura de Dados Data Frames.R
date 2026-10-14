#Estruturas de dados - Data Frames

#Estado	        População (milhões)  Capital
#São Paulo	    45,5	     São Paulo
#Rio de Janeiro	    17,3	     Rio de Janeiro
#Minas Gerais	    21,3	     Belo Horiozonte
#Bahia 	            14,9	     Salvador
#Rio Grande do Sul  11,4	     Porto Alegre

#Criando os vetores necessários

estado = c("São Paulo", "Rio de Janeiro", "Minas Gerais", 
           "Bahia", "Rio Grande do Sul")
estado
mode(estado)

populacao = c(45.5, 17.3, 21.3, 14.9, 11.4)
populacao
mode(populacao)

capital = c("São Paulo", "Rio de Janeiro", "Belo Horizonte", "Salvador",
            "Porto Alegre")
capital
mode(capital)

#Criando o data frame a partir dos vetores

dados_estados = data.frame(estado, populacao, capital)
dados_estados
mode(dados_estados)