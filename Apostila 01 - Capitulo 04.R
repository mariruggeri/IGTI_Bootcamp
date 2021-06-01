########################################################### 
####### Teste de Hipótese #######
## AED - Capitulo 04 - Prof. Máiron Chaves ####
###########################################################

#Limpa memória do R
rm(list = ls()) 

########## Avaliando a normalidade de uma variável aleatória  #############################

set.seed(10)
# Gera v.a. que segue distribuição normal com n = 70, 
# média = 40 e desvio padrão = 8
va_normal <- rnorm(n = 70, mean = 25, sd = 8)

# Gera v.a. que segue uma distribuição F (não normal) com n = 15, 
# 2 graus de liberdade no numerados e 10 graus de liberdade no denominador
va_nao_normal <- rf(n =15, df1 =2, df2 = 10)

# Visualize o histograma das variáveis geradas
# Observe como os dados se distribuem em torno do valor médio na va normal
# Observe como os dados não se distribuem em torno de um valor médio exibindo (padrão assimétrico)
 
hist(va_normal)
hist(va_nao_normal)

# Visualize o QQ-Plot
# Observe como os pontos de dados seguem a linha reta qq norm da va normal 

qqnorm(va_normal)
qqline(va_normal) #Este comando é para adicionar a linha

# Observe como os pontos de dados não seguem a linha reta na va não normal
qqnorm(va_nao_normal)
qqline(va_nao_normal) #Este comando é para adicionar a linha

# Vamos aplicar o teste de hipóteses Shapiro Wilk. 

# O teste funciona sob as hipóteses: 
# H0: A variável segue uma distribuição normal
# H1: A variável não segue uma distribuição normal


# Fixe um nível de significância alfa e analise o p valor (p-value) do Shapiro Wilk 
# Se o p-value for menor que alfa a hipótese nula deve ser rejeitada 
shapiro.test(va_normal)
shapiro.test(va_nao_normal)


################ Teste t para diferença de médias (duas amostras independentes) ################

# Iremos simular o exemplo da apostila
# Iremos testar se:
# H0: As vendas na posição A são iguais as Vendas na Posição B
# H1: As vendas na posição A são diferentes das vendas na posição B 

mu1 <- 150.1 #Armazena as média de vendas na posição A
mu2 <- 182.1 #Armazena as média de vendas na posição B

s1 <- 17 #Armazena o desvio padrão das vendas na posição A 
s2 <- 19.2 #Armazena o desvio padrão das vendas na posição B

n1 <- 25 #Armazena a quantidade observações registradas para de vendas na posição A
n2 <- 30 #Armazena a quantidade observações registradas para de vendas na posição B

#Calcula nossa estatística de teste. Que é o t calculado
t_calc <- (mu1 - mu2) / sqrt( s1^2/n1 + s2^2/n2)
t_calc #Visualize o valor de t calculado

# Calcula os graus de liberdade da estatística de teste
grau_lib <- (s1^2/n1 + s2^2/n2)^2 /( (s1^2/n1)^2 / (n1-1) + (s2^2/n2)^2 / (n2-1) )
grau_lib #Visualize a quantidade de graus de liberdade

# Obtem o quantil (t crítico) para uma distribuição t com gl graus de liberdade. 
# A um alfa de 5%
quantil <- qt(0.975,df = grau_lib) 
quantil #Visualize o t crítico

# Esse é o aspecto de uma distribuição t com n=53 observações 
# e com n - 1 graus de liberdade
plot(density(rt(n = 53,df = grau_lib)),xlim = c(-7,7))

# Observe onde estão os valores críticos que acabamos de encontrar
abline(v = quantil,col = 'blue',lwd = 2) 
abline(v = -quantil,col = 'blue',lwd = 2)
abline(v = t_calc, col = 'red')

# Observe como o tcalculado é muito menor que o tcrítico. 
# Está na região de rejeição
# Obtendo o valor p P(Tcalculado > Tcritico)
options(scipen = 666)
2*pt(q = t_calc, df = grau_lib)


# Agora vamos realizar o mesmo teste de hipótese utilizando a função nativa do R
# a função --> t.test()

vendas_A <- rnorm(n= 25, mean = 150.1, sd = 17)
vendas_B <- rnorm(n = 30, mean = 182.1, sd = 19.2)

# Observe no output desta função, que ela já nos da tudo pronto, 
# t calculado e valor p
t.test(vendas_A,vendas_B, alternative = 'two.sided')

# vEsse é o aspecto de uma distribuição t com n observações e 
# com n - 1 graus de liberdade
n <- 5
plot(density(rt(n = n,df = n-1)))

# rt significa Random T de Student 
# Altere o valor de n de 5 em 5 observe que a medida que os graus de 
# liberdade aumenta a distribuição se aproxima da normal. 
# Como os valores são gerados aleatoriamente poderemos ter 
# curvas diferentes para um mesmo valor de n, mas a medida que n cresce 
# o comportamento simétrico tende a estabilizar.


################ Teste t para diferença de médias (duas amostras dependentes) ################

# Iremos simular o exemplo da apostila
# H0: O peso médio após a dieta é igual ao peso médio antes da dieta
# H1: O peso médio após a dieta é menor do que o peso médio antes da dieta

# Iremos utilizar uma biblioteca adicional para gerar valores aleatórios que sigam uma distribuição normal entre um intervalo de valor para simular os pesos
# A biblioteca chama 'truncnorm'. 

# install.packages('truncnorm')
library(truncnorm)

set.seed(100)

