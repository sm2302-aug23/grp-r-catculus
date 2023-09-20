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
  
  if (n <= 0) {
    stop("Number should be a positive integer > 0")
  }
  
  while (n>1) {
    
  if (n %% 2 == 0) {
    n <- n/2 }
  
  else {
    n <- 3 * n + 1 }
  }
}

# gen_collatz(5)
# gen_collatz(27)

# Apply function to all integers from 1-10,000 and store in a tibble
start <- 1:10000

n_total <- n <- 36 #any random number
while (n !=1) {
  n <- gen_collatz(n)
  n_total <- c(n_total, n)
}

n_total

