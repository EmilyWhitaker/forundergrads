##merging data##

#want to use dplyer join
#joining 
join_o2_chloro <- inner_join(SL_02light, SL_chloro)

library(tidyverse)
library(lubridate)
library(ggplot2)

#seperating month day year
join_o2_chloro_date <- 
  join_o2_chloro %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")

#making month numberic 
join_o2_chloro_date <-
  join_o2_chloro_date %>%
  mutate(
    month = as.numeric(month)
    )

join_o2_chloro_date <-
  join_o2_chloro_date %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )


# plot one
jpc <- ggplot(data = join_o2_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(color = "#00AFBB"),shape = 21, alpha = 0.7) +
  facet_grid(dpth ~ .)+
  ylim(0, 75)+
  ylab("Chlorophyll a concentration mg/l")+  
  ggtitle("Sparkling Lake Monthly Chloros")

jpc 

geom_point(aes(fill = lakeid), color = "#00AFBB")
color = "#00AFBB", aes(fill = lakeid)

cmc <- ggplot(data = CR_chloro_date, mapping = aes(x = month, y = chlor), col = blues9) + 
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  facet_grid(dpth ~ .)+
  ylim(0, 75)+
  ylab("Chlorophyll a concentration mg/l")+
  ggtitle("Crystal Lake Monthly Chloros")

cmc

#changing plot 1
jpc + ylim(-1, 75)
jpc + xlim(1,12)

#plot2
lpc <- ggplot(data = join_o2_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(color= light)) +
  facet_grid(dpth ~ .)+
  ggtitle("Sparkling Monthly Chloros with Light")

lpc + ylim(-1, 75)
lpc + xlim(1,12)

jpc
lpc

## add in ice and snow

