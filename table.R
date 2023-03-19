library(dplyr)
library(kableExtra)

kyle_summary <- read.csv("kyle_summary_df.csv", stringsAsFactors = FALSE)
state_averages <- read.csv("state_averages.csv", stringsAsFactors = FALSE)
joseph_summary <- read.csv("joseph_summary.csv", stringsAsFactors = FALSE)

# Arrange data
state_averages <- state_averages %>% arrange(desc(avg_diff_ratio))
joseph_summary <- joseph_summary %>% arrange(desc(RRVRUSQ156N))
kyle_summary <- kyle_summary %>% arrange(desc(days))


# Round data
kyle_summary$days <- round(kyle_summary$days, 2)

state_averages$median_ppsf_avg <- round(state_averages$median_ppsf_avg, 2)
state_averages$median_list_ppsf_avg <- round(state_averages$median_list_ppsf_avg, 2)
state_averages$avg_diff_ratio <- round(state_averages$avg_diff_ratio, 2)
state_averages$avg_homes_sold <- round(state_averages$avg_homes_sold, 2)

# Rename columns
colnames(joseph_summary)[colnames(joseph_summary) == "RRVRUSQ156N"] <- "Rental Vanacancy Rate Percentage"
colnames(joseph_summary)[colnames(joseph_summary) == "DATE"] <- "Date"

colnames(state_averages)[colnames(state_averages) == "median_ppsf_avg"] <- "Median Price Per Square Foot Average"
colnames(state_averages)[colnames(state_averages) == "median_list_ppsf_avg"] <- "Median List Price Per Square Foot Average"
colnames(state_averages)[colnames(state_averages) == "avg_diff_ratio"] <- "Average List to Sale Difference Ratio"
colnames(state_averages)[colnames(state_averages) == "avg_homes_sold"] <- "Average Homes Sold"
colnames(state_averages)[colnames(state_averages) == "state"] <- "State"

colnames(kyle_summary)[colnames(kyle_summary) == "region"] <- "Region"
colnames(kyle_summary)[colnames(kyle_summary) == "days"] <- "Days"
colnames(kyle_summary)[colnames(kyle_summary) == "year"] <- "Year"

# Remove X column
kyle_summary <- kyle_summary %>% select(-X)
state_averages <- state_averages %>% select(-X)
joseph_summary <- joseph_summary %>% select(-X)


# Tables
#-------------------------
head(kyle_summary[c("Region","Days", "Year")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
#-------------------------
head(state_averages[c("State", "Median Price Per Square Foot Average","Median List Price Per Square Foot Average", "Average List to Sale Difference Ratio","Average Homes Sold")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
#-------------------------------
head(joseph_summary[c("Date","Rental Vanacancy Rate Percentage")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
