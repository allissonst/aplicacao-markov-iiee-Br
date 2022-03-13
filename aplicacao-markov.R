library(ggplot2)
library(openxlsx)
library(arulesViz)
library(MSwM)

dados<-read.xlsx("IIE.xlsx")
options(scipen = 9999)

IIE=dados$IIE

#regressão linear
mod<-lm(IIE ~ 1)

#aplicando markov para encontrar os regimes.
m1=msmFit(mod,k=2, sw=c(T,T))

#Mostrando os resultados
print(m1)

#plotando os resíduos
plot(m1)

#plotando as probabilidades para cada regime
plotProb(m1,1)

par(mar=c(0.1,0.1,0.1,0.1))
plotProb(m1,2)

par(mar=c(0.1,0.1,0.1,0.1))
plotProb(m1,3)
