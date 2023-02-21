#install.packages("readr")
#library(readr)
# Reading the contents of TSV file using read_tsv() method
#df<-readr::read_tsv("C:\\Users\\~\\Downloads\\weekly_housing_market_most_recent.tsv")
#print(df)
#housing_df <- read.csv("~/Downloads/city_market_tracker.tsv000", sep = "\t", stringsAsFactors = FALSE)
# IGNORE CODE ABOVE


library("ggplot2")
library("tidyverse")
library("plotly")
library("dplyr")

my_df <- read.csv("~/Downloads/RRVRUSQ156N.csv")
my_slice <- my_df %>%
  filter(DATE >= "2013-01-01")

Date <- my_slice$DATE
Percent <- my_slice$RRVRUSQ156N
Year <- as.Date(Date)
ggplot(data = my_slice, aes(x = Year, y = Percent, group = 1)) +
  geom_line(color = "red") +
  geom_point() +
  ggtitle("Rental Vacancy Rate in the US Over 10 Years") +
  scale_x_date(date_labels="%Y", date_breaks  = "1 year") 

# The data visualization shown above is taken from a well known data collecting 
# group called FRED(https://fred.stlouisfed.org/).They provide national economic 
# data as well as interactive visualization of said data. For this chart, we decided
# to focus on data collected since the mid-1900s up until the current day on rental
# vacancy rates in the United states. We decided to only focus on the  
# data collected within the last 10 years for the sake of relevancy in our analysis.
# The data seems to show a somewhat linear and negative trend across time. We can
# pick out particular points and analyze e.g. in the beginning of 2020 the national
# vacancy rate was 6.3% while at the beginning of 2013 it was closer to 9%. While 
# the implications if this data may not be immediately obvious, rental vacancy rates
# influence the market heavily. Lower vacancy rates correlate to more expensive 
# housing. The next steps for this data analysis is to find data that shows the 
# demographics of individuals renting and purchasing housing.