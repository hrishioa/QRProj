library(ggplot2)

psychic <- c(4,4,7,4,8,1,6,6,5,13,4,7,10)
rand = rbinom(13,25,0.2)

psy <- data.frame(psy = psychic, rand = rand)

ggplot(data=psy)+geom_histogram(aes(x=psychic),binwidth=2)+geom_histogram(aes(x=rand,fill='red'),binwidth=2)