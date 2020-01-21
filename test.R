## Dependencies
library(RCurl); library(xml2); library(rvest); library(jsonlite); library(foreach)
library(lubridate)
library(tidyverse) ## -- specifically: stringr, readr, tidyr, and dplyr

## Source scraper functions from GitHub
devtools::source_url("https://raw.githubusercontent.com/evolvingwild/evolving-hockey/master/EH_scrape_functions.R")

## Scrape games
pbp_scrape <- sc.scrape_pbp(games = c("2018020001", "2018020002"))

pbp_scrape$pbp_base

shots <- pbp_scrape$pbp_base %>%
  filter(event_type == "SHOT", game_id == 2018020001)

p <- ggplot(data = shots, aes(x = coords_x, y = coords_y, colour = event_team)) +
  geom_point()

p
