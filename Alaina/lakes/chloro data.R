library(tidyverse)
library(lubridate)
library(ggplot2)

## manipulate each data sheet, merge them together then analyze? find epi, meta, and hypo, 
##facet wrap from depths

SL_chloro <-
  SL_chloro %>%
  mutate(
    dpth= cut(depth,
              breaks =  c(-Inf, 4, 14, Inf),
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


## month <- factor(month, levels =month)

#ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor)) + 
#  geom_point(aes(color= dpth)) +
#  facet_wrap("dpth")

#ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor)) + 
#  geom_point(aes(color= dpth)) +
#  facet_wrap("dpth")+
#  ggtitle("Sparkling Monthly Chloros")
  
smc <- ggplot(data = SL_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(color= dpth)) +
  facet_grid(dpth ~ .)+
  ggtitle("Sparkling Monthly Chloros")

smc + ylim(-50, 75)
smc + xlim(1,12)



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

