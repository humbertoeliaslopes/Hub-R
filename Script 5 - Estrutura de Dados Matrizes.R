#Estruturas de dados - Matrizes

#Matriz 1

# 1  2  3  4 
# 5  6  7  8 
# 9 10 11 12

matriz_exemplo = matrix(data = c(1,5,9,2,6,10,3,7,11,4,8,12), 
                        nrow = 3, ncol = 4)
matriz_exemplo
mode(matriz_exemplo) #Verifica o tipo de dado na matriz

#Ou

matriz_exemplo_2 = matrix(data = c(1:12), nrow = 3, ncol = 4, byrow = TRUE)
matriz_exemplo_2
mode(matriz_exemplo_2) #Verifica o tipo de dado na matriz

#Matriz 2

matriz_nomes = matrix(c("Miguel", "Arthur", "Heitor", "Bernardo", "Davi", "Helena", "Alice",
                        "Arthur", "Heitor", "Gabriel", "Theo", "Pedro", "Laura", "Manuela",
                        "Heitor", "Bernardo", "Pedro", "Lucas", "Enzo", "Manuela", "Sophia",
                        "Bernardo", "Gabriel", "Enzo", "Matheus", "Miguel", "Júlia", "Valentina",
                        "Arthur", "Davi", "Lucas", "Lorenzo", "Gustavo", "Lorena", "Isabella"), 
                      nrow = 5, byrow = TRUE)
matriz_nomes
mode(matriz_nomes) #Verifica o tipo de dado na matriz