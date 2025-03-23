# Delivery Truck Trip Analysis

## Project Overview

Efficient logistics and transportation management play a crucial role in supply chain performance. This project focuses on analyzing delivery truck trip data to evaluate transportation efficiency, identify delays, and optimize route planning. By leveraging SQL queries, we extract key insights on delivery performance, vehicle efficiency, and delay patterns.

## Project Workflow

1. Data Preparation & Cleaning

Renamed the dataset table from delivery truck trip data(clean) to delivery_truck_trip for consistency.

Adjusted data types to ensure accuracy in distance and time calculations.

Extracted sample records to validate data integrity.

2. Delivery Performance Analysis

Total Deliveries & Delays:

Calculated the total number of deliveries.

Identified delayed deliveries to assess overall performance.

Top 5 Most Delayed Routes:

Analyzed delivery trips to determine the most frequently delayed routes.

Ranked routes based on the highest number of delays.

Delivery Performance by Vehicle Type:

Categorized trips by vehicle type.

Evaluated delay trends based on vehicle types.

## Key SQL Queries & Insights

1. Checking Total Deliveries & Delays

```sql
SELECT COUNT(*) AS total_deliveries,
       (SELECT COUNT(delay) FROM delivery_truck_trip WHERE delay = 'R') AS total_delays
FROM delivery_truck_trip;
```

Insight: Understanding the percentage of delayed deliveries helps in evaluating overall logistics efficiency.


2. Identifying the Most Delayed Routes

```sql
SELECT origin_location, destination_location, COUNT(*) AS delay_counts
FROM delivery_truck_trip
WHERE delay = 'R'
GROUP BY origin_location, destination_location
ORDER BY delay_counts DESC
LIMIT 5;
```

Insight: Identifying high-risk routes allows for better route optimization and resource allocation.

3. Analyzing Delivery Performance by Vehicle Type

```sql
SELECT vehicleType, COUNT(*) AS total_trips,
       SUM(CASE WHEN delay = 'R' THEN 1 ELSE 0 END) AS total_delay
FROM delivery_truck_trip
GROUP BY vehicleType
ORDER BY total_delay DESC
LIMIT 5;
```

Insight: Understanding vehicle efficiency aids in selecting the best transport modes for minimizing delays.

## Technologies Used

SQL (MySQL/PostgreSQL) – Data querying & analysis

Power BI  – Data visualization & dashboard creation

Excel – Data preprocessing & validation

## Results & Business Impact

Improved Delivery Efficiency: Pinpointing the most delayed routes helps in refining logistics strategies.

Optimized Vehicle Usage: Understanding vehicle-specific delays leads to better fleet management.

Data-Driven Decision Making: Enabling businesses to make informed supply chain improvements based on real insights.

