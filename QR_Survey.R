QRSCV <- read.csv("H:/Downloads/QR_student_survey_Coded_Values.csv")

#Remove all rows with incomplete data
QRSCV <- QRSCV[complete.cases(QRSCV), ]

library(ellipse)
plotcorr(round(cor(QRSCV),2))

colors <- colorRamp(c('#CC0000','white','#3366CC'),space='Lab')
cors = round(cor(QRSCV),2)

plotcorr(cors, color=rgb(colors((cors+1)/2),maxColorValue=255),mar=c(0.1,0.1,0.1,0.1)