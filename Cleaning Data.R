# Load tidyverse
library(tidyverse)

col_types_vb <- cols(
  circuit = col_character(),
  tournament = col_character(),
  country = col_character(),
  year = col_double(),
  date = col_date(format = ""),
  gender = col_character(),
  match_num = col_double(),
  w_player1 = col_character(),
  w_p1_birthdate = col_date(format = ""),
  w_p1_age = col_double(),
  w_p1_hgt = col_double(),
  w_p1_country = col_character(),
  w_player2 = col_character(),
  w_p2_birthdate = col_date(format = ""),
  w_p2_age = col_double(),
  w_p2_hgt = col_double(),
  w_p2_country = col_character(),
  w_rank = col_character(),
  l_player1 = col_character(),
  l_p1_birthdate = col_date(format = ""),
  l_p1_age = col_double(),
  l_p1_hgt = col_double(),
  l_p1_country = col_character(),
  l_player2 = col_character(),
  l_p2_birthdate = col_date(format = ""),
  l_p2_age = col_double(),
  l_p2_hgt = col_double(),
  l_p2_country = col_character(),
  l_rank = col_character(),
  score = col_character(),
  duration = col_time(format = ""),
  bracket = col_character(),
  round = col_character(),
  w_p1_tot_attacks = col_double(),
  w_p1_tot_kills = col_double(),
  w_p1_tot_errors = col_double(),
  w_p1_tot_hitpct = col_double(),
  w_p1_tot_aces = col_double(),
  w_p1_tot_serve_errors = col_double(),
  w_p1_tot_blocks = col_double(),
  w_p1_tot_digs = col_double(),
  w_p2_tot_attacks = col_double(),
  w_p2_tot_kills = col_double(),
  w_p2_tot_errors = col_double(),
  w_p2_tot_hitpct = col_double(),
  w_p2_tot_aces = col_double(),
  w_p2_tot_serve_errors = col_double(),
  w_p2_tot_blocks = col_double(),
  w_p2_tot_digs = col_double(),
  l_p1_tot_attacks = col_double(),
  l_p1_tot_kills = col_double(),
  l_p1_tot_errors = col_double(),
  l_p1_tot_hitpct = col_double(),
  l_p1_tot_aces = col_double(),
  l_p1_tot_serve_errors = col_double(),
  l_p1_tot_blocks = col_double(),
  l_p1_tot_digs = col_double(),
  l_p2_tot_attacks = col_double(),
  l_p2_tot_kills = col_double(),
  l_p2_tot_errors = col_double(),
  l_p2_tot_hitpct = col_double(),
  l_p2_tot_aces = col_double(),
  l_p2_tot_serve_errors = col_double(),
  l_p2_tot_blocks = col_double(),
  l_p2_tot_digs = col_double()
)

raw_df <- c("https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_archive_2000_to_2017_v2.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20170729_to_20170912.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20170913_to_20180314.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20180315_to_20180821.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20180822_to_20190409.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20190410_to_20190818.csv",
            "https://raw.githubusercontent.com/BigTimeStats/beach-volleyball/master/data/match_update_20190818_to_20190902.csv") %>% 
  map_dfr(read_csv, col_types = col_types_vb)

raw_df %>% 
  skimr::skim()

# Georgios Karamanis noticed that the birthdates are 
# incorrect for anyone born before 1970 (off by 100 years)
clean_df <- mutate_at(
  raw_df,
  vars(contains("birthdate")),
  list(~ if_else(. >= as.Date("2020-01-01"),
                 . - lubridate::years(100),
                 .
  ))
)

write_csv(clean_df, "2020/2020-05-19/vb_matches.csv")
