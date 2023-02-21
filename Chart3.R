setwd("/Users/kyle/INFO201")
library("ggplot2")
library("tidyverse")
library("viridis")
library("dplyr")

top_20_cities <- c("New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", "Phillidelphia, PA", "Pheonix, AZ", "San Antonio, TX", "San Diego, CA", "Dallas, TX", "San Jose, CA", "Austin, TX", "Jacksonville, FL", "San Francisco, CA", "Indianapolis, IN", "Columbus, OH", "Fort Worth, TX", "Charlotte, NC", "Seattle, WA", "Denver, CO", "El Paso, TX")
newdf <- read.csv("kyledf.csv", stringsAsFactors = F)
dfone <- newdf %>% filter(str_detect(period_begin, "2013|2014|2015|2016|2017"))
dftwo <- newdf %>% filter(str_detect(period_begin, "2018|2019|2020|2021|2022"))

dfone <- dfone %>% group_by(region) %>% summarise(days = mean(median_dom, na.rm = T))

dftwo <- dftwo %>% group_by(region) %>% summarise(days = mean(median_dom, na.rm = T))

maindf <- dfone %>% full_join(dftwo)
maindf$year <- c('2013-2017', '2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2013-2017','2018-2022', '2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022','2018-2022')

specie <- c(rep("NYC" , 2) , rep("LA" , 2) , rep("Chicago" , 2) , rep("Houston" , 2) , rep("Philly" , 2) , rep("Pheonix" , 2) , rep("San Antonio" , 2) , rep("San Diego" , 2),rep("Dallas" , 2) , rep("San Jose" , 2) , rep("Austin" , 2) , rep("Jacksonville" , 2), rep("San Francisco" , 2) , rep("Fort Worth" , 2) , rep("Charlotte" , 2) , rep("Seattle" , 2), rep("Denver" , 2) , rep("El Paso" , 2))
ggplot(maindf, aes(x=region, y=days, fill=year)) +
  geom_bar(stat="identity", position=position_dodge()) + coord_flip()

