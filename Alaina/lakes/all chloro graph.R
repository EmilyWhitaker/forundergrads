#Join CL and SL chloros
library(tidyverse)
library(lubridate)
library(ggplot2)

SL_chloro <-
  SL_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14.9, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )



SL_chloro_date <- 
  SL_chloro %>%
  separate(sampledate, c("month", "day", "year"), sep= "/", extra = "merge")


SL_chloro_date <-
  SL_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )




BM_chloro <-
  BM_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 12, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )

BM_chloro_date <- 
  BM_chloro %>%
  separate(sampledate, c("year", "month", "day"), sep= "-", extra = "merge")


BM_chloro_date <-
  BM_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )

TR_chloro <-
  TR_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 2, 21, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )

TR_chloro_date <- 
  TR_chloro %>%
  separate(sampledate, c("year", "month", "day"), sep= "-", extra = "merge")


TR_chloro_date <-
  TR_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )


AL_chloro <-
  AL_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 2, 6, Inf),
              labels =  c("epi", "meta", "hypo") 
    )
  )

AL_chloro_date <- 
  AL_chloro %>%
  separate(sampledate, c("year", "month", "day"), sep= "-", extra = "merge")


AL_chloro_date <-
  AL_chloro_date %>%
  mutate(
    month = as.numeric(month)
  )



joint_chloros <- full_join(CR_chloro_date, SL_chloro_date)
join2<- full_join(joint_chloros,  BM_chloro_date)
join3<- full_join(join2, AL_chloro_date)
join4<- full_join(join3, TR_chloro_date)

xyz <- ggplot(data = join2, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  ylim(0,80) +
  facet_grid(dpth ~ .)+
  ylab("Chlorophyll a concentration mg/l")+  
  ggtitle("Monthly Chlorophyll Levels")

xyz

xyz <- ggplot(data = join4, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(fill = lakeid), shape = 21, alpha = 0.7) +
  ylim(0,80) +
  ylab("Chlorophyll a concentration mg/l")+  
  ggtitle("Monthly Chlorophyll Levels")

xyz