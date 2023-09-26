# Task 5

# One interesting question or pattern about the Collatz conjecture

# What is the most frequent integer that appears in all the sequences combined,
# excluding the number 1?

# In the Collatz conjecture, the most frequent integer that appears in all the
# sequences, excluding the number 1 is 2.

# Examples
gen_collatz(20)
# [1] 20 10  5 16  8  4  2  1

gen_collatz(9)
# [1]  9 28 14  7 22 11 34 17 52 26 13 40 20 10  5 16  8  4  2  1

gen_collatz(48)
# [1] 48 24 12  6  3 10  5 16  8  4  2  1

# For every sequence, the number before the iteration ends at 1 is the number 2.

  # The reason for this is because for every step of the sequence, if the number
  # is odd, the next number is multiplied by 3 and plus 1 (3n+1), which is always
  # even.

  # If the number is even, the next number is divided by 2 (n/2) which may be
  # even or odd. This iteration continues until it reaches the numbers 2 & then 
  # 1.

