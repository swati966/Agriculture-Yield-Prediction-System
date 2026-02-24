#  Agriculture Yield Prediction System

## Project Description

This project is an end-to-end Data Engineering pipeline built to analyze agricultural crop yield data using cloud data warehouse and big data technologies.

The objective of this project is to:

- Design a Data Warehouse using Star Schema
- Build Python-based ETL pipeline
- Process large datasets using Apache Spark
- Store and analyze data using Snowflake
- Perform advanced analytical queries using SQL
- Implement secure data access using RBAC
- Apply Snowflake optimization techniques
- Visualize insights using Power BI Dashboard

---

## Tools & Technologies Used

| Technology | Purpose |
|------------|--------|
| Python | ETL Pipeline |
| Apache Spark | Batch Processing |
| Snowflake | Cloud Data Warehouse |
| SQL | Analytical Queries |
| Power BI | Dashboard Visualization |
| GitHub | Version Control |



## ⚙️ Project Implementation Steps

### 1️⃣ Data Collection
Agricultural dataset collected in CSV format containing:

- Area  
- Crop Type  
- Year  
- Yield  
- Rainfall  
- Temperature  
- Pesticides Usage  

---

### 2️⃣ Python ETL Pipeline
Python (Pandas) is used to:

- Remove unwanted columns  
- Rename column names  
- Handle missing values  
- Clean dataset  

Cleaned dataset is stored as:
cleaned_data.csv


---

### 3️⃣ Data Warehouse Design (Star Schema)

Designed a Star Schema consisting of:

**Dimension Tables**
- DIM_CROP  
- DIM_LOCATION  
- DIM_WEATHER  

**Fact Table**
- FACT_YIELD  

---

### 4️⃣ Snowflake Cloud Warehouse

- Created AGRI_DB Database  
- Created AGRI_SCHEMA  
- Loaded processed dataset into Snowflake  
- Enabled analytical querying using warehouse tables  

---

### 5️⃣ Advanced SQL Analysis

Implemented:

- CTE (Common Table Expressions)  
- Window Functions  
- Ranking Queries  
- Running Total Analysis  
- Partition-based Analysis  

---

### 6️⃣ Apache Spark Batch Processing

Used PySpark for:

- Distributed batch processing  
- Yield aggregation by Area  
- Trend analysis over years  

---

### 7️⃣ Security Implementation

Implemented:

- Role-Based Access Control (RBAC)  
for secure data access in Snowflake  

---

### 8️⃣ Snowflake Optimization Techniques Implemented

To enhance storage efficiency and analytical query performance in Snowflake, the following techniques were implemented:

- **Clustering**  
  Applied clustering keys on frequently queried columns to improve query performance.

- **Time Travel**  
  Utilized Snowflake Time Travel feature for historical data querying and recovery.

- **Semi-Structured Data Handling**  
  Implemented VARIANT data type to store and query semi-structured JSON data.

---

### 9️⃣ Dashboard Visualization

Power BI dashboard created for:

- Area-wise Yield Analysis  
- Crop-wise Yield Comparison  
- Year-wise Trend Analysis  

---

##  How to Run the Project

Run ETL Script:
```bash
python etl/etl.py

Run Spark Job:
python spark/spark_job.py