# Gera uma amostra aleatória, seguindo uma distribuição normal 
# cujo valor mínimo é 100 e o valor máximo é 140.
# O valor de n=20, média = 123 e desvio padrão 18
# Com essa v.a. iremos simular os pesos dos indivíduos antes da dieta 

antes_da_dieta <- rtruncnorm(n=20, a=100, b=140, mean=123, sd=18)


# Gera uma amostra aleatória, seguindo uma distribuição normal 
# cujo valor mínimo é 110 e o valor máximo é 130.
# O valor de n=20, média = 110 e desvio padrão 28
# Com essa v.a. iremos simular os pesos dos indivíduos após a dieta 

depois_da_dieta <- rtruncnorm(n=20, a=110, b=130, mean=110, sd=28) 


#Calcula a diferença depois da dieta e antes da dieta, para cada indivíduo 

diferenca_dieta <- depois_da_dieta-antes_da_dieta

?hist

#Visualiza a distribuicao da diferença de pesos
hist(diferenca_dieta,
     col = 'red',
     labels = TRUE,
     main = "Diferença das Dietas Antes e Depois")

#Avalie a normalidade da distribuição da diferença 
shapiro.test(diferenca_dieta) 

# Aplica test t com os seguintes argumentos 
# Pareado 
# Unilateral a esquerda 
# 90% de confiança 
t.test(depois_da_dieta,antes_da_dieta,
        paired = TRUE,
        alternative = "less", 
        conf.level = 0.9
        )

# O comando t.test() acima nos da tudo que precisamos para executar e concluir o teste. 
# Mas a título de conhecimento, podemos realizar o teste passo a passo
# Calcula a média das diferenças

media <- mean(diferenca_dieta)
media
#Desvio padrão das diferenças

desvio_padrao <- sd(diferenca_dieta)
desvio_padrao

# Quantidade de indivíduos
n <- 20

# Obtem o t calculado
t_calculado <- media / (desvio_padrao/sqrt(n))
t_calculado

# Obtem o valor p para o t calculado com n - 1 graus de liberdade.
pt(q = t_calculado, df = n-1)


# Podemos também obter o t crítico para uma distribuição t com 19 (n-1=20-1)
# graus de liberdade ao nível de confiança de 90%

tcrítico_teste_t_pareado <- -qt(p = 0.9, df = 19) 



# Devido ao teste ser unilateral a esquerda a distribuição t ser simétrica, 
# nossa estatística de teste será negativa.
# Observe que o t calculado é maior que o t critico. 
# Como estamos em um teste unilateral a esquerda o t calculado
# estará fora da região de rejeição caso seja maior que o t crítico

t_calculado < tcrítico_teste_t_pareado


################ Teste Qui-Quadrado para associação entre variáveis categóricas ################
#Iremos simular o exemplo da apostila 
# H0: O fato do cliente estar ou não com criança não tem relação com o fato 
#     de comprar ou não comprar
# H1: O fato do cliente estar ou não com criança tem relação com fato de comprar 
#     ou não comprar

#Vamos gerar um data frame contendo os dados da pesquisa
dados <- readr::read_csv("data/df_02_a_04.csv", na = c("", "-", "NA"))

# Visualiza o conjunto de dados
View(dados)

# Gera tabela de contigência 2x2
tabela <- table(dados$Cliente,dados$Comprou) 
tabela
  

barplot(tabela)

# O valor críticico para uma distribuição qui-quadrado 
# com (linhas-1)*(colunas-1)=1 grau de liberdade ao nível de confiança de 95%

qchisq(p=0.95,df = 1)
# T crítico = 3.841459 
  
# O valor p unilateral fica
1-pchisq(q=10.728,df=1) 
# Mesmo que o nível de confiança fosse 99%, ainda teríamos evidências para rejeitar H0

# Assim como fizemos no test t, podemos usar um comando direto no R para realizar 
# o teste qui-quadrado chisq.test()

teste<- chisq.test(tabela, 
                  correct = F)
teste


# Visualiza valores observados.
# Que nada mais é do que a tabela original teste$observed
# Visualiza valores esperados
  
teste$expected
  
rm(list = ls())

################ ANOVA ########################## 

# Vamos utilizar o exemplo da apostila
# H0: Não há diferença no valor médio gasto com bebidas em nenhuma das populações
# H1: Há diferença no valor médio gasto com bebidas em pelo menos uma das populações


# Gera um data frame contendo os dados da pesquisa
dados_anova <- readr::read_csv("data/df_03_a_04.csv", na = c("", "-", "NA"))

View(dados_anova)

table(dados_anova$Estado_Civil) 


# Podemos utilizar os recursos de visualização da biblioteca 
# ggplot2 para visualizar a distribuição dos gastos nas populações

library(ggplot2)

?ggplot

ggplot(data = dados_anova, 
       aes(x = Gastos, fill = Estado_Civil)) + 
       geom_density(alpha=0.4) +
       xlim(-50, 300)


# É bastante comum também analisarmos a variabilidade 
# nas distintas populações com uso de boxplot

boxplot(dados_anova$Gastos ~ dados_anova$Estado_Civil)

# Com o comando aov(), o R gera a tabela da ANOVA completa 
anova <- aov(Gastos~Estado_Civil, 
             data = dados_anova)

# Visualize a tabela da ANOVA. 
# Observe o F calculado e o valor p ( Pr > F)
summary(anova)

# O valor p é praticamente zero. 
# Mesmo que nosso nível de confiança fosse 99,9% ainda 
# teríamos evidências para rejeitar H0

