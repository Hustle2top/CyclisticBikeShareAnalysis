# CyclisticBikeShareAnalysis
This repository includes the Data Analysis of the trips data for Cyclistic (a bike share company) for Q1 of 2019.

## Project Overview
This repository includes the Data Analysis & related files/docs, for a bike sharing company called "Cyclistic" based in the US. The raw data has been downloaded directly via the link provided in the PDF file for Cyclistic case study capstone project overview, in the Google Data analytics certificate course by Coursera. The file used for this analysis is named as "Divvy_Trips_2019_Q1". This file includes data for all the trips that occurred in the first quarter (Q1) only, for the year 2019. This project aims at analyzing the trips data and find ways to convert casual riders into subscribers who subscribe the annual/monthly plans from Cyclistic. In this dataset, the casual riders have been represented as "Customer", whereas the Subscribers have been represented as "Subscriber" in the usertype column.

## Data Source
The dataset used for this analysis can be downloaded by following the link provided in this PDF file--> (). It has been downloaded in the csv format, consisting of 365070 rows and 12 columns originally(without cleaning).

## Tools Used
CSV File (Original data file)
R Studio (Data Cleaning)
R Studio (Data Exploration/EDA)
Power BI (Data Modelling & Visualization)
Power Point (Reporting & summary)

## Data Cleaning & Preparation
In the initial data preparation phase, I performed below steps:

1. Installed R studio software & opened new R script file, for data cleaning.
2. In the Data Cleaning R script file, I installed "Tidyverse" & "readxl" packages first.
3. After loading packages, attached them using library function and then performed data loading & inspection.
4. Checked column names and their datatypes. Changed datatype for tripduration column to integer.
5. Checked summary statistics for all columns to get Min, Max, Mean, Median etc.
6. Checked for duplicate values, inconsistent values, missing/NA values and filtered them.
7. Finally, saved the cleaned raw data as new csv file using "write.csv" function.

## EDA & Data Analysis
In EDA & data analysis, I performed the below steps:

1. Opened a new R script file for Data analysis, and started by loading "Tidyverse" library & then imported cleaned data csv file in it.
2. Created new columns by extracting day of week, hour of week & created time categories by using start_time column.
3. Performed deep level analysis to find weekly, hourly, time category ride pattern, ride duration analysis, top stations analysis uncovering the trends.
4. Used R programming functions like mutate, summarise, group_by, filter, arrange, slice, ungroup to complete the core data analysis.
5. Saved the analyzed outputs as different csv files using "write.csv" function, so that these can be used for creating visualizations easily in power BI.
6. Also added a new R script file for including short KPI style analysis codes which can be used directly in Power BI to add card style visuals.

## Summary & Findings
The main findings of my analysis are as below-
1. The weekly ride pattern analysis, tells that subscribers mainly use Cyclistic services on weekdays, whereas non-subscribers use rides mainly on weekends i.e. Saturday & Sunday.
2. The most number of rides are happening in the Afternoon (12PM-6PM) & Morning (6AM-12PM) time slots for both type of users.
3. The average ride duration for subscribers is 31 minutes, whereas for non-subscribers it is just 11 minutes. Overall ride duration is between 11-12 minutes.
4. Most riders fall in the age bracket of 26-35 years of age, for both type of users.
5. The busiest station by total no. of rides originating is "Clinton St & Washington   Blvd".
6. The busiest route by total no. of rides is between "Michigan Ave & Washington St." and "Clinton St & Washington Blvd".

## Limitations
1. Raw data is only for the first quarter(Q1) for the year 2019, not for the full year.
2. Unavailability of data about current pricing for subscription plans, made to give suggestions only as per analysis of data without pricing structure. 

## Data Source Disclaimer
1. Data was downloaded via the link provided by Coursera in the capstone project pdf file & is for educational and non-commercial purposes only.
2. This project is intended for personal portfolio and learning. No raw HTML or commercial redistribution is involved.

## Sample Dashboard Preview
