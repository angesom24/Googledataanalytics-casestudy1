#Installing the packages
install.packages('tidyverse')
install.packages('janitor')
install.packages('lubridate')
install.packages("ggplot2")
install.packages("lubridate")
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("readr")
install.packages("Tmisc")
#loading the packages
library(lubridate)
library(tidyverse)
library(ggplot2)
library(here)
library(skimr)
library(janitor)
library(dplyr)
library(readr)
library(Tmisc)

#accessing the data here

q1_2019 <- read_csv("Divvy_Tripdata/csv/Divvy_Trips_2019_Q1.csv")
q1_2020 <- read_csv("Divvy_Tripdata/csv/Divvy_Trips_2019_Q1.csv")

colnames(q1_2019)
colnames(q1_2020)


head(q1_2019)
head(q1_2020)

#check duplicate data
sum(duplicated(q1_2019))
sum(duplicated(q1_2020))

#check missiong value
sum(is.na(q1_2019))
sum(is.na(q1_2020))

#check inside the data
glimpse(q1_2019)
glimpse(q1_2020)

#clean data
q1_2019 <- rename(q1_2019
                  ,trip_id = trip_id
                  ,start_time = start_time
                  ,end_time = end_time
                  ,bike_id = bikeid
                  ,trip_duration = tripduration
                  ,start_station_id = from_station_id
                  ,start_station_name = from_station_name
                  ,end_station_id = to_station_id
                  ,end_station_name = to_station_name
                  ,user_type = usertype
                  ,gender = gender
                  ,birth_year = birthyear
                  ,ride_length = ride_length
                  ,day_of_week = day_of_week )


#clean data
q1_2020 <- rename(q1_2020
                  ,trip_id = trip_id
                  ,start_time = start_time
                  ,end_time = end_time
                  ,bike_id = bikeid
                  ,trip_duration = tripduration
                  ,start_station_id = from_station_id
                  ,start_station_name = from_station_name
                  ,end_station_id = to_station_id
                  ,end_station_name = to_station_name
                  ,user_type = usertype
                  ,gender = gender
                  ,birth_year = birthyear
                  ,ride_length = ride_length
                  ,day_of_week = day_of_week )





q1_2019 <-  mutate(q1_2019, trip_id = as.character(trip_id))
q1_2020 <-  mutate(q1_2020, trip_id = as.character(trip_id))


#combine the datasets

trip_data <- bind_rows(q1_2019, q1_2020)

# Deep assessment for all trips data 
str(trip_data)
glimpse(trip_data)
summary(trip_data)class(trip_data)
class(trip_data$start_time)
class(trip_data$end_time)
class(trip_data$bike_id)
class(trip_data$trip_duration)
class(trip_data$start_station_name)
class(trip_data$end_station_name)
class(trip_data$user_type)
class(trip_data$birth_year)

# date column to be able to explore trends based on the day or month
trip_data$date <- as.Date(trip_data$start_time)
trip_data$month <- format(as.Date(trip_data$date), "%M")
trip_data$day <- format(as.Date(trip_data$date), "%D")
trip_data$year <- format(as.Date(trip_data$date), "%Y")
trip_data$day_of_week <- format(as.Date(trip_data$date), "%A")

trip_data <- trip_data %>%  
  select(-c(start_station_id, end_station_id, gender, start_lat, start_lng, end_lat, end_lng))


# Rechecking the data frame
glimpse(trip_data)
str(trip_data)

names(trip_data)
unique(trip_data$start_station_name)
unique(trip_data$end_station_name)
unique(trip_data$user_type)
unique(trip_data$birth_year)
unique(trip_data$date)
unique(trip_data$trip_duration)
unique(trip_data$day_of_week)
sum(is.na(trip_data$trip_duration))
# the "user_type " column, replace "Subscriber" with "member" and "Customer" with "casual"
trip_data <-  trip_data %>% 
  mutate(user_type = recode(user_type
                            ,"Subscriber" = "member"
                            ,"Customer" = "casual"))
# Add a "ride_length" calculation to all_trips (in seconds)
trip_data$ride_length <- difftime(trip_data$end_time,trip_data$start_time)
#Converting ride length to minutes
trip_data <- trip_data %>%
  mutate(ride_length_minu=ride_length/60)
