use ola;
create view Successfull_Booking as
select * from bookings
where Booking_Status = "Success";

#1. retrive all successful data
select * from Successfull_Booking;

#2. find avg ride distance for each vehicle type
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from bookings group by Vehicle_Type;

#3. get total number of cancelled rides by customers
select count(Canceled_Rides_by_Customer) AS Cancelled_Ride_By_Customer from bookings where Canceled_Rides_by_Customer IS NOT NULL;

#4. List top 5 customers who booked highest number of rides
select Customer_ID from bookings group by Customer_ID order by Customer_ID desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) as Cancelled_By_Driver from bookings 
where Canceled_Rides_by_Driver = "Personal & Car related issue";

#6. Find the maximum and minimum driver ratings for prime sedan bookings
select MAX(Customer_Rating) as Max_Rating, MIN(Customer_Rating) as Min_Rating from bookings
where Vehicle_Type = "Prime Sedan";

#7. Retrieve all rides where payment was made using UPI:
select * from bookings where Payment_Method = "UPI";

#8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as Avg_Customer_Rating from bookings
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as Total_booking_value from bookings
where Booking_Status = "Success";

#10. 10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = "Yes";
