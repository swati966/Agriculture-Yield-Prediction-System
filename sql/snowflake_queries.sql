
-- DATABASE & SCHEMA CREATION


CREATE DATABASE AGRI_DB;
USE DATABASE AGRI_DB;

CREATE SCHEMA AGRI_SCHEMA;
USE SCHEMA AGRI_SCHEMA;



--STAR SCHEMA TABLE CREATION


CREATE TABLE DIM_CROP (
    Crop_ID INT,
    Crop_Name STRING
);

CREATE TABLE DIM_LOCATION (
    Location_ID INT,
    Area STRING
);

CREATE TABLE DIM_WEATHER (
    Weather_ID INT,
    Rainfall FLOAT,
    Temperature FLOAT,
    Pesticides FLOAT
);

CREATE TABLE FACT_YIELD (
    Yield_ID INT,
    Crop_ID INT,
    Location_ID INT,
    Weather_ID INT,
    Year INT,
    Yield FLOAT
);

SHOW TABLES;


-- DATA VALIDATION


SELECT * FROM CLEANED_DATA LIMIT 10;


-- ADVANCED SQL QUERIES

-- CTE: Average Yield by Area
WITH avg_yield_cte AS (
    SELECT Area, AVG(Yield) AS avg_yield
    FROM CLEANED_DATA
    GROUP BY Area
)
SELECT * FROM avg_yield_cte
ORDER BY avg_yield DESC;


-- WINDOW FUNCTION: Ranking Crops by Yield
SELECT Area,
       Item,
       Yield,
       RANK() OVER (PARTITION BY Area ORDER BY Yield DESC) AS Yield_Rank
FROM CLEANED_DATA;


-- PARTITION ANALYSIS: Avg Yield by Area
SELECT Area,
       Item,
       AVG(Yield) OVER (PARTITION BY Area) AS Avg_Yield_By_Area
FROM CLEANED_DATA;


-- RUNNING TOTAL: Yield Trend Over Years
SELECT Area,
       Year,
       Yield,
       SUM(Yield) OVER (PARTITION BY Area ORDER BY Year) AS Running_Yield
FROM CLEANED_DATA;


-- TOP PERFORMING CROP PER AREA
SELECT *
FROM (
    SELECT Area,
           Item,
           Yield,
           ROW_NUMBER() OVER (PARTITION BY Area ORDER BY Yield DESC) AS rn
    FROM CLEANED_DATA
)
WHERE rn = 1;


--SECURITY IMPLEMENTATION (RBAC)


CREATE ROLE analyst_role;

GRANT SELECT ON TABLE CLEANED_DATA TO ROLE analyst_role;

GRANT ROLE analyst_role TO USER SWATI966;
