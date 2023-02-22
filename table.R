library(kableExtra)

kyle_summary <- read.csv("kyle_summary_df.csv", stringsAsFactors = FALSE)
state_averages <- read.csv("state_averages.csv", stringsAsFactors = FALSE)
joseph_summary <- read.csv("joseph_summary.csv", stringsAsFactors = FALSE)

kyle_summary <- kyle_summary %>% select(-X)
state_averages <- state_averages %>% select(-X)
joseph_summary <- joseph_summary %>% select(-X)

head(kyle_summary[c("X","region","days", "year")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
#-------------------------
head(state_averages[c("X","state", "median_ppsf_avg","median_list_ppsf_avg","median_list_ppsf_avg", "avg_diff_ratio","avg_homes_sold")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
#-------------------------------
head(joseph_summary[c("X","DATE","RRVRUSQ156N")])%>%
  kable() %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
