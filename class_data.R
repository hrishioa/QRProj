class_data <- read.csv("H:/Downloads/The QR Correlation Questionnaire (Responses) - Form Responses 1.csv")
class_data <- class_data[-7,]
View(class_data)

names(class_data) <- c('timestamp','sleep','happy','2d4d','haircolor','age','height','weight','coffee','questions','leftfoot','pulse')

View(class_data)