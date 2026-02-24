# 🌾 Agriculture Yield Prediction System

-----------------------------------------

 PROJECT DESCRIPTION

This project is an end-to-end Data Engineering pipeline built to analyze agriculture crop yield data using cloud data warehouse and big data tools.

The aim of this project is to:

• Clean and transform raw agriculture data  
• Store data in Snowflake Data Warehouse  
• Perform advanced SQL analysis  
• Process large datasets using Apache Spark  
• Implement data optimization and security  
• Visualize insights using Power BI Dashboard  

-----------------------------------------

TOOLS & TECHNOLOGIES USED

Python          - Data Cleaning (ETL)
Apache Spark    - Batch Processing
Snowflake       - Cloud Data Warehouse
SQL             - Data Analysis
Power BI        - Dashboard
Draw.io         - Architecture Diagram
GitHub          - Project Repository

-----------------------------------------
PROJECT FOLDER STRUCTURE

Agriculture-Yield-Prediction-System
│
├── data
│   ├── raw
│   └── cleaned
│
├── etl
│   └── etl.py
│
├── spark
│   └── spark_job.py
│
├── sql
│   └── snowflake_queries.sql
│
├── architecture
│   └── architecture_diagram.png
│
├── Agriculture_Yield_Dashboard.pbix
└── README.md

-----------------------------------------

⚙️ PROJECT IMPLEMENTATION STEPS

STEP 1: DATA COLLECTION
Agriculture dataset is collected in CSV format containing:
Area, Crop Type, Year, Yield, Rainfall, Temperature, Pesticides usage.

-----------------------------------------

STEP 2: PYTHON ETL PIPELINE
Python (Pandas) is used to:
• Remove unwanted columns  
• Rename column names  
• Handle missing values  
• Clean dataset  

Cleaned dataset is saved as:
cleaned_data.csv

-----------------------------------------

STEP 3: DATA WAREHOUSE DESIGN (STAR SCHEMA)

Snowflake database is created with:

• FACT_YIELD Table  
• DIM_CROP Table  
• DIM_LOCATION Table  
• DIM_WEATHER Table  

-----------------------------------------

STEP 4: DATA LOADING IN SNOWFLAKE

Cleaned dataset is uploaded to Snowflake table:
CLEANED_DATA

-----------------------------------------

STEP 5: ADVANCED SQL ANALYSIS

Following SQL concepts are implemented:

• CTE (Common Table Expressions)  
• Window Functions  
• Ranking  
• Running Total  
• Partitioning  

Used for:
Area-wise yield analysis  
Crop ranking  
Yield trends over years  

-----------------------------------------

STEP 6: APACHE SPARK PROCESSING

Apache Spark is used for:

• Distributed batch processing  
• Aggregation of large datasets  
• Yield analysis by Area and Crop  

-----------------------------------------

STEP 7: SNOWFLAKE OPTIMIZATION

Storage optimization features used:

• Clustering  
• Time Travel  
• Semi-Structured Data (VARIANT)  
• Warehouse Scaling  

-----------------------------------------

STEP 8: SECURITY IMPLEMENTATION

Security is implemented using:

• RBAC (Role Based Access Control)  
• Data Masking Policy  

-----------------------------------------

STEP 9: DASHBOARD VISUALIZATION

Power BI dashboard is created for:

• Area-wise Yield Analysis  
• Crop-wise Yield Comparison  
• Year-wise Trend Analysis  

-----------------------------------------

 ARCHITECTURE

Architecture diagram shows:

• Data Source  
• ETL Pipeline  
• Snowflake Warehouse  
• Optimization Layer  
• Spark Processing  
• Security Layer  
• Power BI Dashboard  

-----------------------------------------

HOW TO RUN THE PROJECT:

Run ETL Script:
python etl/etl.py

Run Spark Job:
python spark/spark_job.py

Run SQL Queries:
Execute snowflake_queries.sql in Snowflake Worksheet

-----------------------------------------


OUTPUT

Interactive dashboard created in Power BI for agriculture yield insights.




