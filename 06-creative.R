# Task 6 
#Using a histogram to visualize the length of both even and odd starting integers
library(ggplot2)

ggplot(collatz_df, aes(x= length)) +
  geom_histogram(aes(fill=parity),
                 bins=100,
                 alpha=0.7) +
  labs(fill=NULL)
