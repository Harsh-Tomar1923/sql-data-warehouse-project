```sql
/*
===============================================================================
Script Purpose
===============================================================================
This script initializes the Data Warehouse environment by:

1. Creating a new database named `DataWarehouse`.
2. Creating three schemas based on the Medallion Architecture:
   - Bronze: Stores raw data ingested from source systems.
   - Silver: Stores cleaned, validated, and transformed data.
   - Gold: Stores business-ready, aggregated, and reporting data.
3. Providing a structured foundation for ETL/ELT pipelines and analytics.

Execution Order:
1. Run this script once to create the database and schemas.
2. Use the Bronze schema for data ingestion.
3. Use the Silver schema for data transformation.
4. Use the Gold schema for reporting and business intelligence.
===============================================================================
*/
```



-- Switch to the master database to perform administrative tasks
USE master;

-- Create a new database named DataWarehouse
CREATE DATABASE DataWarehouse;

-- Switch to the newly created DataWarehouse database
USE DataWarehouse;

-- Create the Bronze schema
-- Stores raw data exactly as received from source systems
CREATE SCHEMA bronze;

-- Create the Silver schema
-- Stores cleaned, validated, and transformed data
CREATE SCHEMA silver;

-- Create the Gold schema
-- Stores business-ready, aggregated, and analytics-friendly data
CREATE SCHEMA gold;
