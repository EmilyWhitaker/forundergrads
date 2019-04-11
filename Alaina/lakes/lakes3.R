library(tidyverse)
library(dplyr)
library(viridisLite)
library(lubridate)

lakeNM = 'SL'
minDepthEpi = 0
maxDepthEpi = 6
minDepthHypo = 30
maxDepthHypo = 35
var = 'cl'

var1 = c('ph','alk','dic','tic','doc','toc','no3no2','no2','nh4','totnf','totnuf','totpf','totpuf','drsif','brsif','brsiuf','tpm','no3no2_sloh','nh4_sloh','kjdl_n_sloh','totpuf_sloh','drp_sloh','drsif_sloh')
var2 = c('wtemp','o2sat')
var3 = c('cl','so4','ca','mg','na','k','fe','mn','cond')

for (var in c(var1,var2,var3)) {
  nutrients = read.csv('ntl1_v5.csv',stringsAsFactors = F) # Nutrients
  ions = read.csv('ntl2_v5.csv',stringsAsFactors = F) # Ions
  temp = read.csv('ntl29_v5.csv',stringsAsFactors = F) # Temp and Oxygen 

SL_snowlight