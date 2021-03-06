QRSCV <- read.csv("~/Downloads/QR_student_survey_Coded_Values.csv")

#Remove all rows with incomplete data
QRSCV <- QRSCV[complete.cases(QRSCV), ]

cors = round(cor(QRSCV),2)

#Select the data found
Sel <- data.frame(Loneliness=QRSCV$Loneliness,TimeRoom=QRSCV$HoursRoom)

#Sort
Sel[order(Sel$Loneliness),]

#Build and print linear model
lmfit = lm(Sel$TimeRoom ~ Sel$Loneliness)

plot(lmfit)

ggplot(data=Sel,aes(x=Loneliness,TimeRoom))+geom_point()+geom_smooth(method='lm')

#Get the means
means <- c(mean(Sel[Sel$Loneliness==1,2]),mean(Sel[Sel$Loneliness==2,2]),mean(Sel[Sel$Loneliness==3,2]),mean(Sel[Sel$Loneliness==4,2]),mean(Sel[Sel$Loneliness==5,2]),mean(Sel[Sel$Loneliness==6,2]))

#Connect the data
Sel2 <- data.frame(Loneliness = c(1:6), TimeRoom = means)

library(ggplot2)
#Plot the graph
ggplot(data=Sel2,aes(x=Loneliness,TimeRoom))+geom_line()+geom_smooth(method='lm')

lm2 = lm(Sel2$Loneliness ~ Sel2$TimeRoom)

plot(lm2)