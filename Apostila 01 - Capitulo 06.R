########################################################### 
####### Regressao Logística #######
## AED - Capitulo 06 - Prof. Máiron Chaves #### 
########################################################### 

rm(list = ls()) #Limpa memória do R

#install.packages('pROC') 
#Instala e carrega biblioteca para gerar a curva ROC 

library(pROC) 
library(dplyr)

dados <- readr::read_csv("data/df_04_a_06.csv", na = c("", "-", "NA"))


# Converte variavel resposta para factor
dados$Classe <- factor(dados$Classe, levels = c('Ruim','Boa'))

# Pequena analisa exploratoria
dados %>% group_by(Classe) %>% 
          summarise_all("mean")


# Ajusta regressao logistica
# Comando glm 

fit <- glm(Classe ~ Prova_Logica + 
                    Redacao + 
                    Auto_Avaliacao, 
                    data = dados,
                    family = binomial)


# Visualiza resumo do modelo ajustado
summary(fit)

# Aplica exponenciacao nos coeficientes para interpretar
exp(fit$coefficients)


# Curva ROC
prob = predict(fit, 
               newdata = dados, 
               type = "response")

prob
View(data.frame(dados,prob))

roc = roc(dados$Classe ~ prob, 
          plot = TRUE, 
          print.auc = TRUE) 

# Obtem a predicao/probabilidade para cada observacao 

Probabilidade <- predict(fit, 
                         newdata= dados,
                         type = 'response')

# Se a probabilidade for maior que 50% classifica como 'Boa'
Classe_Predita <- ifelse(Probabilidade > 0.5,"Boa","Ruim")

#Visualiza data frame com as predicoes
View(data.frame(dados,Probabilidade,Classe_Predita))

# Gera matriz de confusao

matriz_confusao <- table(Classe_Predita = Classe_Predita, 
                  Classe_Original = relevel(dados$Classe,ref = 'Boa'))


# Armazena valores da matriz de confusao
verdadeiro_positivo <- matriz_confusao[1,1];verdadeiro_positivo
verdadeiro_negativo <- matriz_confusao[2,2];verdadeiro_negativo

falso_negativo <- matriz_confusao[2,1];falso_negativo
falso_positivo <- matriz_confusao[1,2];falso_positivo

# Calcula acuracia
# diag = diagonal
acuracia <- sum(diag(matriz_confusao))/ sum(matriz_confusao);acuracia

# Calcula Sensitividade
sensitividade <- verdadeiro_positivo /(verdadeiro_positivo + falso_negativo);sensitividade

#Cacula Especificidade
especificidade <- verdadeiro_negativo / (verdadeiro_negativo + falso_positivo);especificidade

# Analise de Sensitividade e Especificidade
# Organizar as probabilidades criadas na linha 56
limiares <- sort(Probabilidade)


acuracia <- c() 
sensitividade <- c() 
especificidade <- c()

for ( i in 1:length(limiares)) {
  limiar_atual <- limiares[i]
  Classe_Predita <- ifelse(Probabilidade > limiar_atual,'Boa' , 'Ruim')
  # Gera matriz de confusao
  confusao <- table(Classe_Predita = Classe_Predita, 
                    Classe_Original = relevel(dados$Classe,ref = 'Boa'))
  vp <- confusao[1,1];
  fn <- confusao[2,1];
  vn <- confusao[2,2]; 
  fp <- confusao[1,2];
  acuracia[i] <- sum(diag(confusao))/ sum(confusao); #Calcula acuracia
  sensitividade[i] <- vp /(vp+fn)   #Calcula Sensitividade
  especificidade[i] <- vn / (vn + fp)   #Calcula Especificidade

}



plot(y = sensitividade[1:698] , 
     x = limiares[1:698], 
     type="l", 
     col="red", 
     ylab = 'Sensitividade e Especificidade', 
     xlab= 'Pontos de Corte')
grid()
lines(y = especificidade[1:698], 
      x = limiares[1:698], 
      type = 'l',col="blue" )
legend("bottomleft", 
       c("sensibilidade","especificidade"), 
       col=c("red","blue"), 
       lty=c(1,1),
       bty="n", 
       cex=1, 
       lwd=1)
abline(v=0.225)


# Obtem novamente as probabilidades para classificar baseado no ponto de corte 22,5%
Probabilidade <- predict(fit, newdata= dados,type = 'response') 
Classe_Predita <- ifelse(Probabilidade > 0.225,"Boa","Ruim")

View(data.frame(dados,Probabilidade,Classe_Predita))


# Visualiza matriz de confusao final
confusao <- table(Classe_Predita = Classe_Predita, 
                  Classe_Original = relevel(dados$Classe,ref = 'Boa'))

# Armazena valores da matriz de confusao
vp <- confusao[1,1];vp 
fn <- confusao[2,1];fn

vn <- confusao[2,2];vn 
fp <- confusao[1,2];fp
# Calcula acuracia
acuracia <- sum(diag(confusao))/ sum(confusao);acuracia
# Calcula Sensitividade
sensitividade <- vp /(vp+fn)
# Cacula Especificidade
especificidade <- vn / (vn + fp)


# Biblioteca caret fornece acuracidade, sensitividade, especificidade