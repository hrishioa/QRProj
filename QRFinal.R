HExpen <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/HealthExpenPerCapita.csv")
HExpen <- HExpen[,c(1,17)]
LifeExpect <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/LifeExpectancy.csv")
LifeExpect <- LifeExpect[,c(1,206)]
PopDens <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/PopulationDensity.csv")
PopDens <- PopDens[,c(1,62)]


HExpen <- HExpen[complete.cases(HExpen), ]

LifeExpect <- LifeExpect[complete.cases(LifeExpect), ]

PopDens <- PopDens[complete.cases(PopDens), ]


#Find common elements
LE <- LifeExpect
LE <- subset(LE,LE$Year %in% PopDens$Year)
LE <- subset(LE,LE$Year %in% HExpen$X1995)
PD <- PopDens
PD <- subset(PD,PD$Year %in% HExpen$X1995)
PD <- subset(PD,PD$Year %in% LifeExpect$Year)
HE <- HExpen
HE <- subset(HE,HE$X1995 %in% LifeExpect$Year)
HE <- subset(HE,HE$X1995 %in% PopDens$Year)

#Sort
HE <- HE[order(HE[,1]),]
LE <- LE[order(LE[,1]),]
PD <- PD[order(PD[,1]),]

#Combine the Datasets for the current Year


#Supplementary Info
Supp_GDP <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/Supp_GDP.csv")
Supp_HDI <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/Supp_HDI.csv")
Supp_BMI <- read.csv("~/Dropbox/Yale-NUS College/Y1Sem2/QR/Supp_BMI.csv")

OECDCon <- c('Australia','Austria','Belgium','Canada','Chile','Czech Republic','Denmark','Estonia','Finland','Greece','France','Germany','Hungary','Iceland','Ireland','Israel','Italy','Japan','South Korea','Luxembourg','Mexico','Netherlands','New Zealand','Norway','Poland','Portugal','Slovak Republic','Solvenia','Spain','Sweden','Switzerland','Turkey','United Kingdom','United States')

#Get only the current year
Supp_GDP <- Supp_GDP[,c(1,49)]
Supp_HDI <- Supp_HDI[,c(1,10)]
Supp_BMI <- Supp_BMI[,c(1,30)]

#Sanitize
Supp_GDP <- Supp_GDP[complete.cases(Supp_GDP), ]
Supp_BMI <- Supp_BMI[complete.cases(Supp_BMI), ]
Supp_HDI <- Supp_HDI[complete.cases(Supp_HDI), ]

#Intersect
S_GDP <- Supp_GDP
S_HDI <- Supp_HDI
S_BMI <- Supp_BMI

S_GDP <- subset(S_GDP,S_GDP$Year %in% S_BMI$Year)
S_GDP <- subset(S_GDP,S_GDP$Year %in% S_HDI$Year)

S_HDI <- subset(S_HDI,S_HDI$Year %in% S_BMI$Year)
S_HDI <- subset(S_HDI,S_HDI$Year %in% S_GDP$Year)

S_BMI <- subset(S_BMI,S_BMI$Year %in% S_HDI$Year)
S_BMI <- subset(S_BMI,S_BMI$Year %in% S_GDP$Year)

#select 30 countries closest to singapore after sorting
S_GDP <- S_GDP[order(S_GDP[,2]),]
S_HDI <- S_HDI[order(S_HDI[,2]),]
S_BMI <- S_BMI[order(S_BMI[,2]),]

ssize <- 35

S_BMI <- S_BMI[((60-ssize):(60+ssize)),] #singapore - 60, unintersected - 67
S_HDI <- S_HDI[((148-ssize):(148+ssize)),] #singapore - 148, unintersected - 177
S_GDP <- S_GDP[((160-ssize):(160+ssize)),] #Singapore - 160, unintersected - 162

#Intersect again
S_GDP <- subset(S_GDP,S_GDP$Year %in% S_BMI$Year)
S_GDP <- subset(S_GDP,S_GDP$Year %in% S_HDI$Year)

S_HDI <- subset(S_HDI,S_HDI$Year %in% S_BMI$Year)
S_HDI <- subset(S_HDI,S_HDI$Year %in% S_GDP$Year)

S_BMI <- subset(S_BMI,S_BMI$Year %in% S_HDI$Year)
S_BMI <- subset(S_BMI,S_BMI$Year %in% S_GDP$Year)


#OECD filter
OECDBMI <- Supp_BMI
OECDBMI <- subset(OECDBMI,OECDBMI$Year %in% OECDCon)
OECDHDI <- Supp_HDI
OECDHDI <- subset(OECDHDI,OECDHDI$Year %in% OECDCon)
OECDGDP <- Supp_GDP
OECDGDP <- subset(OECDGDP,OECDGDP$Year %in% OECDCon)

#Plot comparison
boxplot(OECDBMI$X2008,S_BMI$X2008)
boxplot(OECDHDI$X2011,S_HDI$X2011)
boxplot(OECDGDP$X2011,S_GDP$X2011)