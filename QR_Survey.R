QRSCV <- read.csv("H:/Downloads/QR_student_survey_Coded_Values.csv")

#Remove all rows with incomplete data
QRSCV <- QRSCV[complete.cases(QRSCV), ]