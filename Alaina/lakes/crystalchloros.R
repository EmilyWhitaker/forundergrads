library(tidyverse)
library(lubridate)
library(ggplot2)

CR_chloro <-
  CR_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )



CR_chloro_date <- 
  CR_chloro %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")


CR_chloro_date <-
  CR_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )

cmc <- ggplot(data = CR_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  facet_grid(dpth ~ .)+
  ylim(0, 75)+
  ylab("Chlorophyll a concentration mg/l")+
  ggtitle("Crystal Lake Monthly Chloros")

cmc

cmc + ylim(-10, 75)

## get that line with averages for crystal



#ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor, fill= chlor)) + 
#  geom_boxplot(aes(color= dpth)) +
#  facet_wrap("dpth")+
#  ggtitle("Sparkling Monthly Chloros")+



#ggplot(data = CL_o2_light, mapping = aes(x = o2, y = light)) + 
#  geom_point(aes(color= dpth))





#SL_chloro
#SL_02light
#combo <- merge( SL_02light, SL_chloro, by= "sampledate")
#combo<- 
#  comborematered %>%
#  mutate(

#  )

## month <- factor(month, levels =month)

#ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor)) + 
#  geom_point(aes(color= dpth)) +
#  facet_wrap("dpth")

#ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor)) + 
#  geom_point(aes(color= dpth)) +
#  facet_wrap("dpth")+
#  ggtitle("Sparkling Monthly Chloros")

