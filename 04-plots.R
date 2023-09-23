# Task 4

# Load ggplot library
library(ggplot2)

# 1. Scatterplot of starting integers and sequence length
ggplot(collatz_df, aes(x = start,
                       y = length)) +
  geom_point() +
  labs(x = "Starting integer",
       y = "Sequence length",
       title = "Starting integer and sequence length")
# Identify the top 10 starting integers on the plot


# 2. Scatterplot of starting integers and highest value reached in the sequence
ggplot(collatz_df, aes(x = start,
                       y = max_val)) +
  geom_point() +
  labs( x = "Starting integer",
        y = "Highest value reached in the sequence",
        title = "Starting integer and highest value reached in the sequence")
# Highlight the top 10 starting integers in a different color


# 3. Boxplot comparing the distributions of sequence lengths for even and odd starting integers
ggplot(collatz_df, aes(x = parity,
                       y = length)) +
  geom_boxplot()

# There are outliers present in the boxplot distribution of the odd starting integers