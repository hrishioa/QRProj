library(ggplot2)

##QRSCV <- ###########

Fb <- c(mean(QRSCV$Facebook[QRSCV$Loneliness==1]),mean(QRSCV$Facebook[QRSCV$Loneliness==2]),mean(QRSCV$Facebook[QRSCV$Loneliness==3]),mean(QRSCV$Facebook[QRSCV$Loneliness==4]),mean(QRSCV$Facebook[QRSCV$Loneliness==5]))

FBD <- data.frame(X=c(1:5),Y=Fb)

ggplot(data=FBD)+geom_point(aes(x=X,y=Fb))+geom_smooth(aes(x=X,y=Fb),method='lm')

lmod = lm(FBD$X ~ FBD$Y)