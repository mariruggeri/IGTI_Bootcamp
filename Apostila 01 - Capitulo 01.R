####### Análise exploratória de dados #######
## AED - Capitulo 01 - Prof. Máiron Chaves ###

#Remove objetos da memória do R
rm(list=ls(all=TRUE)) 

dados <- readr::read_csv("data/df_01_a_01.csv", na = c("", "-", "NA"))

#visualiza a media (mean) e outras estatisticas descritivas das variaveis
summary(dados)

# Visualiza desvio padrao (standard deviation) das variaveis
sd(dados$Vendas_Cafe)
sd(dados$Preco_Cafe)
sd(dados$Preco_Leite)

#Visualiza atraves de um histograma a distribuicao da variavel Preco_Cafe 
hist(dados$Preco_Cafe)

# Customizando o histograma
hist(dados$Preco_Cafe, col = 'blue',
     main = 'Distribuicao dos Preços Praticados para o Café')

#Visualiza o histograma das tres variaveis numericas na mesma pagina
par(mfrow=c(2,2)) 

#Configura layout para posicionar os graficos em duas linhas e duas colunas
hist(dados$Vendas_Cafe, col = 'blue',
     main = 'Distribuicao das Vendas do Café') 

hist(dados$Preco_Cafe, col = 'green',
     main = 'Distribuicao dos Preços do Café') 

hist(dados$Preco_Leite, col = 'red',
main = 'Distribuicao dos Preços do Leite')

# Limpa os graficos e volta o layout para configuracao normal 
dev.off() 

# Visualiza relacao entre as vendas do café o preço do café
plot(y = dados$Vendas_Cafe,
     x = dados$Preco_Cafe)


?plot
#Customiza o grafico
plot(y = dados$Vendas_Cafe, 
     x = dados$Preco_Cafe, 
     pch = 16,
     col = 'blue',
     xlab = 'Preço',
     ylab = 'Quantidade Vendidade',
     main = 'Relação entre o Preço e as Vendas do Café')

# este comando adiciona linhas de grade ao grafico 
# Colore os pontos em que havia promoção naquele dia 
plot(y = dados$Vendas_Cafe,
     x = dados$Preco_Cafe, 
     pch = 16,
     col = factor(dados$Promocao), 
     xlab = 'Preço',
     ylab = 'Quantidade Vendidade',
     main = 'Relação entre o Preço e as Vendas do Café')
     legend(x=4.4,y=45, c("Promoção","Sem_Promoção"), col=c("red","black"),pch=c(16,16)) 
     grid() 


# Cria uma nova variavel informando se naquele dia vendeu acima ou abaixo da media historica

# Armazena a media em uma variavel 
media <- mean(dados$Vendas_Cafe)

variavel <- ifelse(dados$Vendas_Cafe > media,
                   'Acima_da_media',
                   'Abaixo_da_media')

variavel <- factor(variavel) # converte nova variavel para factor
plot(variavel) # grafico com a qtde abaixo e acima da media
table(variavel) # visualiza a qtde abaixo e acima da media

# Gera boxplot das vendas
boxplot(dados$Vendas_Cafe)

# Gera boxplot do preco
boxplot(dados$Preco_Cafe)

# Gera boxplot comparativo das vendas quando houve promocao e de quando nao houve
boxplot(dados$Vendas_Cafe~dados$Promocao)

#Customizando o boxplot
boxplot(dados$Vendas_Cafe~dados$Promocao, 
        col = 'gray',
        pch = 16,
        xlab = 'Promoção',
        ylab = 'Vendas',
        main = 'Vendas com promoção vs Vendas sem promoção')
