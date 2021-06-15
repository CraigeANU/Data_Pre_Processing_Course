?diamonds

newdiam = data.table(diamonds); class(newdiam)

newdiam

summary(newdiam)

## how many diamonds are priced above $10,000?

newdiam[,sum(price>10000)]

newdiam[price>10000, .N]

# how many diamonds >10K in price, sorted by color

newdiam[price>10000, .N, by = color]

# table with diamonds cut = "Ideal" and the color is either "E" or "J"

setkey(newdiam, color)
subset(newdiam[c("E","J")], cut == "Ideal")


# order the table by price

newdiam[order(price)]

# extract a table with price and cut

newdiam[,c("price","cut")]

# how many diamonds have combined xyz dimensions (sum) of > 18 ?

newdiam[,sum(z+x+y>18)]

# get the mean price for diamonds with a cut of "Ideal" and "Premium"

setkey(newdiam, cut)
newdiam[c("Ideal","Premium"),mean(price)]

# get the number of diamonds with a price >10000 and a cut of "Premium

setkey(newdiam, cut)
sum(newdiam["Premium", price>10000])
