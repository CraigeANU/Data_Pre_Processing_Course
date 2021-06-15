# 1. Working with the iris dataset



# a. Get all rows of Species "versicolor" in a new dataframe, call this dataframe: iris.vers

iris.vers = subset(iris, Species == "versicolor"); iris.vers



# b. Get a vector called "sepal.dif" with the difference between Sepal.Length and Sepal.Width of versicolor plants

sepal.dif = iris.vers$Sepal.Length - iris.vers$Sepal.Width; sepal.dif



# c. Update (add) iris.vers with the new column (sepal.dif)

iris.vers = data.frame(iris.vers, sepal.dif); head(iris.vers)





# 2. Classes of Variables (mtcars)



# a. Check the class of each variable in mtcars

head(mtcars)

sapply(mtcars, class)



# b. Change am, cyl and vs to integer and store the new dataset as newmtc

attach(mtcars)

newmtc = data.frame(mpg, cyl = as.integer(cyl),
                    
                    disp, hp, drat, wt, qsec,
                    
                    vs = as.integer(vs), am = as.integer(am),
                    
                    gear, carb)



sapply(newmtc, class)



# c. Round the newmtc dataframe to 1 digit

round(newmtc, 1)





# 3. Advanced filtering of iris



# a. Use dplyr to filter for all data of Species "virginica" with a

# Sepal.Width of greater 3.5

library(dplyr)

filter(iris, Sepal.Width > 3.5, Species =="virginica")



# b. How would you use R Base to get a dataframe of

# all data of Species "virginica" with a Sepal.Width of greater 3.5

# but without the last column Species in the dataframe?

iris[iris$Species == "virginica" & iris$Sepal.Width > 3.5, 1:4]



# c. Get the row IDs of the rows matching the 2 filtering criteria provided above

row.names(iris[iris$Species == "virginica" & iris$Sepal.Width > 3.5, 1:4])





# 4. Manipulating dataframes at column level, dataset = iris



# a. Repeat each value of Sepal.Length and repeat the whole sequence as well

rep(iris$Sepal.Length, each = 2, times = 2)



# b. Get a new object which contains only the odd values of Sepal.Length

sep.lengthodd = iris[c(T,F),1]



# c. Get a new object which repeats each value from the new vector of exercise b

newsep.length = rep(sep.lengthodd, each = 2)



# d. Replace the Sepal.Length column of iris

# with the new Sepal.Length from exercise c, check if the replacement worked

iris$Sepal.Length = newsep.length; head(iris)











# 5. Big Data Example with diamonds (package: ggplot2)



# a. Get familiar with the dataset diamonds from ggplot

library(ggplot2)

? diamonds

summary(diamonds)



# b. Attach the dataset

attach(diamonds)



# c. Get a subset of the diamonds dataset with all the rows that have

# a clarity of "SI2" and a depth of at least 70.

# Call the subset diam.sd and display it in the same line of code

diam.sd = subset(diamonds, clarity == "SI2" & depth >= 70); diam.sd





# d. Which index positions have a clarity

# of SI2 and a depth of at least 70? (hint: row.id in tibble)

library(tibble)

diam.id = rowid_to_column(diamonds, var = "rowid")

diam.id = subset(diam.id, clarity == "SI2" & depth >= 70)

diam.id[,1]



# e. Store the index positions as an integer object

index.pos = diam.id[,1]; index.pos







# 6. Getting counts of filtered datasets (ggplot2 : diamonds)



# a. How many observations of diamonds have a cut of ideal and have less than 0.21 carat?

sum(cut == "Ideal" & carat < 0.21) # diamonds is attached to environment



# b. How many observations of diamonds have a combined x + y + z dimension greater than 40?

sum ((x + y + z) > 40)



# c. How man observations of diamonds have either a price above 10000 or a depth of at least 70?

sum(price > 10000 | depth >= 70)







# 7. Filtering based on row and column ID (ggplot2, diamonds)



# a. Get a table with observations 67 and 982 of variables color and y

diamonds[c(67,982), c(3,9)]



# b. Get a table with the full info on observations 453, 792 and 10489

diamonds[c(453, 792, 10489), ]



# c. Get the first 10 rows of the dataset diamonds with the variables x, y, z

head(diamonds[ , c(8,9,10)],10)





# 8. Ordering data (ggplot2, diamonds)



# a. Create the object newdiam which is a subset of the first 1000 rows of diamonds

newdiam = diamonds[1:1000,]



# b. Order newdiam according to price, starting with the lowest

# hint: dplyr, arrange is a useful function for that!

library(dplyr)



head(arrange(newdiam, price))



# c. Order newdiam according to price, starting with the highest

head(arrange(newdiam, desc(price)))



# d. Order newdiam like in c, but ties should be arranged with increasing depth

head(arrange(newdiam, desc(price), depth))





# 9. Sampling big dataframes, data = diamonds



# a. Use dplyr, sample_n to get the object diam750 which contains 750

# randomly sampled observations of diamonds

# I use seed nr 56 for reproduction

library(dplyr)



set.seed(56)



diam750 = sample_n(diamonds, 750)



# b. Get a summary of the new dataframe

summary(diam750)



# c. Plot a scatterplot of price vs depth

# use R Base plot, and the function "with" (less code)

with(diam750, plot(price, depth))







# 10. Working with tibbles - diamonds, use package tibble functions only

# Lets say newdiam consists of the first 100 rows, as well as price and carat



newdiam2 <- diamonds[1:100, c(7,1)]



# a. How do you know that this is a tibble?

head(newdiam2)

library(tibble)

is.tibble(newdiam2)



# b. Add a new row with a price of 336 with 0.32 carat

newdiam2 <- add_row(newdiam2, price = 336, carat = 0.32)

tail(newdiam2)



# c. How many rows and columns does the tibble have?

tbl_sum(newdiam2)



# d. Print the object in a transposed way (glimpse)

glimpse(newdiam2)



# e. Does the tibble have a rowname?

has_rownames(newdiam2)

