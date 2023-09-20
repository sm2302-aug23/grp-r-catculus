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

gen_collatz <- function(n) {
  
  # check if n is a positive integer
  if (n <= 0) {
    stop("Number should be a positive integer > 0")
  }
  
  while (n>1) {
  
  # if n is even, the next term is one half of the previous term.  
  if (n %% 2 == 0) {
    return(n/2) }
  
  # if n is odd, the next term is 3 times the previous term plus 1.  
  else {
    return(3 * n + 1) }
  }
}

#gen_collatz(5)
# gen_collatz(27)

# Apply function to all integers from 1-10,000 and store in a tibble
start <- 1:10000

n_total <- n <- 36 #any random number
while (n !=1) {
  n <- gen_collatz(n)
  n_total <- c(n_total, n)
}

n_total <- seq

collatz_df <- tibble(start = integer(0), seq=list(), length= length(0))

for (i in 1:10000) {
  collatz_seq <- gen_collatz(i)
  if (!is.null(collatz_seq)) {
    collatz_df <- add_row(collatz_df, start=i, seq=list(collatz_seq), length=length(list(collatz_seq)))
  }

}

collatz_df
