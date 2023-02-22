kyle_summary <- read.csv("kyle_summary_df.csv", stringsAsFactors = FALSE)

state_averages <- read.csv("state_averages.csv", stringsAsFactors = FALSE)

joseph_summary <- read.csv("joseph_summary.csv", stringsAsFactors = FALSE)

main_df <- left_join(kyle_summary, state_averages, by = "state")

main_df <- left_join(main_df, joseph_summary, by = "state")