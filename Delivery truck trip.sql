-- Export data from csv file --
ALTER TABLE `delivery truck trip data(clean)`
RENAME TO delivery_truck_trip;

ALTER TABLE delivery_truck_trip       
MODIFY COLUMN TRANSPORTATION_DISTANCE_IN_KM DECIMAL(10,2),  
MODIFY COLUMN `Minimum_kms_to_be_covered_in_a_day` DECIMAL(10,2) ;

SELECT trip_start_date, trip_end_date, Planned_ETA, actual_eta 
FROM delivery_truck_trip 
LIMIT 5;

-- Check Total Deliveries & Delays--

SELECT count(*) as total_deliveries,
		(SELECT COUNT(delay) FROM delivery_truck_trip WHERE delay = 'R') AS total_delays
FROM delivery_truck_trip;

-- Top 5 Most Delayed Routes--

SELECT origin_location,
		destination_location,
        COUNT(*) AS delay_counts
FROM delivery_truck_trip 
WHERE delay = 'R'
GROUP BY Origin_Location, Destination_Location
ORDER BY delay_counts DESC
LIMIT 5;

-- Delivery Performance by Vehicle Type--

SELECT vehicletype, 
		COUNT(*) AS total_trips,
        SUM(
			CASE
				WHEN delay= 'R' THEN 1
                ELSE 0 END) AS total_delay
FROM delivery_truck_trip
GROUP BY vehicleType
ORDER BY total_delay DESC
LIMIT 5;        
        
       









        










  