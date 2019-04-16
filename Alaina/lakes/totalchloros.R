library(tidyverse)
library(lubridate)
library(ggplot2)

CL_chloro <-
  CL_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 7, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )



CL_chloro_date <- 
  CL_chloro %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")


CL_chloro_date <-
  CL_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )


abc <- ggplot(data = CL_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  facet_grid(dpth ~ .)+
  ylim(0, 75)+
  ylab("Chlorophyll a concentration mg/l")+  
  ggtitle("Crystal Lake Monthly Chloros")

abc 

amc <- ggplot(data = CL_chloro_date, mapping = aes(x = month, y = chlor))+
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  facet_grid(dpth ~ .)+
  ggtitle("Crystal Lake Monthly Chloros")

amc + ylab(Chlorophyll a ug/l)
