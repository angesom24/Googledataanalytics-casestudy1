# Googledataanalytics-casestudy1
A full case study capstone project for google data analytics certificate course
Google Data Analytics Case Study 1
How Does a Bike-Share Navigate Speedy Success?
Business Task Statement:
How to Convert Casual riders into annual members?
• Question Asked : How do annual members and casual riders use bikes differently?
• Key Stakeholders: 
     A) Primary: Lily Moreno,  Direct Manager 
     B) Secondary: Marketing Analytics Team 
     C) Upper Management: Cyclistic Executive team
### About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
# Goal of analysis:
To understand how casual riders and annual members use Cyclistic 
Project Phases: The main question is How do annual members and casual riders use Cyclistic bikes differently?

1- Ask: Deliverable: A clear statement of the business task (How to Convert Casual riders into annual members?)

2- Prepare: Deliverable: A description of all data sources used

      Downloaded files trip_data_ from 2019 Q1 to 2020 Q1, all file are large to analysis in Excel so, I imported to R.
3- Process: Deliverable: Documentation of any cleaning or manipulation of data (Included in the script, and RMD file)
4- Analyze: Key tasks
    - Aggregate your data so it’s useful and accessible.
    - Organize and format your data. 
    - Perform analysis. 
    - Identify trends and relationships.
summary of the analysis in in R and RMD
5- Share: the share includes the key insights.
#Key insights
- The average of ride length per minute is 0.2823 Minute and it is more than the minimum ride length of the causual users which is 0.16 minute
- The maximum ride length per minute for member users occurs on Tuesday, however the maximum ride length per minute for casual users occur on Thursday. 
- The most used start station in general is "Clinton St & Washington Blvd " with the amount of 15222 occurrences, Also which surprising it's the most used end station name by 84479 occurrences - The least used start_station_name is 2112 W Peterson Ave, with 546 occurrences, and surprisingly it's the same least used end station with 685.
- The most used station for annual members is Canal St & Adams St 58161, and for casual users Streeter Dr & Grand Ave with 54634
- The least used start station is 2112 W Peterson Ave for both types of users.
-  Total number of rides for the period of (2019-01-01 to 2020-03-30) is 4,241,111rides, Noticed that Annual members have 3315766 rides with the % of 78.18%, and casual members have 925345 rides with the % of 21.81%.
-  The top week day for casual riders bike rides is Saturday, and for annual members is Tuesday.
-  The lowest rides for casual riders is Tuesday, and for annual members is Sunday.
