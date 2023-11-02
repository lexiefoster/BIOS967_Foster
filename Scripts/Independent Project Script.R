## 10/31/23 - data wrangling
install.packages("tidyverse")
install.packages("wbstats")

library(wbstats)
library(tidyverse)

# Filtering out columns I will not be analyzing -- Removing the sugar amino acid columns
Plant_Exudate_Datasheet %>% select(-LAC, -CIT, -MAL, -FUM, -SUC)
view(Plant_Exudate_Datasheet)

# Turning dates-as-characters into "date" objects
as.Date(Plant_Exudate_Datasheet$`Planting date`, format="%m/%d/%y")
as.Date(Plant_Exudate_Datasheet$`Root Weight Taken Date`, format="%m/%d/%y")
as.Date(Plant_Exudate_Datasheet$`Date AA/OA Data Received`, format="%m%d%y")




