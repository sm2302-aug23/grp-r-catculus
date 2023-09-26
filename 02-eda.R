# Task 2

library(tidyverse)
library(dplyr)

# 1. Finding the top 10 starting integers that produce the longest sequences

top10longest <- collatz_df %>%
  select(c(start,length)) %>%
  arrange(desc(length)) %>% # sorting in descending order
  head(10) %>%# show only top 10 of the sorted desc. order
  t() %>%
  head(1)
  
# sum(top10longest)

# 2. Finding the starting integer with highest maximum value

max_val_int <- collatz_df %>%
  select(c(start,max_val)) %>%
  arrange(desc(max_val)) %>% # sorting in descending order
  head(1) %>%
  select(start)

# 3. Getting the average length and standard deviation of the sequence for even starting integers compared to odd ones?

even_odd_mean_sd <- collatz_df %>%
  group_by(parity) %>%
  summarise(
    avg_len = mean(length),
    sd_len = sd(length)
  )
  
even_odd_mean_sd # view the tibble

even_odd_avg_len <- select(even_odd_mean_sd, avg_len) %>%
  t()

even_odd_sd_len <- select(even_odd_mean_sd, sd_len) %>%
  t()