library(tidyverse)
library(lubridate)

SL_o2light <-
  SL_o2light %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )

##need method to spilt month wise
#sp_ice <- 
#  sp_ice %>%
#  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

ggplot(data = SL_o2light, mapping = aes(x = o2, y = light)) + 
  geom_point(aes(color= dpth)) +
  facet_wrap("dpth")

#ggplot(data = SL_o2light, mapping = aes(x = month?, y = light)) + 
#  geom_point(aes(color= dpth)) +
#  facet_wrap("dpth")
