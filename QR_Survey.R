QRSCV <- read.csv("H:/Downloads/QR_student_survey_Coded_Values.csv")

#Remove all rows with incomplete data
QRSCV <- QRSCV[complete.cases(QRSCV), ]

library(ellipse)
plotcorr(round(cor(QRSCV),2))

colors <- colorRamp(c('#CC0000','white','#3366CC'),space='Lab')
cors = round(cor(QRSCV),2)

plotcorr(cors, color=rgb(colors((cors+1)/2),maxColorValue=255),mar=c(0.1,0.1,0.1,0.1))

#Select the data found
Sel <- data.frame(Loneliness=QRSCV$Loneliness,TimeRoom=QRSCV$HoursRoom)

#Sort
Sel[order(Sel$Loneliness),]

#Get the means
means <- c(mean(Sel[Sel$Loneliness==1,2]),mean(Sel[Sel$Loneliness==2,2]),mean(Sel[Sel$Loneliness==3,2]),mean(Sel[Sel$Loneliness==4,2]),mean(Sel[Sel$Loneliness==5,2]),mean(Sel[Sel$Loneliness==6,2]))

#Connect the data
Sel2 <- data.frame(Loneliness = c(1:6), TimeRoom = means)