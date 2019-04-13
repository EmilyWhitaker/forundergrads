library(tidyverse)
library(lubridate)
library(ggplot2)

## manipulate each data sheet, merge them together then analyze? find epi, meta, and hypo, 
##facet wrap from depths

#SL_snowlight <-
#  SL_snowlight %>%
#  mutate(
#    dpth= cut(depth,
#              breaks =  c(-Inf, 4, 14, Inf),
#              labels =  c("epi", "meta", "hypo") 
#    )
#  )

glimse(SL_snowlight)

#sp_ice <- 
#  sp_ice %>%
#  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

#glimpse(CL_o2_light)

ggplot(data = SL_snowlight, mapping = aes(x = avsnow, y = totice)) + 
  geom_point(aes(color= whiteice)) +
  facet_wrap(dpth)

#ggplot(data = CL_o2_light, mapping = aes(x = o2, y = light)) + 
#  geom_point(aes(color= dpth))





SL_chloro
SL_02light
combo <- merge( SL_02light, SL_chloro, by= "sampledate")
combo<- 
  comborematered %>%
  mutate(
    
  )

