[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/HUOoSZXh)
# Assignment 1 (R group)

> Analysis of the Collatz Conjecture

- [Assignment questions](ASSIGNMENT.md) 
- Please also read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for specific
submission instructions and marking rubric.

### Task 1: Generating the Collatz Conjecture
Firstly, we load the necessary libraries

```
library(tidyverse)
library(tibble)
library(dplyr)
```

Next, we create a function of the Collatz Conjecture iteration sequence called `gen_collatz` by developing a  `collatz_first` function to obtain the following number in the sequence.

```
# Set the functions

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
```

We can then apply the function `gen_collatz` to starting integers ranging from 1-10,000 and store the results of the sequence in a tibble, along with other information such as the length of the sequence, parity (odd or even) and the maximum value in the sequence.

```
# Apply function to all integers from 1-10,000 and store in a tibble
start <- 1:10000

collatz_df <- tibble(start = integer(0),
                     seq=list(),
                     length= length(0),
                     parity= if ((0)%%2==0) {
                       print("Even")}
                     else {
                       print ("Odd")},
                     max_val= max((0), na.rm=FALSE))

for (i in 1:10000) {
  collatz_seq <- gen_collatz(i)
  if (!is.null(collatz_seq)) {
    collatz_df <- add_row(collatz_df,
                          start = i,
                          seq = list(collatz_seq),
                          length = length(collatz_seq),
                          parity= if ((i)%%2==0) {
                            print("Even")}
                          else {
                            print ("Odd")},
                          max_val= max((collatz_seq), na.rm = FALSE))
  }
 
}

print(i)

collatz_df
```

### Task 3: Investing "backtracking" in sequences
Backtracking is when a sequence reaches a value that is less than the starting integer, but then increases again above the starting integer at least once
before reaching 1.

# Introducing a function that can detect if backtracking in the sequence is present

```
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

backtracks_df <- collatz_df %>%
  rowwise() %>%
  mutate(backtrack = list(backtrack_present(seq, start)))%>%
  filter(backtrack==TRUE) %>%
  select(!backtrack)

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
```
  
First, we introduce a function that can detect if there are any backtracking present in the sequence with [backtrack_present]. 
With the [backtrack_present] function, we apply it into the sequence and filter collatz_df to get the 
data frame with sequences where backtracking is present with [backtracks_df].

Next, we find the frequently occuring number of times the sequence goes above the starting integer by finding the mode
with [mode_above_starting_integer]
  

#### Contribution declaration

## Task 1 
@suriyna
@syirahomar
@AmeliaElam

## Task 2
### Qn 1 - @syirahomar
         - @AmeliaElam
         
### Qn 2 - @AmeliaElam
         - @suriyna
         
### Qn 3 - @syirahomar
         - @suriyna
         
## Task 3
@AmeliaElam

## Task 4
@suriyna

## Task 5
@suriyna

## Task 6
@AmeliaElam

README
@syirahomar