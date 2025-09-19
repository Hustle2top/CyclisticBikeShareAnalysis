# Loading the required library & creating data frame for cleaned data
library(tidyverse)
cleaned_data <- readRDS("cleaned_trips_2019")
summary(cleaned_data)

# Extracting day of week, Hour of week & creating time categories
cleaned_data <- cleaned_data %>% 
  mutate(day_of_week = weekdays(start_time),
         hour_of_day = hour(start_time),
         time_category = case_when(
           hour_of_day >= 6 & hour_of_day < 12 ~ "Morning",
           hour_of_day >= 12 & hour_of_day < 18 ~ "Afternoon",
           hour_of_day >= 18 & hour_of_day < 24 ~ "Evening",
           TRUE ~ "Night"))

# Weekly ride pattern analysis
weekly_ride <- cleaned_data %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(
    ride_count = n(),
    avg_duration_min = mean(tripduration) / 60,
    .groups = "drop"
  )

head(weekly_ride, 14)

# Hourly patterns analysis
hourly_ride <- cleaned_data %>% 
  group_by(usertype, hour_of_day) %>% 
  summarise(
    ride_count = n(),
    avg_duration_min = mean(tripduration) / 60,
    .groups = "drop"
  )

print(hourly_ride, n= 48)

# Tine category analysis
time_category_ride <- cleaned_data %>% 
  group_by(usertype, time_category) %>% 
  summarise(
    ride_count = n(),
    avg_duration_min = mean(tripduration) / 60,
    .groups = "drop"
  )

print(time_category_ride, n = 8)

# Ride Duration Analysis
duration_of_ride <- cleaned_data %>% 
  group_by(usertype) %>% 
  summarise(
    ride_count = n(),
    avg_duration_min = mean(tripduration) / 60,
    .groups = "drop"
  )

print(duration_of_ride, n = 3)

# Ride Duration Analysis by time of day
duration_by_timeofday <- cleaned_data %>% 
  group_by(usertype, time_category) %>% 
  summarise(
    avg_duration_min = mean(tripduration) / 60,
    .groups = "drop"
  )

print(duration_by_timeofday, n=8)

# Age analysis
age_analysis <- cleaned_data %>% 
  group_by(usertype) %>% 
  summarise(
    avg_age = mean(age, na.rm = TRUE)
  )

print(age_analysis)

# Age brackets analysis
age_bracket_data <- cleaned_data %>% 
  filter(!is.na(age)) %>% 
  mutate(age_bracket = cut(age,
                           breaks = c(16, 25, 35, 45, 55, 65, 90),
                           labels = c("16-25", "26-35", "36-45", "46-55", "56-65", "66+"),
                           include.lowest = TRUE)) %>%
  group_by(usertype, age_bracket) %>%
  summarise(
    ride_count = n(),
    .groups = "drop"
  )

# Station Analysis for each user type
top_stations <- cleaned_data %>% 
  group_by(from_station_name, usertype) %>% 
  summarise(ride_count = n(), .groups = "drop") %>% 
  group_by(from_station_name) %>%
  mutate(
    total_rides = sum(ride_count),
    user_percentage = ride_count / total_rides * 100)


# Top 10 stations by total rides
top_10_stations <- cleaned_data %>% 
  group_by(from_station_name, usertype) %>% 
  summarise(ride_count = n(), .groups = "drop") %>% 
  group_by(from_station_name) %>%
  mutate(
    total_rides = sum(ride_count),
    user_percentage = ride_count / total_rides * 100
    ) %>%
  ungroup() %>%
  arrange(desc(total_rides)) %>%
  slice(1:10)

print(top_10_stations, n=10)


# Saving the analysed outputs as CSV files
write.csv(cleaned_data, "cleaned_data.csv", row.names = FALSE)
write.csv(weekly_ride, "weekly_ride.csv", row.names = FALSE)
write.csv(hourly_ride, "hourly_ride.csv", row.names = FALSE)
write.csv(time_category_ride, "time_category_ride.csv", row.names = FALSE)
write.csv(duration_of_ride, "duration_of_ride.csv", row.names = FALSE)
write.csv(duration_by_timeofday, "duration_by_timeofday.csv", row.names = FALSE)
write.csv(age_analysis, "age_analysis.csv", row.names = FALSE)
write.csv(age_bracket_data, "age_bracket_data.csv", row.names = FALSE)
write.csv(top_stations, "top_stations.csv", row.names = FALSE)
write.csv(top_10_stations, "top_10_stations.csv", row.names = FALSE)












