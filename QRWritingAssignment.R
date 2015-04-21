QRSCV <- read.csv("~/Downloads/QR_student_survey_Coded_Values.csv")

#Select Data
QRSCV <- data.frame(Loneliness=QRSCV$Loneliness,Gender=QRSCV$Gender)

#Remove all rows with incomplete data
QRSCV <- QRSCV[complete.cases(QRSCV), ]

#Start graphing
library(ggplot2)

#Graph the density plot to see relationship
ggplot(data=QRSCV)+geom_density(data=QRSCV[QRSCV$Gender==1,],aes(x=Loneliness,fill='Male'),alpha=1)+geom_density(data=QRSCV[QRSCV$Gender==2,],aes(x=Loneliness,fill='Female'),alpha=0.5)+geom_density(data=QRSCV[QRSCV$Gender==3,],aes(x=Loneliness,fill='Neither'),alpha=0.5)+scale_fill_manual(name="Gender",labels=c('Male','Female','N/A'),values=c('Red','Blue','Green'))

#Separate the two into different columns and collect statistics
Male = QRSCV[QRSCV$Gender==1,]$Loneliness
Female = QRSCV[QRSCV$Gender==2,]$Loneliness

t.test(Female, Male, mu=0, alt='greater', conf=0.95, paired=F)