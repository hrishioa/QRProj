#GPL Function
ggplotRegression <- function (fit) 
{
  
  require(ggplot2)
  
  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}

winemod <- function(x) {
  
}

Wine <- read.csv("H:/Downloads/Wine.csv")
View(Wine)

#Clean
Wine = Wine[!is.na(Wine$LPRICE2),]

#Create a linear model
lmod = lm(TIME_SV ~ LPRICE2, data=Wine)
ggplotRegression(lmod)

#Plot
ggplot(data=Wine,aes(x=TIME_SV,y=LPRICE2))+geom_point()+geom_smooth()+geom_smooth(method=lm,color='red',se=FALSE)