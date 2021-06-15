library(dplyr)
library(ggplot2)

## Exercise  1
iris.vers <- subset(iris,Species=="versicolor")

sepal.dif <- iris.vers$Sepal.Length - iris.vers$Sepal.Width

## Exercise 2

newmtc<-mtcars
newmtc[,c(2,8,9)] <- lapply(mtcars[,c(2,8,9)], as.integer)
newmtc[,5:7] <- lapply(newmtc[,5:7], round,1) 

## Exercise 3


data <- filter(iris, Species == "virginica" & Sepal.Width > 3.5)

data2 <- subset(iris, iris$Species == 'virginica' & iris$Sepal.Width > 3.5, 
                select = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))

## Rbase retains original row IDs, dplyr generate new series

# Exercise 4


newsep.length <- rep(sep.lengthodd)

iris$Sepal.Length <- newsep.length

##Exercise 5

diam.sd <- subset(data, clarity=='SI2' & depth > 70); head(diam.sd)
rows <- as.integer(row.names(diam.sd))

## Exercise 6
data 
