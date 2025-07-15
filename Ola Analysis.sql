CREATE DATABASE OLA;

USE OLA;

-- 1. Retrieve all successful bookings
Select * from bookings where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type
Select Vehicle_Type, AVG(Ride_Distance) as [Average Ride Distance] from Bookings Group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers
Select Count(*) as [Number of rides cancelled by customers] from bookings where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides
Select TOP 5 Customer_ID, Count(Booking_ID) as [No of Rides] from Bookings
Group BY Customer_ID
Order by Count(booking_id) desc;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
Select Count(*) as [No of Rides Cancelled] from Bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Select MAX(Driver_Ratings) as [Maximum Rating], MIN(Driver_Ratings) as [Minimum Rating] 
from bookings
Where Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
Select Count(*) as [Rides_Upi_Payment] from bookings
Where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type
Select Vehicle_Type, AVG(Customer_Rating) [Average Customer Rating] from bookings
Group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully
Select SUM(booking_value) [Total Booking Value of successful rides] from Bookings
Where Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason
Select Customer_ID, Booking_ID, Incomplete_Rides_Reason from Bookings
Where Incomplete_Rides = 1;

