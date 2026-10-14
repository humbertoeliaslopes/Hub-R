#Estruturas de dados - Vetores e Fatores

#Vetores atômicos

#A = {1; 2,3; 5,89; 11,2; 14, 23}

A = c(1, 2.3, 5.89, 11.2, 14, 23)
print(A) #ou
A
mode(A)

#B = {Azul, Amarelo, Verde, Cinza}

B = c("Azul", "Amarelo", "Verde", "Cinza")
print(B) #ou
B
mode(B)

#Transformando B em um fator

B1 = factor(B)            
print(B1) #ou
B1
str(B1) #Verifica a estrutura do fator
as.numeric(B1) #Exibe os códigos utilizados nas categorias
is.factor(B1) #Confirma se o vetor atômico é um fator

#C = {Azul, Amarelo, Verde, Cinza, Azul, Azul, Verde}

C = c("Azul", "Amarelo", "Verde", "Cinza", "Azul", "Azul", "Verde")
print(C) #ou
C
str(C) #Verifica a estrutura atual do vetor atômico

C1 = factor(C) #Transforma o vetor atômico em um fator
print(C1) #ou
C1
str(C1)
as.numeric(C1) #Exibe os códigos utilizados nas categorias
is.factor(C1) #Confirma se o vetor atômico é um fator 