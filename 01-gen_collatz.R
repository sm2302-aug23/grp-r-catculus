# Task 1 

# Load the necessary libraries
library(tidyverse)
library(tibble)
library(dplyr)

# Set the functions
is.even <- function(n) {
  if (n %% 2 == 0) TRUE
  else FALSE
}

# is.even(2)
# is.even(5)

collatz_first <- function(n) { # for the first number after the starting integer value
  
  # check if n is a positive integer
  if (n <= 0 || n != as.integer(n)) {
    stop("Number should be a positive integer > 0")
  }
  
  while (n>=1) {
  
  # if n is even, the next term is one half of the previous term.  
  if (n %% 2 == 0) {
    return(n/2) }
  
  # if n is odd, the next term is 3 times the previous term plus 1.  
  else {
    return(3 * n + 1) }
  }
}

# collatz_first(5)
# collatz_first(27)

gen_collatz <- function(input) # for the Collatz sequence as a list
{
  result <- input
  while(input !=1)
  {
    input <- collatz_first(input)
    result <- c(result, input)
  }
  return(result)
}

# gen_collatz(20)
# gen_collatz(36)

# Apply function to all integers from 1-10,000 and store in a tibble
start <- 1:10000

collatz_df <- tibble(start = integer(0), seq=list(), length= length(0), max_val= max((0), na.rm=FALSE))

for (i in 1:10000) {
  collatz_seq <- gen_collatz(i)
  if (!is.null(collatz_seq)) {
    collatz_df <- add_row(collatz_df,
                          start = i,
                          seq = list(collatz_seq),
                          length = length(collatz_seq),
                          max_val= max((collatz_seq), na.rm = FALSE))
  }
  
}

collatz_df
