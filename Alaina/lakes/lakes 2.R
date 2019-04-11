library(tidyverse)
library(lubridate)

CL_o2_light <-
  CL_o2_light %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )


#sp_ice <- 
#  sp_ice %>%
#  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

glimpse(CL_o2_light)

ggplot(data = CL_o2_light, mapping = aes(x = o2, y = light)) + 
  geom_point(aes(color= dpth))

ggplot(data = CL_o2_light, mapping = aes(x = o2, y = light)) + 
  geom_point(aes(color= dpth))