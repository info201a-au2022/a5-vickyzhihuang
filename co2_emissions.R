library(dplyr)
library(shiny)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv",
                     stringsAsFactors = F)

max_co2_per_capita <- co2_data %>% 
  filter(year == 2021) %>% 
  filter(co2_per_capita == max(co2_per_capita, na.rm = T)) %>% 
  pull(co2_per_capita)

max_co2_growth_abs <- co2_data %>% 
  filter(year == 2021) %>% 
  filter(co2_growth_abs == max(co2_growth_abs, na.rm = T)) %>% 
  pull(co2_growth_abs)

max_co2_growth_prct <- co2_data %>% 
  filter(year == 2021) %>% 
  filter(co2_growth_prct == max(co2_growth_prct, na.rm = T)) %>% 
  pull(co2_growth_prct)

