library(tidyverse)
#Total number of overall rides
All_rides <- cleaned_data %>% 
  summarise(ride_count = n())

#Total number of customer rides
Customer_rides <- cleaned_data %>% 
  filter(usertype == "Customer") %>% 
  summarise(ride_count = n())

#Total number of Subscriber rides
Subscriber_rides <- cleaned_data %>% 
  filter(usertype == "Subscriber") %>% 
  summarise(ride_count = n())

#Average ride time for customers
Customer_avg_ridetime <- cleaned_data %>% 
  filter(usertype == "Customer") %>% 
  summarise(avg_duration = mean(tripduration)/60)

#Average ride time for Subscribers
Subscriber_avg_ridetime <- cleaned_data %>% 
  filter(usertype == "Subscriber") %>% 
  summarise(avg_duration = mean(tripduration)/60)

#Average age for customers
Avg_customer_age <- cleaned_data %>% 
  filter(usertype == "Customer") %>% 
  summarise(avg_age = mean(age))

#Average age for Subscribers
Avg_subscriber_age <- cleaned_data %>% 
  filter(usertype == "Subscriber") %>% 
  summarise(avg_age = mean(age))

#Busiest route
busiest_route_overall <- top_10_routes_overall %>% 
  arrange(desc(total_rides)) %>% 
  head(1)

#Busiest station
busiest_station_overall <- top_10_stations %>% 
  arrange(desc(total_rides)) %>% 
  head(1)


#Average ride time overall
Average_overall_time <- cleaned_data %>% 
  summarise(avg_time = mean(tripduration) / 60)


# Saving these KPI files
write.csv(Customer_rides, "Customer_rides.csv", row.names = FALSE)
write.csv(Subscriber_rides, "Subscriber_rides.csv", row.names = FALSE)
write.csv(Customer_avg_ridetime, "Customer_avg_ridetime.csv", row.names = FALSE)
write.csv(Subscriber_avg_ridetime, "Subscriber_avg_ridetime.csv", row.names = FALSE)
write.csv(Avg_customer_age, "Avg_customer_age.csv", row.names = FALSE)
write.csv(Avg_subscriber_age, "Avg_subscriber_age.csv", row.names = FALSE)
write.csv(busiest_route_overall, "busiest_route_overall.csv", row.names = FALSE)
write.csv(busiest_station_overall, "busiest_station_overall.csv", row.names = FALSE)
write.csv(All_rides, "All_rides.csv", row.names = FALSE)
write.csv(Average_overall_time, "Average_overall_time.csv", row.names = FALSE)



