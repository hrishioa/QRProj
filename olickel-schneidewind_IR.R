library(ggplot2)

#load and view the data
wd <- read.csv("C:/Users/Hrishi/Dropbox/Yale-NUS College/Y1Sem2/IRSchneidewind/working_data.csv")
View(wd)

#adjust labels
colnames(wd) <- c('Names','R','TEP')

#Remove NA Value
wd <- wd[-15,]

#Create z corrected versions of both columns to look for correlations
TEP_mean = mean(wd$TEP)
TEP_sd = sd(wd$TEP)
TEPCorr <- abs(wd$TEP-TEP_mean)/TEP_sd

R_mean = mean(wd$R)
R_sd = sd(wd$R)
RCorr <- abs(wd$R-R_mean)/R_sd

wdCorr <- data.frame(SNo = seq(1:length(TEPCorr)),TEP=TEPCorr,R=RCorr)