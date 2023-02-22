# Author: Lewis Going
library("ggplot2")
library("tidyverse")
library("viridis")

state_averages <- read.csv("state_averages.csv", stringsAsFactors = FALSE)

# Scatter plot with regression line
ggplot(state_averages, 
       aes(x = avg_diff_ratio, 
           y = avg_homes_sold)) +
  geom_point(aes(colour = state),
             size = 2) +
  geom_smooth(method="lm") +
  labs(x = "List vs sale ppsf ratio",
       y = "Average homes sold",
       title = "Correlation between homes sales and list vs sale price",
       subtitle = "Average ratio between list and sale price-per-square-foot") +
  scale_color_viridis(discrete = T) +
  theme_minimal() +
  theme(text = element_text(size=12))