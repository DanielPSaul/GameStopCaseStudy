library(tidyverse)
library(xml2)
library(tibble)
library(rvest)

### Web Scraping ###
# OpenCritic 2017 
opencritic2017 <- sprintf("https://opencritic.com/browse/all/2017/date?page=%d", 1:84) 

oc2017 <- map(opencritic2017, ~ { 
  doc <- read_html(.x) 
  
  name <- doc %>% 
    html_nodes(".col a") %>% 
    html_text()
  
  platform <- doc %>% 
    html_nodes(".platforms") %>% 
    html_text() 
  
  year_of_release <- "2017" 
  
  critic_score <- doc %>% 
    html_nodes(".score") %>% 
    html_text() 
  
  tibble(Name = name, Platform = platform, Year_of_Release = year_of_release, Critic_Score = critic_score) 
  } 
  ) %>% 
    bind_rows(.id = 'page_no')

# OpenCritic 2018 
opencritic2018 <- sprintf("https://opencritic.com/browse/all/2018/date?page=%d", 1:84) 
oc2018 <- map(opencritic2018, ~ { doc <- read_html(.x) name <- doc %>% html_nodes(".col a") %>% html_text() platform <- doc %>% html_nodes(".platforms") %>% html_text() year_of_release <- "2018" critic_score <- doc %>% html_nodes(".score") %>% html_text() tibble(Name = name, Platform = platform, Year_of_Release = year_of_release, Critic_Score = critic_score) } ) %>% bind_rows(.id = 'page_no')

# OpenCritic 2019 
opencritic2019 <- sprintf("https://opencritic.com/browse/all/2019/date?page=%d", 1:76) 
oc2019 <- map(opencritic2019, ~ { doc <- read_html(.x) name <- doc %>% html_nodes(".col a") %>% html_text() platform <- doc %>% html_nodes(".platforms") %>% html_text() year_of_release <- "2019"

critic_score <- doc %>% html_nodes(".score") %>% html_text() tibble(Name = name, Platform = platform, Year_of_Release = year_of_release, Critic_Score = critic_score) } ) %>% bind_rows(.id = 'page_no')

# OpenCritic 2020 
opencritic2020 <- sprintf("https://opencritic.com/browse/all/2020/date?page=%d", 1:75) 
oc2020 <- map(opencritic2020, ~ { doc <- read_html(.x) name <- doc %>% html_nodes(".col a") %>% html_text() platform <- doc %>% html_nodes(".platforms") %>% html_text() year_of_release <- "2020" critic_score <- doc %>% html_nodes(".score") %>% html_text() tibble(Name = name, Platform = platform, Year_of_Release = year_of_release, Critic_Score = critic_score) } ) %>% bind_rows(.id = 'page_no')