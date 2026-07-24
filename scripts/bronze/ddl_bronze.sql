/*
===============================================================================
Script Purpose
===============================================================================
This script creates all tables required for the Bronze layer of the Data
Warehouse.

The script performs the following tasks:
1. Checks whether each Bronze table already exists.
2. Drops the existing table (if present) to avoid conflicts.
3. Recreates the table with the required structure.
4. Defines the data types for each column based on the source files.

Tables Created
--------------
CRM Tables:
- bronze.crm_cust_info      : Stores raw customer information.
- bronze.crm_prd_info       : Stores raw product information.
- bronze.crm_sales_details  : Stores raw sales transaction data.

ERP Tables:
- bronze.erp_loc_a101       : Stores customer location information.
- bronze.erp_cust_az12      : Stores customer demographic information.
- bronze.erp_px_cat_g1v2    : Stores product category and maintenance data.

Notes
-----
- These tables are part of the Bronze layer (raw data layer) in the Medallion
  Architecture.
- Data is loaded into these tables using the `bronze.load_bronze` stored
  procedure.
- No data cleansing, validation, or transformations are performed at this
  stage. The tables store data exactly as received from the source systems.
===============================================================================
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;


CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);


IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;



CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);


IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;




CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);



IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2




CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
