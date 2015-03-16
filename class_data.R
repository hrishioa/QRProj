class_data <- read.csv("H:/Downloads/The QR Correlation Questionnaire (Responses) - Form Responses 1.csv")
class_data <- class_data[-7,]
View(class_data)

names(class_data) <- c('timestamp','sleep','happy','2d4d','haircolor','age','height','weight','coffee','questions','leftfoot','pulse')
class_data[23,2] = '8'

View(class_data)

normalizedCD <- data.frame('x' = c(1:59))

normalizedCD <- data.frame(normalizedCD, 'sleep' = scale(as.numeric(class_data[,2])))
normalizedCD <- data.frame(normalizedCD, 'happy' = scale(as.numeric(class_data[,3])))
normalizedCD <- data.frame(normalizedCD, '2d4d' = scale(as.numeric(class_data[,4])))
normalizedCD <- data.frame(normalizedCD, 'haircolor' = scale(as.numeric(class_data[,5])))
normalizedCD <- data.frame(normalizedCD, 'age' = scale(as.numeric(class_data[,6])))
normalizedCD <- data.frame(normalizedCD, 'height' = scale(as.numeric(class_data[,7])))
normalizedCD <- data.frame(normalizedCD, 'weight' = scale(as.numeric(class_data[,8])))
normalizedCD <- data.frame(normalizedCD, 'coffee' = scale(as.numeric(class_data[,9])))
normalizedCD <- data.frame(normalizedCD, 'questions' = scale(as.numeric(class_data[,10])))
normalizedCD <- data.frame(normalizedCD, 'leftfoot' = scale(as.numeric(class_data[,11])))
normalizedCD <- data.frame(normalizedCD, 'pulse' = scale(as.numeric(class_data[,12])))

View(normalizedCD)