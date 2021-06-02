########################################################### 
####### Regressao Linear #######
## AED - Capitulo 05 - Prof. Máiron Chaves #### 
########################################################### 

rm(list = ls()) 

library(ggplot2)
library(plotly)

dados <- readr::read_csv("data/df_01_a_01.csv", na = c("", "-", "NA"))

View(dados)

?plot


#Relacao entre preco do cafe e suas vendas 
plot(y = dados$Vendas_Cafe,
     x = dados$Preco_Cafe,
     main = 'Relação entre Vendas do Café VS Preço do Café', 
     xlab = 'Preço do Café',
     ylab = 'Qtde Vendida do Café',
     pch = 16)
grid()

# É possivel gerar grafico mais sofisticado utilizando a biblioteca ggplot
g1 <- ggplot(data = dados, 
             aes(y = Vendas_Cafe, 
                 x = Preco_Cafe)) +
      geom_point()

# Podemos adicionar uma reta de regressao com o argumento geom_smooth
g1 + geom_smooth(method = 'lm')

# Gráfico Interativo. Comando vem da biblioteca plotly.
ggplotly(g1) 

# Correlacao de Pearson entre as vendas e o preco do cafe
# Correlação de Person: -0.8495825
cor(dados$Vendas_Cafe, dados$Preco_Cafe) 

# Relacao entre preco do leite e as vendas do café

plot(y = dados$Vendas_Cafe,
     x = dados$Preco_Leite,
     main = 'Relação entre Vendas do Café VS Preço do Leite', 
     xlab = 'Preço do Leite',
     ylab = 'Qtde Vendida do Café',
     pch = 16)
grid()

# Coeficiente de correlacao preco de leite e as vendas do cafe
# [1] -0.3735599
cor(dados$Preco_Leite, dados$Vendas_Cafe)

# Grafico 3D entre as vendas do cafe, preco do cafe e preco do leite #O gráfico e interativo, arraste-o com o mouse

plot_ly(dados, z = ~Vendas_Cafe,
        x = ~Preco_Cafe,
        y = ~Preco_Leite) %>% 
        add_markers()


# Relacao entre vendas com promocao e sem promocao
boxplot(dados$Vendas_Cafe ~ dados$Promocao)

# Tambem podemos utilizar ggplot e o plotly

g2 <- ggplot(data = dados, 
             aes(y = Vendas_Cafe, 
                 x = Promocao, col = Promocao)) +
            geom_boxplot()

ggplotly(g2)


# Configurar a tela para exibir multiplos graficos
par(mfrow = c(2,2))

plot( y = dados$Vendas_Cafe,
      x = dados$Preco_Cafe,
      pch = 16,
      main = 'Vendas Cafe vs Preco Cafe')

plot( y = dados$Vendas_Cafe,
      x = dados$Preco_Leite,
      pch = 16, 
      main = 'Vendas Cafe vs Preco Leite')

boxplot(dados$Vendas_Cafe ~ dados$Promocao,main = 'Vendas Cafe vs Promocao')

hist(dados$Vendas_Cafe, main = 'Distribuicao das vendas do cafe')


dev.off()

summary(dados)


# Ajusta um modelo de regressao linear multipla 
modelo <- lm(Vendas_Cafe ~ Preco_Cafe 
             + Preco_Leite 
             + Promocao, 
             data = dados)

summary(modelo)

#Diagnostico de residuos 
par(mfrow = c(2,2))
plot(modelo,pch = 16) 
dev.off()

# E se chegasse novos dados para realizarmos predicoes
# Iremos criar um data frame sem a variavel resposta vendas do cafe, 
# pois ela sera estimada pela equacao de regressao que ajustamos
dados_para_predicao <- data.frame(Preco_Cafe = c(4.77, 4.67, 4.75), 
                                  Promocao = c("Nao", "Nao", "Sim"),
                                  Preco_Leite = c(4.74, 4.81, 4.36) )

#Observe que nao ha variavel resposta 'Vendas do Cafe'
View(dados_para_predicao)

# Estima a variavel resposta pra cada observacao do novo data frame
predicoes <- predict(modelo, newdata = dados_para_predicao) 
View(data.frame(dados_para_predicao, predicoes))


## Metodo Stepwise para selecao automatica de variaveis 

nova_variavel = rpois(n = 30, lambda = 2)

fit2 <- lm(Vendas_Cafe ~ Preco_Cafe 
           + Promocao 
           + Preco_Leite 
           + nova_variavel, 
           data = dados)

summary(fit2) #Observe o p valor da nova variavel, nao e significativo 

fit2 <- step(fit2, direction = 'both')

#Observe que o stepwise removeu a nova variavel
summary(fit2) 