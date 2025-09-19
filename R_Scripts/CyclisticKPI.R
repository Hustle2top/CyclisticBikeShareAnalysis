library(tidyverse)
# Number of rides by user type
user_numbers <- cleaned_data %>% 
  group_by(usertype) %>% 
  summarise(ride_count = n())

# Peak ride time overall
peak_ride_time <- cleaned_data %>% 
  group_by(time_category) %>% 
  summarise(ride_count = n())

# Busiest route by user type
busiest_route <- cleaned_data %>% 
  group_by(from_station_name, to_station_name, usertype) %>% 
  summarise(ride_count = n(),
            .groups = "drop")

# Top 10 Busiest routes overall
top_10_routes_overall <- busiest_route %>%
  group_by(from_station_name, to_station_name, usertype) %>%
  summarise(total_rides = sum(ride_count), .groups = "drop") %>%
  arrange(desc(total_rides)) %>%
  head(10)

# Top 10 Busiest routes for non-subscriber riders (conversion opportunity)
top_10_routes_customer <- busiest_route %>% 
  filter(usertype == "Customer") %>% 
  arrange(desc(ride_count)) %>% 
  head(10)

# Peak ride time for non-subscribers (conversion opportunity)
peak_ride_time_customers <- cleaned_data %>% 
  filter(usertype == "Customer") %>%
  group_by(time_category) %>% 
  summarise(ride_count = n()) %>% 
  arrange(desc(ride_count))

# Ride by day of week for non subscribers
weekly_ride <- cleaned_data %>% 
  filter(usertype == "Customer") %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(
    ride_count = n(),
    .groups = "drop"
  )



# Saving these KPI files
write.csv(user_numbers, "user_numbers.csv", row.names = FALSE)
write.csv(top_10_routes_customer, "top_10_routes_customer.csv", row.names = FALSE)
write.csv(peak_ride_time_customers, "peak_ride_time_customers.csv", row.names = FALSE)










