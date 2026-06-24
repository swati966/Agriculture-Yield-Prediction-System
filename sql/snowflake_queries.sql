--------------------------------------------------
STEP 1: DATABASE & SCHEMA CREATION
(Data Warehouse Setup)
--------------------------------------------------

CREATE DATABASE AGRI_DB;
USE DATABASE AGRI_DB;

CREATE SCHEMA AGRI_SCHEMA;
USE SCHEMA AGRI_SCHEMA;


--------------------------------------------------
STEP 2: DATA WAREHOUSE DESIGN (STAR SCHEMA)
--------------------------------------------------

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


--------------------------------------------------
STEP 3: DATA VALIDATION
--------------------------------------------------

SELECT * FROM CLEANED_DATA LIMIT 10;


--------------------------------------------------
STEP 4: SNOWFLAKE ELT IMPLEMENTATION
(STAGING → DIMENSION → FACT)
--------------------------------------------------

-- STAGING LAYER

CREATE SCHEMA IF NOT EXISTS STAGING;
USE SCHEMA STAGING;

CREATE OR REPLACE TABLE YIELD_CLEAN AS
SELECT Area,
       Item,
       Year,
       Yield,
       Rainfall,
       Pesticides,
       Temperature
FROM AGRI_DB.AGRI_SCHEMA.CLEANED_DATA;


-- LOAD DIMENSION TABLES

USE SCHEMA AGRI_SCHEMA;

INSERT INTO DIM_CROP (Crop_Name)
SELECT DISTINCT Item
FROM AGRI_DB.STAGING.YIELD_CLEAN;

INSERT INTO DIM_LOCATION (Area)
SELECT DISTINCT Area
FROM AGRI_DB.STAGING.YIELD_CLEAN;

INSERT INTO DIM_WEATHER (Rainfall, Temperature, Pesticides)
SELECT DISTINCT Rainfall, Temperature, Pesticides
FROM AGRI_DB.STAGING.YIELD_CLEAN;


-- LOAD FACT TABLE

INSERT INTO FACT_YIELD
SELECT
    ROW_NUMBER() OVER (ORDER BY Y.Year) AS Yield_ID,
    C.Crop_ID,
    L.Location_ID,
    W.Weather_ID,
    Y.Year,
    Y.Yield
FROM AGRI_DB.STAGING.YIELD_CLEAN Y
JOIN DIM_CROP C
    ON Y.Item = C.Crop_Name
JOIN DIM_LOCATION L
    ON Y.Area = L.Area
JOIN DIM_WEATHER W
    ON Y.Rainfall = W.Rainfall
   AND Y.Temperature = W.Temperature
   AND Y.Pesticides = W.Pesticides;


--------------------------------------------------
STEP 5: ADVANCED SQL ANALYTICS
--------------------------------------------------

-- CTE Analysis

WITH avg_yield_cte AS (
SELECT Area, AVG(Yield) AS avg_yield
FROM CLEANED_DATA
GROUP BY Area
)
SELECT * FROM avg_yield_cte
ORDER BY avg_yield DESC;


-- Window Function (Ranking)

SELECT Area,
       Item,
       Yield,
       RANK() OVER (PARTITION BY Area ORDER BY Yield DESC) AS Yield_Rank
FROM CLEANED_DATA;


-- Partition Analysis

SELECT Area,
       Item,
       AVG(Yield) OVER (PARTITION BY Area) AS Avg_Yield_By_Area
FROM CLEANED_DATA;


-- Running Total

SELECT Area,
       Year,
       Yield,
       SUM(Yield) OVER (PARTITION BY Area ORDER BY Year) AS Running_Yield
FROM CLEANED_DATA;


-- Top Performing Crop

SELECT *
FROM (
SELECT Area,
       Item,
       Yield,
       ROW_NUMBER() OVER (PARTITION BY Area ORDER BY Yield DESC) AS rn
FROM CLEANED_DATA
)
WHERE rn = 1;


--------------------------------------------------
STEP 6: SECURITY IMPLEMENTATION (RBAC)
--------------------------------------------------

CREATE ROLE analyst_role;

GRANT SELECT ON TABLE CLEANED_DATA TO ROLE analyst_role;
GRANT ROLE analyst_role TO USER SWATI966;


--------------------------------------------------
STEP 7: SNOWFLAKE DATA OPTIMIZATION
--------------------------------------------------

-- Clustering

ALTER TABLE CLEANED_DATA
CLUSTER BY (Area, Year);


-- Time Travel

UPDATE CLEANED_DATA
SET Yield = Yield + 5
WHERE Area = 'India';

SELECT *
FROM CLEANED_DATA
AT (OFFSET => -60*5);


-- Semi-Structured Data (JSON)

CREATE TABLE WEATHER_JSON (
    weather_data VARIANT
);

INSERT INTO WEATHER_JSON
SELECT PARSE_JSON('{
"Area":"India",
"Rainfall":1200,
"Temperature":25,
"Pesticides":200
}');

SELECT weather_data:Area,
       weather_data:Rainfall
FROM WEATHER_JSON;


--------------------------------------------------
STEP 8: GOVERNANCE IMPLEMENTATION
(Data Masking + Row Level Security)
--------------------------------------------------

-- Masking Policy

CREATE MASKING POLICY area_mask
AS (val STRING) RETURNS STRING ->
CASE
WHEN CURRENT_ROLE() = 'ANALYST_ROLE'
THEN val
ELSE 'RESTRICTED'
END;

ALTER TABLE CLEANED_DATA
MODIFY COLUMN Area
SET MASKING POLICY area_mask;


-- Row Access Policy

CREATE OR REPLACE ROW ACCESS POLICY year_filter
AS (Year INT) RETURNS BOOLEAN ->
CASE
WHEN CURRENT_ROLE() = 'ANALYST_ROLE'
THEN Year >= 2015
ELSE TRUE
END;

ALTER TABLE FACT_YIELD
ADD ROW ACCESS POLICY year_filter ON (Year);


--------------------------------------------------
STEP 9: PERFORMANCE TUNING
--------------------------------------------------

ALTER WAREHOUSE COMPUTE_WH
SET WAREHOUSE_SIZE = 'MEDIUM';


--------------------------------------------------
STEP 10: PERFORMANCE MONITORING
--------------------------------------------------

SELECT *
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())
ORDER BY START_TIME DESC
LIMIT 5;