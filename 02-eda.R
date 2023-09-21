# Task 2

# 1. Finding the top 10 starting integers that produce the longest sequences

# sorting length in descending order
sorted_length_descending <- arrange(collatz_df, desc(length))

# top 10 starting integers with longest sequence
top10longest <- head(sorted_length_descending, 10)

# view the top 10 starting integers with longest sequence
top10longest
