#library
library(ggplot2)

#load the data
admdata <- read.csv("H:/Downloads/admdata.csv")
View(admdata)

#find mean
mean(admdata[admdata$MATRIC=='TRUE',]$EPI)
#find SD
sd(admdata[admdata$MATRIC=='TRUE',]$EPI)

#subset the plot
admdata_q2 <- admdata[admdata$MATRIC=='TRUE',]
admdata_q2.2 <- admdata_q2[admdata_q2$SCHOL>=15000,]

#find the percentage
length(admdata_q2.2[,1])/length(admdata_q2[,1])

#plots
qplot(admdata[admdata$NAT!='Singaporean',]$AGE,binwidth=0.5,geom="histogram",main="Histogram - Ages of Non-Singaporeans (A0123631)",xlab="Age",ylab="Frequency")
qplot(admdata[admdata$NAT=='Singaporean',]$AGE,binwidth=0.5,geom="histogram",main="Histogram - Ages of Singaporeans (A0123631)",xlab="Age",ylab="Frequency")


#plot the data
#age
qplot(data=admdata, x=1, y=AGE, geom='boxplot', main="Boxplot of admdata-age",xlab="")
qplot(data=admdata, AGE, geom='histogram',main="Histogram of admdata-age",xlab="",ylab="Age")



#sort the data
admdata = admdata[order(admdata$sortvar),]

#find quantile part of the data
pick_quant = .2
below_quant = admdata[admdata$quantvar < quantile(admdata$quantvar,pick_quant),]

