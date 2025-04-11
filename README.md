# 🚖 OLA Ride Booking Data Analyst Project

This project simulates and analyzes 1 month of ride-booking data for OLA Cabs in Bengaluru. Using SQL and Power BI, we dive into customer behavior, booking trends, cancellation patterns, and business KPIs.

---
## Tools Used
**SQL (MySQL / PostgreSQL)** – For data querying, filtering, aggregation

**Power BI Desktop** – For dashboards, charts, KPIs, storytelling

**Microsoft Excel / CSV** – For initial data handling and prep

## Dataset Overview

The dataset includes over **100,000** records with fields such as:
- Date, Time, Booking ID, Customer ID
- Vehicle Type (Auto, Mini, Prime Sedan, SUV, Bike, etc.)
- Pickup & Drop Locations (50 areas in Bangalore)
- VTAT & CTAT (vehicle/customer arrival times)
- Ride cancellations (Customer & Driver) with reasons
- Incomplete rides & reasons
- Booking value, payment method, ride distance
- Driver & Customer Ratings

### Smart Constraints:
- 62% success rate
- <7% cancellations by customer
- <18% cancellations by driver
- More rides on weekends & match days
- Higher value orders on weekends

---

## SQL Analysis

All queries run on the `bookings` table.

```sql
-- 1. Retrieve all successful bookings
CREATE VIEW Successfull_Booking AS
SELECT * FROM bookings WHERE Booking_Status = "Success";

-- 2. Average ride distance per vehicle type
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_Distance 
FROM bookings GROUP BY Vehicle_Type;

-- 3. Total number of cancelled rides by customers
SELECT COUNT(Canceled_Rides_by_Customer) AS Cancelled_Ride_By_Customer 
FROM bookings WHERE Canceled_Rides_by_Customer IS NOT NULL;

-- 4. Top 5 customers with highest bookings
SELECT Customer_ID FROM bookings 
GROUP BY Customer_ID ORDER BY COUNT(*) DESC LIMIT 5;

-- 5. Rides cancelled by drivers for personal & car issues
SELECT COUNT(Canceled_Rides_by_Driver) AS Cancelled_By_Driver 
FROM bookings WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";

-- 6. Max & Min ratings for Prime Sedan
SELECT MAX(Customer_Rating), MIN(Customer_Rating) 
FROM bookings WHERE Vehicle_Type = "Prime Sedan";

-- 7. All rides paid using UPI
SELECT * FROM bookings WHERE Payment_Method = "UPI";

-- 8. Avg customer rating per vehicle type
SELECT Vehicle_Type, AVG(Customer_Rating) AS Avg_Customer_Rating 
FROM bookings GROUP BY Vehicle_Type;

-- 9. Total booking value of successful rides
SELECT SUM(Booking_Value) AS Total_booking_value 
FROM bookings WHERE Booking_Status = "Success";

-- 10. Incomplete rides with reason
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings WHERE Incomplete_Rides = "Yes";
```

## Power BI Dashboard Insights

The visuals are segregated into five meaningful sections:

### 🧭 Overall
- Ride Volume Over Time
- Booking Status Breakdown

### 🚗 Vehicle Insights
- Top 5 Vehicle Types by Ride Distance

### 💰 Revenue Insights
- Revenue by Payment Method
- Top 5 Customers by Booking Value
- Ride Distance Distribution Per Day

### ❌ Cancellation Analysis
- Cancelled Ride Reasons (Customer)
- Cancelled Ride Reasons (Drivers)

### 🌟 Rating Insights
- Driver Ratings
- Customer Ratings
- Customer vs Driver Ratings (Scatter Comparison)

---

## 📷 Dashboard Screenshots

> These visuals are generated in Power BI and reflect key performance indicators and ride behavior patterns.

### 🔹 Booking Status Breakdown
![1](https://github.com/user-attachments/assets/a19a8923-5d47-435d-af1a-3bb051902dd2)


### 🔹 Rating by Vehicle Type
![5](https://github.com/user-attachments/assets/9b7d4557-40b6-4df0-b949-8a2880f8c353)


### 🔹 Top Vehicle Types by Distance
![2](https://github.com/user-attachments/assets/09347674-5036-4dd2-ae7e-26694db23abe)


### 🔹 Revenue by Payment Method
![3](https://github.com/user-attachments/assets/0fd6846e-3661-40fd-abd9-60df21111554)


### 🔹 Customer vs Driver Ratings
![4](https://github.com/user-attachments/assets/14e633db-4d77-4078-9c15-78d0b6c75bf2)

---

## Project Summary:
This OLA Data Analyst Project provided a comprehensive opportunity to simulate a real-world ride-booking business scenario and apply core data analytics concepts. By working with a large, structured dataset and deriving insights through SQL and Power BI, I was able to replicate key business metrics and KPIs relevant to mobility services.

## Key Learnings:

- **Data Modeling**: Understood how to structure and clean raw transactional data for analysis and visualization purposes.
- **SQL Mastery**: Practiced writing complex queries including aggregations, groupings, conditional filters, and views to extract actionable insights.
- **Business Understanding**: Gained clarity on how ride-booking platforms operate, especially regarding booking patterns, cancellations, ratings, and customer behavior.
- **Power BI Proficiency**: Built an interactive and dynamic dashboard using Power BI, integrating slicers, charts, and storytelling techniques to present insights in a meaningful way.
- **Data-Driven Decision Making**: Identified trends such as peak booking days, high-value customers, and key reasons for service disruptions, enabling potential improvements for operations.
- **Project Structuring & Documentation**: Learned how to organize a data project for portfolio readiness, including documentation, folder structure, visual assets, and GitHub hosting.

This project strengthened my overall analytical thinking and hands-on proficiency in SQL and Power BI, and it showcased how technical tools can be applied to solve business problems through data.


