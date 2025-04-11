# 🚖 OLA Ride Booking Data Analyst Project

This project simulates and analyzes 1 month of ride-booking data for OLA Cabs in Bengaluru. Using SQL and Power BI, we dive into customer behavior, booking trends, cancellation patterns, and business KPIs.

---

## 🧾 Dataset Overview

The dataset includes over **100,000** records with fields such as:
- Date, Time, Booking ID, Customer ID
- Vehicle Type (Auto, Mini, Prime Sedan, SUV, Bike, etc.)
- Pickup & Drop Locations (50 areas in Bangalore)
- VTAT & CTAT (vehicle/customer arrival times)
- Ride cancellations (Customer & Driver) with reasons
- Incomplete rides & reasons
- Booking value, payment method, ride distance
- Driver & Customer Ratings

### 📌 Smart Constraints:
- 62% success rate
- <7% cancellations by customer
- <18% cancellations by driver
- More rides on weekends & match days
- Higher value orders on weekends

---

## 🧠 SQL Analysis

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
