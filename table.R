master_table <- merge(maindf, my_df, Cities)
colnames(master_table)[5] = "Vacancy Rate"
colnames(master_table)[3] = "Days on market period"
colnames(master_table)[4] = "Vacancy Rate 6 month period start"

master_table <- master_table %>% summarise(region, days = round(days,1), master_table[3],master_table[4],master_table[5])
