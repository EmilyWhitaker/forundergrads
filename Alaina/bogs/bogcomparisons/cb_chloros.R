library(tidyverse)
library(lubridate)

CB_chloro <- 
  CB_chloro %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

glimpse(CB_chloro)

ggplot(data = CB_chloro, mapping = aes(x = year, y = chlor), color= blue)
ggplot(data = CB_chloro, mapping = aes(x = chlor))
ggplot(data = CB_chloro, aes(x = year, y=chlor, color = "blue"))
