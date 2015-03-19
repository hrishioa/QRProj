Wine <- read.csv("H:/Downloads/Wine.csv")
View(Wine)

#Clean
Wine = Wine[!is.na(Wine$LPRICE2),]

#Plot
ggplot(data=Wine,aes(x=TIME_SV,y=LPRICE2))+geom_point()+geom_smooth()+geom_smooth(method=lm,color='red',se=FALSE)