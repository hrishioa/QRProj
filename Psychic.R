#Load library
library(ggplot2)

#Load observed data
psychic <- c(4,4,7,4,8,1,6,6,5,13,4,7,10)

#Generate Random Data 
rand = rbinom(13,25,0.2)

#Compile data into data frame
psy <- data.frame(psy = psychic, rand = rand)

#Plot
ggplot(data=psy)+geom_histogram(aes(x=psychic,fill='Observed'),binwidth=2)+geom_histogram(alpha=0.5,aes(x=rand,fill='Random'),binwidth=2)

#new data frame
psy2 <- data.frame(psy=rep(psychic,100),rand=rbinom(1300,25,0.2))

#new plot
  ggplot(data=psy2)+geom_histogram(aes(x=psychic,fill='Observed'),binwidth=2)+geom_histogram(alpha=0.5,aes(x=rand,fill='Random'),binwidth=2)