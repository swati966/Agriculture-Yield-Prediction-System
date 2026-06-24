AGRICULTURE YIELD PREDICTION SYSTEM
--------------------------------------------------

PROJECT DESCRIPTION

This project is an end-to-end Data Engineering Pipeline built to analyze agricultural crop yield data using Cloud Data Warehouse and Big Data technologies.

Project Objectives:

• Design a Data Warehouse using Star Schema  
• Build Python-based ETL pipeline  
• Perform ELT using Snowflake SQL  
• Process large datasets using Apache Spark  
• Store and analyze data using Snowflake  
• Implement Advanced Analytical Queries  
• Apply Snowflake Optimization Techniques  
• Implement Governance & Security  
• Perform Performance Monitoring  
• Visualize insights using Power BI Dashboard  

--------------------------------------------------

TOOLS & TECHNOLOGIES USED

Python          - ETL Pipeline
Apache Spark    - Batch Processing
Snowflake       - Cloud Data Warehouse
SQL             - Analytical Queries
Power BI        - Dashboard Visualization
GitHub          - Version Control

--------------------------------------------------

PROJECT IMPLEMENTATION STEPS

STEP 1: DATA COLLECTION

Agricultural dataset collected in CSV format containing:

Area  
Crop Type  
Year  
Yield  
Rainfall  
Temperature  
Pesticides Usage  

--------------------------------------------------

STEP 2: PYTHON ETL (EXTRACT–TRANSFORM)

ETL implemented using:

etl.py  → Main automated ETL script  
agriculture_etl_pipeline.ipynb → Development & testing notebook

Python (Pandas) is used to:

• Remove unwanted columns  
• Rename column names  
• Handle missing values  
• Clean dataset  

Cleaned dataset stored as:

cleaned_data.csv

--------------------------------------------------

STEP 3: DATA WAREHOUSE DESIGN (STAR SCHEMA)

Dimension Tables:
DIM_CROP  
DIM_LOCATION  
DIM_WEATHER  

Fact Table:
FACT_YIELD  

--------------------------------------------------

STEP 4: SNOWFLAKE CLOUD WAREHOUSE

• Created AGRI_DB Database  
• Created AGRI_SCHEMA  
• Loaded processed dataset into Snowflake  

--------------------------------------------------

STEP 5: SNOWFLAKE ELT (LOAD–TRANSFORM)

Implemented:

• STAGING Layer (YIELD_CLEAN table)  
• Dimension Tables (DIM_CROP, DIM_LOCATION, DIM_WEATHER)  
• Fact Table (FACT_YIELD)  

Data joined and inserted into Fact table using SQL-based ELT process.
etl.py  → Main automated ETL script  
agriculture_etl_pipeline.ipynb → Development & testing notebook

--------------------------------------------------

STEP 6: ADVANCED SQL ANALYSIS

Implemented:

• CTE (Common Table Expressions)  
• Window Functions  
• Ranking Queries  
• Running Total Analysis  
• Partition-based Analysis  

--------------------------------------------------

STEP 7: APACHE SPARK BATCH PROCESSING

Used PySpark for:

• Distributed batch processing  
• Yield aggregation by Area  
• Trend analysis over years  

--------------------------------------------------

STEP 8: GOVERNANCE & SECURITY

Implemented:

• Role-Based Access Control (RBAC)  
• Data Masking Policy  
• Row-Level Security Policy  

--------------------------------------------------

STEP 9: SNOWFLAKE STORAGE & PERFORMANCE OPTIMIZATION

Implemented:

• Clustering  
• Time Travel  
• Semi-Structured Data Handling (VARIANT)  
• Warehouse Scaling  

--------------------------------------------------

STEP 10: DASHBOARD VISUALIZATION

Power BI dashboard created for:

• Area-wise Yield Analysis  
• Crop-wise Yield Comparison  
• Year-wise Trend Analysis  
• Rainfall Impact Analysis  
• Temperature Impact Analysis  

--------------------------------------------------

HOW TO RUN THE PROJECT

Run ETL Script:
python etl.py

Run Spark Job:
python spark/spark_job.py

--------------------------------------------------

ARCHITECTURE FLOW

Raw CSV Data
    ↓
Python ETL Pipeline (Pandas)
    ↓
Snowflake Data Warehouse (Star Schema)
    ↓
Snowflake Optimization Layer
    ↓
Advanced SQL Analytics
    ↓
Apache Spark Processing
    ↓
RBAC & Governance
    ↓
Power BI Dashboard

--------------------------------------------------