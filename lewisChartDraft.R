library("tidyverse")
library("ggplot2")
library("stringr")
library("dplyr")

cities_df <- read.csv("cities.csv", stringsAsFactors = FALSE)

cities_df <- cities_df %>% 
  mutate(month = as.Date(period_begin))

# find Seattle data

seattle_df <- cities_df %>%
  filter(city == "Seattle", na.rm = TRUE)

seattle_df <- seattle_df %>% 
  arrange(month)

# compute using avg_sale_to_list over months for Seattle using lag

seattle_df <- seattle_df %>%
  mutate(avg_sale_to_list_lagged = avg_sale_to_list / lag(avg_sale_to_list, 1))

# plot avg_sale_to_list over months for seattle

ggplot(seattle_df, aes(month, avg_sale_to_list)) +
  geom_line() +
  labs(title = "Seattle Housing Market", x = "Month", y = "Avg Sale to List Ratio")

min_wage_data <- read.csv("min_wage_data.csv", stringsAsFactors = FALSE)

us_cities_demographics <- read.csv("us-cities-demographics.csv", stringsAsFactors = FALSE)

min_wage_data <- min_wage_data %>% 
  select(Year, State, State.Minimum.Wage.2020.Dollars, Federal.Minimum.Wage.2020.Dollars) %>%
  filter(Year >= "2017")

cities_df <- cities_df %>% 
  mutate(Year = as.numeric(format(month, "%Y")))

new_df <- cities_df %>% 
  left_join(min_wage_data, by = "Year")


new_df <- new_df %>% 
  mutate(Year = as.Date(paste0(Year, "-01-01")))

new_df <- new_df %>%
  arrange(Year)



