# Task 3

#1. Filtering collatz_df to get starting integers which has backtracking in their sequences

#Introducing a function that can detect if backtracking in the sequence is present
backtrack_present <- function(seq,start) {
  for (i in seq) {
    if (i < start) {
      less_than_start <-  TRUE
    }
    if (less_than_start & i > start)
      return(TRUE)
  }
  return(FALSE)
}

less_than_start <- TRUE
if (less_than_start & i > start)
  return(TRUE)

#Applying the function into the sequence and filter collatz_df to get dataframe with sequence that has backtracking in it
backtracks_df <- collatz_df %>%
  rowwise() %>%
  mutate(backtrack = list(backtrack_present(seq, start)))%>%
  filter(backtrack==TRUE) %>%
  select(!backtrack)

#2. Getting the most frequently occurring number of times sequences go above their starting integer
# (Finding the mode)
mode_above_starting_integer <- backtracks_df %>%
  as.integer(mode(backtracks_df))
  

#3. Maximum value after the first backtracking in the sequence
max_after_backtrack <- backtracks_df %>%
  arrange(desc(max_val)) %>%
  head(1) %>%
  select(max_val)

#4. Frequency count for even and odd backtracking integers
even_odd_backtrack <- backtracks_df %>%
  count(parity)

        