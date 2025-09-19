install.packages("tidyverse")
install.packages("readxl")
library(tidyverse)
library(readxl)
trips_2019 <- read_excel("C:/Users/Ravz/Desktop/Cyclistic_DataAnalysis/Divvy_Trips_2019_Q1.xlsx", sheet = "Divvy_Trips_2019_Q1")
head(trips_2019)
colnames(trips_2019)
str(trips_2019)
trips_2019 <- trips_2019 %>% mutate(year = 2019)
colnames(trips_2019)
trips_2019 <- trips_2019 %>% mutate(tripduration = as.integer(round(tripduration,0)))
head(trips_2019$tripduration, 10)
summary(trips_2019)
duplicated(trips_2019$trip_id)
duplicate_id <- duplicated(trips_2019$trip_id)
head(duplicate_id)
trips_2019 <- trips_2019 %>% 
  filter(start_time >= as.POSIXct("2019-01-01"),
         start_time < as.POSIXct("2019-04-01")) %>% 
  filter(end_time >= start_time) %>% 
  filter(end_time < as.POSIXct("2019-04-02"))
summary(trips_2019$end_time)
trips_2019 <- trips_2019 %>% 
  filter(tripduration <= 36000)
summary(trips_2019$tripduration)
trips_2019 <- trips_2019 %>% 
  mutate(age = 2019 - birthyear)
summary(trips_2019$age)
trips_2019 <- trips_2019 %>% 
  filter(age < 90)
summary(trips_2019$age)
colSums(is.na(trips_2019))
trips_2019 <- trips_2019 %>% 
  filter(!is.na(gender))
sum(duplicated(trips_2019))

saveRDS(trips_2019, "cleaned_trips_2019")













