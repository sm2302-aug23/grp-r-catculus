# Task 2

library(tidyverse)
library(dplyr)

# 1. Finding the top 10 starting integers that produce the longest sequences

top10longest <- collatz_df %>%
  arrange(desc(length)) %>% # sorting in descending order
  head(10) # show only top 10 of the sorted desc. order
