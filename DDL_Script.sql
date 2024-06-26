use tpcds;

-- Create INTERMEDIATE schema for Customer Snapshot Table
CREATE OR REPLACE SCHEMA INTERMEDIATE;

-- Creating Customer Snapshot Table in the INTERMEDIATE schema
CREATE OR REPLACE TABLE TPCDS.INTERMEDIATE.CUSTOMER_SNAPSHOT (
   C_SALUTATION VARCHAR(16777216),
   C_PREFERRED_CUST_FLAG VARCHAR(16777216),
   C_FIRST_SALES_DATE_SK NUMBER(38, 0),
   C_CUSTOMER_SK NUMBER(38, 0),
   C_LOGIN VARCHAR(16777216),
   C_CURRENT_CDEMO_SK NUMBER(38, 0),
   C_FIRST_NAME VARCHAR(16777216),
   C_CURRENT_HDEMO_SK NUMBER(38, 0),
   C_CURRENT_ADDR_SK NUMBER(38, 0),
   C_LAST_NAME VARCHAR(16777216),
   C_CUSTOMER_ID VARCHAR(16777216),
   C_LAST_REVIEW_DATE_SK NUMBER(38, 0),
   C_BIRTH_MONTH NUMBER(38, 0),
   C_BIRTH_COUNTRY VARCHAR(16777216),
   C_BIRTH_YEAR NUMBER(38, 0),
   C_BIRTH_DAY NUMBER(38, 0),
   C_EMAIL_ADDRESS VARCHAR(16777216),
   C_FIRST_SHIPTO_DATE_SK NUMBER(38, 0),
   START_DATE TIMESTAMP_NTZ(9),
   END_DATE TIMESTAMP_NTZ(9)
);

-- Create ANALYTICS schema that works as Product schema
CREATE OR REPLACE SCHEMA ANALYTICS;

-- Create Final Customer_Dim Table in ANALYTICS schema
CREATE OR REPLACE TABLE TPCDS.ANALYTICS.CUSTOMER_DIM (
   SALUTATION VARCHAR(16777216),
   PREFERRED_CUST_FLAG VARCHAR(16777216),
   FIRST_SALES_DATE_SK NUMBER(38, 0),
   CUSTOMER_SK NUMBER(38, 0),
   LOGIN VARCHAR(16777216),
   CURRENT_CDEMO_SK NUMBER(38, 0),
   FIRST_NAME VARCHAR(16777216),
   CURRENT_HDEMO_SK NUMBER(38, 0),
   CURRENT_ADDR_SK NUMBER(38, 0),
   LAST_NAME VARCHAR(16777216),
   CUSTOMER_ID VARCHAR(16777216),
   LAST_REVIEW_DATE_SK NUMBER(38, 0),
   BIRTH_MONTH NUMBER(38, 0),
   BIRTH_COUNTRY VARCHAR(16777216),
   BIRTH_YEAR NUMBER(38, 0),
   BIRTH_DAY NUMBER(38, 0),
   EMAIL_ADDRESS VARCHAR(16777216),
   FIRST_SHIPTO_DATE_SK NUMBER(38, 0),
   STREET_NAME VARCHAR(16777216),
   SUITE_NUMBER VARCHAR(16777216),
   STATE VARCHAR(16777216),
   LOCATION_TYPE VARCHAR(16777216),
   COUNTRY VARCHAR(16777216),
   ADDRESS_ID VARCHAR(16777216),
   COUNTY VARCHAR(16777216),
   STREET_NUMBER VARCHAR(16777216),
   ZIP VARCHAR(16777216),
   CITY VARCHAR(16777216),
   GMT_OFFSET FLOAT,
   DEP_EMPLOYED_COUNT NUMBER(38, 0),
   DEP_COUNT NUMBER(38, 0),
   CREDIT_RATING VARCHAR(16777216),
   EDUCATION_STATUS VARCHAR(16777216),
   PURCHASE_ESTIMATE NUMBER(38, 0),
   MARITAL_STATUS VARCHAR(16777216),
   DEP_COLLEGE_COUNT NUMBER(38, 0),
   GENDER VARCHAR(16777216),
   BUY_POTENTIAL VARCHAR(16777216),
   VEHICLE_COUNT NUMBER(38, 0),
   INCOME_BAND_SK NUMBER(38, 0),
   LOWER_BOUND NUMBER(38, 0),
   UPPER_BOUND NUMBER(38, 0)
);

-- Create WEEKLY_SALES_INVENTORY Table in ANALYTICS schema  for summarizing and analyzing the data on a weekly basis. 
CREATE OR REPLACE TABLE TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY (
   WAREHOUSE_SK NUMBER(38, 0),
   ITEM_SK NUMBER(38, 0),
   SOLD_WK_SK NUMBER(38, 0),
   SOLD_WK_NUM NUMBER(38, 0),
   SOLD_YR_NUM NUMBER(38, 0),
   SUM_QTY_WK NUMBER(38, 0),
   SUM_AMT_WK FLOAT,
   SUM_PROFIT_WK FLOAT,
   AVG_QTY_DY NUMBER(38, 6),
   INV_QTY_WK NUMBER(38, 0),
   WKS_SPLY NUMBER(38, 6),
   LOW_STOCK_FLG_WK BOOLEAN
);

-- Create Daily_SALES_INVENTORY Table in ANALYTICS schema
CREATE OR REPLACE TABLE TPCDS.INTERMEDIATE.DAILY_AGGREGATED_SALES (
    WAREHOUSE_SK NUMBER(38, 0),
    ITEM_SK NUMBER(38, 0),
    SOLD_DATE_SK NUMBER(38, 0),
    SOLD_WK_NUM NUMBER(38, 0),
    SOLD_YR_NUM NUMBER(38, 0),
    DAILY_QTY NUMBER(38, 0),
    DAILY_SALES_AMT FLOAT,
    DAILY_NET_PROFIT FLOAT
);
-- Clone tables in ANALYTICS schema from the RAW schema
CREATE OR REPLACE TABLE TPCDS.ANALYTICS.ITEM_DIM CLONE TPCDS.RAW.ITEM;
CREATE OR REPLACE TABLE TPCDS.ANALYTICS.WAREHOUSE_DIM CLONE TPCDS.RAW.WAREHOUSE;
CREATE OR REPLACE TABLE TPCDS.ANALYTICS.DATE_DIM CLONE TPCDS.RAW.DATE  
