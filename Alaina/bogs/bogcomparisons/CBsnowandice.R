library(tidyverse)
library(lubridate)

CB_snow_ice <- 
  CB_snow_ice %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

glimpse(CB_snow_ice)

CB_snow_ice <-
  CB_snow_ice %>%
  mutate(
    year = as.numeric(year)
  )
glimpse(CB_snow_ice)

CB_snow_ice <-
  CB_snow_ice %>%
  mutate(
    yrs= cut(year,
             breaks =  c(-Inf, 10, 80, 90, Inf),
             labels =  c("2000s", "2010s", "1980s","1990s")
    )
  )


ggplot(data = CB_snow_ice, mapping = aes(x = totice, y = avsnow)) + 
  geom_point(aes(color= whiteice))+ 
  facet_wrap("yrs")