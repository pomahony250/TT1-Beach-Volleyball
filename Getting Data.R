# Loading skimr

library(skimr)

# Get the Data

vb_matches <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-19/vb_matches.csv', guess_max = 76000)

# Summarising

skimr::skim(vb_matches)
