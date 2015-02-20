library(ggplot2)

#load and view the data
wd <- read.csv("C:/Users/Hrishi/Dropbox/Yale-NUS College/Y1Sem2/IRSchneidewind/working_data.csv")
View(wd)

#fix col names
colnames(wd) <- c('Name','R','TEP','VCO')

#Remove NA Value
wd <- wd[-15,]

#Create z corrected versions of both columns to look for correlations
TEP_mean = mean(wd$TEP)
TEP_sd = sd(wd$TEP)
TEPCorr <- abs(wd$TEP-TEP_mean)/TEP_sd

R_mean = mean(wd$R)
R_sd = sd(wd$R)
RCorr <- abs(wd$R-R_mean)/R_sd

VCO_mean = mean(wd$VCO)
VCO_sd = sd(wd$VCO)
VCOCorr <- abs(wd$VCO-VCO_mean)/VCO_sd


wdCorr <- data.frame(SNo = seq(1:length(TEPCorr)),TEP=TEPCorr,R=RCorr,VCO=VCOCorr)

#plot the graph
ggplot(data=wdCorr, aes(x=SNo))+geom_smooth(aes(y=TEP,color='red'))+geom_point(aes(y=VCO,color='blue'))+ggtitle("Corrected VCO(blue) and TEP(red) Values in correspondance")+labs(x="Chemicals",y="VCO and TEP")