## 10/31/23 - data wrangling
#install.packages("tidyverse")
#install.packages("wbstats")

library(wbstats)
library(tidyverse)

Plant_Exudate_Datasheet=read.csv("data/Plant Exudate Datasheet.csv")

# Filtering out columns I will not be analyzing -- Removing the sugar amino acid columns
dat=Plant_Exudate_Datasheet %>% select(-LAC, -CIT, -MAL, -FUM, -SUC)
view(Plant_Exudate_Datasheet)



# Turning dates-as-characters into "date" objects
dat %>%
  mutate(Planting.date=as.Date(dat$Planting.date, format="%m/%d/%y")) %>%
  mutate(root.weight.taken.date=as.Date(dat$Root.Weight.Taken.Date, format="%m/%d/%y")) %>%
  mutate(Date.AA.OA.Data.Received=as.Date(dat$Date.AA.OA.Data.Received, format="%m%d%y"))

## 11/1/23 - work session - trying to visualize different plots using my dataset
colorset=rainbow(200)
pt.cols=colorset[as.numeric(dat$Genotype.ID)]
plot(Trp~Root.weight..g., data=dat, xlab="Root weight (g)", ylab="Trp", las=1, pch=19)

##ggplot way
ggplot(dat, aes(x=Root.weight..g., y=Trp, color=Genotype.ID)) +
  geom_point() +
  theme(legend.position = "none")

#typical boxplot
ggplot(dat, aes(x=Genotype.ID, y=Trp, fill=Genotype.ID)) +
  geom_boxplot(notch=T) +
  scale_fill_brewer(palette="RdYlBu") +
  ylab("Trp")

# step 1: define the data and aesthetics


#step 2: add scatter plot using geom_point()
ggplot(dat, aes(x=Root.weight..g., y=Trp, color="Genotype ID")) + geom_point(size=2) # this is not working either

## For next time: figure out why my graph codes are not displaying the data correctly

names(dat)

## Plans for next work day 11/9 -- sorting out Genotype IDs -- cutting them down to
head(dat)

dat %>%
  mutate(genotypes=as.numeric(Genotype.ID)) %>%
  filter(genotypes<400)

ggplot(dat %>%
         mutate(genotypes=as.numeric(Genotype.ID)) %>%
         filter(genotypes<25), aes(x=Root.weight..g., y=Trp, color=Genotype.ID)) +
  geom_point(size=2)
