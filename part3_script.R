# lab 4 part Collado

library(tidyverse)
library(janitor)
library(here)

disease_data <- read_csv(here::here("Data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k=death_rate_per_100_000)


db_sub <- disease_data %>% 
  filter(country_name %in% c("United State", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group=="0-6 days", sex== "Both")

#Graph

ggplot(data=db_sub, aes(x= year, y= deaths_per_100k)) +
  geom_line(aes(color=country_name))

ggsave(here::here("Final graphs", "disease_graph.png"))

