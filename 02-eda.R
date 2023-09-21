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
  
#sum(top10longest)

# 2. Finding out which starting integer produces a sequence that reaches the highest maximum value

max_val_int <- collatz_df %>%
  select(c(start,length)) %>%
  arrange(desc(length)) %>% # sorting in descending order
  head(1)

# 3. Getting the average length and standard deviation of the sequence for even starting integers compared to odd ones?





