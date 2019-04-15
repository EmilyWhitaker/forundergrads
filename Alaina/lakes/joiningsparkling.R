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

# plot one
jpc <- ggplot(data = join_o2_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(color= dpth)) +
  facet_grid(dpth ~ .)+
  ggtitle("Sparkling Monthly Chloros")
View(jpc)

#changing plot 1
jpc + ylim(-1, 75)
jpc + xlim(1,12)

#plot2
lpc <- ggplot(data = join_o2_chloro_date, mapping = aes(x = month, y = chlor)) + 
  geom_point(aes(color= light)) +
  facet_grid(dpth ~ .)+
  ggtitle("Sparkling Monthly Chloros with Light")
view(lpc)
lpc + ylim(-1, 75)
lpc + xlim(1,12)

jpc
lpc

