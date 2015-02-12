#Add the poverty file - change this when the file location changes
poverty <- read.csv("~/R Projects/WRProject1/poverty.csv")
poverty <- t(poverty)
poverty <- poverty[-1,]
View(poverty)

#adds, transposes and edits the suicide file, same as before
suicide <- read.csv("~/R Projects/WRProject1/suicide.csv")
suicide <- t(suicide)
suicide <- suicide[-1,]
View(suicide)

#select only the data you want from poverty and store it in temp
temp <- data.frame(row.names(poverty),poverty[,25])
names(temp)[1] <- "Country"
names(temp)[2] <- "2002P"

#select only the data you want from suicide and store it in temp
temp2 <- data.frame(row.names(suicide),suicide[,53])
names(temp2)[1] <- "Country"
names(temp2)[2] <- "2002S"

#re-edit the data sets to include only common values
poverty <- data.frame(subset(temp,temp$Country %in% row.names(suicide)))
suicide <- data.frame(subset(temp2,temp2$Country %in% row.names(poverty)))

#sort the list to make sure they're in order
poverty <- poverty[order(poverty[,1]),]
suicide <- suicide[order(suicide[,1]),]

#Combine them into a final dataset
final_data <- data.frame(Country=poverty[,1],Poverty=poverty[,2],Suicide=suicide[,2])

#load ggplot library
library(ggplot2)

#plot all the data first
ggplot(final_data,aes(x=Poverty,y=Suicide)) + geom_text(label=final_data$Country) + geom_point(size=1)

#plot with locally weighter regression
ggplot(final_data,aes(x=Poverty,y=Suicide)) + geom_text(label=final_data$Country) + geom_point(size=1) + geom_smooth()

#Continents data
Continents <- read.csv("H:/Downloads/Countries-Continents-csv.csv")
View(Countries.Continents.csv)

#Once again, get the most important data
Continents <- Continents[,1:2]

#Select for common countries
Continents <- subset(Continents,Continents$Country %in% final_data$Country)

#Merge the datasets
final_data <- merge(x=Continents,y=final_data)

#plot the old data but with region based regression lines
graph <- ggplot(final_data,aes(x=Poverty,y=Suicide))
(graph <- graph + geom_point(data=final_data,size=2,aes(color=Continent)))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='Africa',],aes(x=Poverty,y=Suicide,color=Continent),size=1))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='Asia',],aes(x=Poverty,y=Suicide,color=Continent),size=1))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='Europe',],aes(x=Poverty,y=Suicide,color=Continent),size=1))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='North America',],aes(x=Poverty,y=Suicide,color=Continent),size=1))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='Oceania',],aes(x=Poverty,y=Suicide,color=Continent),size=1))
(graph <- graph + geom_smooth(data=final_data[final_data$Continent=='South America',],aes(x=Poverty,y=Suicide,color=Continent),size=1))