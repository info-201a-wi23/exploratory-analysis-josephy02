df1 <- read.csv("df1.csv", stringsAsFactors = FALSE)
df2 <- read.csv("df2.csv", stringsAsFactors = FALSE)
df3 <- read.csv("df3.csv", stringsAsFactors = FALSE)
df4 <- read.csv("df4.csv", stringsAsFactors = FALSE)
df5 <- read.csv("df5.csv", stringsAsFactors = FALSE)
df6 <- read.csv("df6.csv", stringsAsFactors = FALSE)

cities <- left_join(df1,df2, by = "city")
cities <- left_join(cities,df3, by = "city")
cities <- left_join(cities,df4, by = "city")
cities <- left_join(cities,df5, by = "city")
cities <- left_join(cities,df6, by = "city")

master_table <- merge(maindf, my_df, cities)
colnames(master_table)[5] = "Vacancy Rate"
colnames(master_table)[3] = "Days on market period"
colnames(master_table)[4] = "Vacancy Rate 6 month period start"

master_table <- master_table %>% summarise(region, days = round(days,1), master_table[3],master_table[4],master_table[5])