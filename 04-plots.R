# Task 4

# Load ggplot library
library(ggplot2)

# 1. Scatterplot of starting integers and sequence length

# Use data frame from task 2 for the top 10 starting integer with longest lengths
top10longest

# Create scatterplot and identify the top 10 starting integers on the plot
ggplot(collatz_df, aes(x = start,
                       y = length,
                       label = ifelse(start %in% top10longest[start], as.character(start),""))) +
  geom_point() +
  geom_text(vjust = -0.5, hjust = -0.5) +
  labs(x = "Starting Integer",
       y = "Sequence Length",
       title = "Starting integer and Sequence Length")

# 2. Scatterplot of starting integers and highest value reached in the sequence

# Create data frame of top 10 starting integers with highest value
top10highest <- collatz_df %>%
  arrange(desc(max_val)) %>% # sorting in descending order
  head(10) %>%
  select(start, max_val)

# Create scatterplot and highlight the top 10 starting integers on the plot
ggplot(collatz_df, aes(x = start,         
                       y = max_val)) +  
  geom_point() +  
  geom_point(data = top10highest, aes(col="red")) +
labs( x = "Starting integer",      
      y = "Highest value reached in the sequence",    
      title = "Starting integer and highest value reached in the sequence")

# 3. Boxplot comparing the distributions of sequence lengths for even and odd starting integers

ggplot(collatz_df, aes(x = parity,
                       y = length)) +
  geom_boxplot()

# There are outliers present in the boxplot distribution of the odd starting integers