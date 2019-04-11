library(tidyverse)
library(lubridate)


## manipulate each data sheet, merge them together then analyze? find epi, meta, and hypo, 


#SL_snowlight <-
#  SL_snowlight %>%
#  mutate(
#    dpth= cut(depth,
#              breaks =  c(-Inf, 4, 14, Inf),
#              labels =  c("epi", "meta", "hypo") 
#    )
#  )



#sp_ice <- 
#  sp_ice %>%
#  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

#glimpse(CL_o2_light)

ggplot(data = SL_snowlight, mapping = aes(x = avsnow, y = totice)) + 
  geom_point(aes(color= whiteice))

#ggplot(data = CL_o2_light, mapping = aes(x = o2, y = light)) + 
#  geom_point(aes(color= dpth))