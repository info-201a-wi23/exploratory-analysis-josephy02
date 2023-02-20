x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_point(aes(x=x_values, y = y_values))




install.packages("deplyr")
library("tidyverse")
library("deplyr")
cities <- read.csv("cities.csv",stringsAsFactors = FALSE)


one <- select(df1, city,period_begin, period_end, property_type)
write.csv(one, "C:\Users\arafi\Desktop\INFO201\exploratory-analysis-josephy02", row.names=FALSE)


