USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'TechHive_cleaned')
BEGIN
    ALTER DATABASE TechHive_cleaned SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TechHive_cleaned;
END;

CREATE DATABASE TechHive_cleaned;
GO

USE TechHive_cleaned;
GO

IF OBJECT_ID('TechHive_cleaned.dbo.orders', 'U') IS NOT NULL
    DROP TABLE TechHive_cleaned.dbo.orders;
GO

CREATE TABLE TechHive_cleaned.dbo.orders (
	customer_id			nvarchar(50),
	order_id			nvarchar(50),
	purchase_date		date,
	product_id			nvarchar(50),
	product_name		nvarchar(100),
	currency			nvarchar(10),
	local_price			float,
	usd_price			float,
	purchase_platform	nvarchar(50),
	brand_name			nvarchar(50),
	product_category	nvarchar(50),
	customer_order_number int,
	year				int,
	month				nvarchar(20)
);
GO

IF OBJECT_ID('TechHive_cleaned.dbo.customers', 'U') IS NOT NULL
    DROP TABLE TechHive_cleaned.dbo.customers;
GO

CREATE TABLE TechHive_cleaned.dbo.customers (
	customer_id				 nvarchar(50),
	marketing_channel		 nvarchar(50),
	account_creation_method  nvarchar(50),
	country_code			 nvarchar(50),
	loyalty_program			 bit,
	created_on				 date
);
GO

IF OBJECT_ID('TechHive_cleaned.dbo.orders', 'U') IS NOT NULL
    DROP TABLE TechHive_cleaned.dbo.orders;
GO

CREATE TABLE TechHive_cleaned.dbo.order_status (
	order_id			nvarchar(50),
	purchase_date		date,
	shipping_date		date,
	delivery_date		date,
	refund_date			date,
	refunded			bit,
	days_to_ship		float,
	shipping_time		float,
	days_to_return		float,
	days_to_order		float
);
GO

IF OBJECT_ID('TechHive_cleaned.dbo.geo_lookup', 'U') IS NOT NULL
    DROP TABLE TechHive_cleaned.dbo.geo_lookup;
GO

CREATE TABLE TechHive_cleaned.dbo.geo_lookup (
	country_code	nvarchar(50),
	region			nvarchar(50)
);
GO
