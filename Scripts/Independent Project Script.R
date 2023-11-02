## 10/31/23 - data wrangling
install.packages("tidyverse")
install.packages("wbstats")

library(wbstats)
library(tidyverse)

Plant_Exudate_Datasheet=read.csv("data/Plant Exudate Datasheet.csv")

# Filtering out columns I will not be analyzing -- Removing the sugar amino acid columns
dat=Plant_Exudate_Datasheet %>% select(-LAC, -CIT, -MAL, -FUM, -SUC)
view(Plant_Exudate_Datasheet)

# Turning dates-as-characters into "date" objects
dat %>%
  mutate(Planting date=as.Date(dat$Planting date, format="%m/%d/%y")) %>%
  mutate(root weight taken date=as.Date(dat$`Root Weight Taken Date`, format="%m/%d/%y")) %>%
  mutate(Date AA/OA Data Received=as.Date(dat$`Date AA/OA Data Received`, format="%m%d%y"))

## 11/1/23 - work session - trying to visualize different plots using my dataset
colorset=rainbow(200)
pt.cols=colorset[as.numeric(dat$`Genotype ID`)]
plot(Trp~Root weight (g), data=dat, xlab="Root weight (g)", ylab="Trp", las=1, pch=19, col=pt.cols)

#typical boxplot
ggplot(dat, aes(x="Genotype ID", y="Trp", fill="Genotype ID")) +
  geom_boxplot(notch=T) +
  scale_fill_brewer(palette="RdYlBu") +
  ylab("Sepal Width")

# step 1: define the data and aesthetics
library(ggplot2)
ggplot(data=dat, mapping=aes(x="Genotype ID", y="Trp")) # this is not working

#step 2: add scatter plot using geom_point()
ggplot(dat, aes(x="Root weight (g)", y="Trp", color="Genotype ID")) + geom_point(size=2) # this is not working either

## For next time: figure out why my graph codes are not displaying the data correctly






