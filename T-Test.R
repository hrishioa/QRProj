estimate <- read.csv("H:/Downloads/Population Estimates - Sheet1.csv")
View(Population.Estimates...Sheet1)

estimate <- estimate[19:53,]

estimate <- estimate[order(estimate$Condition),]

high <- c(estimate$MeanRatio[1:17])

low <- c(estimate$MeanRatio[17:35])

library(ggplot2)

ggplot()+geom_histogram(data=estimate[1:17,],aes(x=MeanRatio,fill='High'))+geom_histogram(data=estimate[17:35,],aes(x=MeanRatio,fill='Low'))
