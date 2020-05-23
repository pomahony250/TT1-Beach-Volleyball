# Load Scales

library(scales)

vb_matches %>%
  count(circuit, tournament, date, sort = TRUE)

vb_matches %>%
  count(year)
