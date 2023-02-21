# Author: Lewis Going
library("ggplot2")
library("tidyverse")
library("viridis")

cities <- read.csv("cities.csv", stringsAsFactors = FALSE)

# Function to calculate the state averages
calculate_state_averages <- function(cities) {
  cities %>% 
    group_by(state) %>% 
    summarise(median_ppsf_avg = median(median_ppsf, na.rm = TRUE),
              median_list_ppsf_avg = median(median_list_ppsf, na.rm = TRUE)) %>% 
    mutate(avg_diff_ratio = median_list_ppsf_avg / median_ppsf_avg) 
}

state_averages <- calculate_state_averages(cities)

# Function to calculate the average homes sold by state
average_homes_sold_by_state <- function(data) {
  data %>% 
    group_by(state) %>% 
    summarise(avg_homes_sold = mean(homes_sold, na.rm = TRUE))
}

homes_sold_avg <- average_homes_sold_by_state(cities)

state_averages <- left_join(state_averages, homes_sold_avg, by = "state")

state_averages <- state_averages[!state_averages$state == "Columbia",]

# Scatter plot with regression line
ggplot(state_averages, 
       aes(x = avg_diff_ratio, 
           y = avg_homes_sold)) +
  geom_point(aes(colour = state),
             size = 3) +
  geom_smooth(method="lm") +
  labs(x = "List vs sale ppsf ratio",
       y = "Average homes sold",
       title = "Correlation between homes sales and list vs sale price",
       subtitle = "Average ratio between list and sale price-per-square-foot") +
  scale_color_viridis(discrete = T) +
  theme_minimal() +
  theme(text = element_text(size=16))