# Convert "ride_length" from Factor to numeric so we can run calculations on the data
trip_data$ride_length_minu <- as.numeric(trip_data$ride_length_minu)
# Ordering days of week properly
trip_data$day_of_week <- ordered(trip_data$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
# Remove "bad" data
trip_data <- trip_data[!(trip_data$start_station_name == "HQ QR" | trip_data$ride_length<0),]
# Final Check
colnames(trip_data)  #List of column names
nrow(trip_data)  #How many rows are in data frame?
dim(trip_data)  #Dimensions of the data frame?
head(trip_data, 20)  #See the first 20 rows of data frame.  
tail(trip_data, 20 ) #See the last 20 rows of data frame.
str(trip_data)  #See list of columns and data types (numeric, character, etc)
summary(trip_data)  #Statistical summary of data. Mainly for numerics
# Rechecking the most important variables in the Data
unique(trip_data$start_station_name)

unique(trip_data$user_type)
unique(trip_data$birth_year)
unique(trip_data$date)
unique(trip_data$ride_length_minu)
unique(trip_data$day_of_week)
sum(is.na(trip_data$trip_duration))


# Descriptive analysis on ride_length in minutes
mean(trip_data$ride_length_minu) 
median(trip_data$ride_length_minu) 
max(trip_data$ride_length_minu) 
min(trip_data$ride_length_minu) 
summary(trip_data$ride_length_minu)


final_trip_data <- trip_data %>% 
  drop_na() %>% 
  select(-c(start_time, end_time, trip_duration, ride_length))
count(trip_data, start_station_name, sort = TRUE)
count(trip_data, end_station_name, sort = TRUE)
count(trip_data, start_station_name, sort = FALSE)
count(trip_data, end_station_name, sort = FALSE)
count(trip_data, user_type, start_station_name,sort= TRUE)
count(trip_data, start_station_name, user_type, sort= TRUE)
count(trip_data, user_type, day_of_week, sort = TRUE)
count(trip_data, user_type, sort = FALSE)
names(trip_data)
count


View(ride_length)

write.csv(final_trip_data, file= 'Divvy_Tripdata/output.csv', row.names = FALSE)

count(trip_data, end_station_name)
count(trip_data, start_station_name, sort = FALSE)

trip_data %>%
  filter(user_type == "casual")%>% 
print(count(start_station_name,user_type, sort = TRUE),n=536)


ggplot(data=trip_data, aes(x = "", y = count, fill = user_type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  theme_void() +
  geom_text(aes(label = paste0(percentage, "%")),
            position = position_stack(vjust = 0.5)) +
  ggtitle("Pie Chart with Percentages")
color<- c("#12e34","#12d34")

datas <- trip_data %>%
  group_by(user_type) %>%
  summarise(count = n(),
            percentage = n()/nrow(trip_data))
ggplot(data=datas, aes(x="", y=percentage, fill=user_type)) +
  geom_col(colot = "black")+
  coord_polar("y", start = 0)+
  geom_text(aes(label = paste0(round(percentage*100),"%")),
            position = position_stack(vjust = 0.5)) +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0,5, size=12)) +
  ggtitle("Number of riders by user types")
scale_fill_manual(values = color)


## Average ride length
memberdata <- trip_data %>%
  filter(user_type == "member")
causaldata <- trip_data %>%
  filter(user_type == "causal")

bardata <- trip_data %>%
  group_by(day_of_week) %>%
  summarise(count = n(),
            member= sum(user_type == "member"),
            casual = sum(user_type == "casual"))
bardata <-pivot_longer(bardata, cols = c("member","casual"), names_to = "users_type", values_to = "Number")



ggplot(bardata, aes(x = day_of_week, y = Number, fill = users_type)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = Number ), vjust = 0)
  labs(title = "Multicolumn Bar Chart",
       x = "meber", 
       y = "Value") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")
  



ggplot(bardata, aes(x = day_of_week, y = Number, fill = users_type)) +
  geom_bar(stat = "identity", position = position_dodge()) +
 
  theme(panel.background = element_blank(),
        
        plot.title = element_text(hjust = 0,5, size=12)) +
  ggtitle("Number of riders by weekdays")
