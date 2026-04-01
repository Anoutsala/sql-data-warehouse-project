/*
SCRIPT PURPOSE: 
Initialize/Reset the Medallion Data Warehouse Environment.

DESCRIPTION:
1. Resets the environment by dropping the existing 'DataWarehouse' database.
2. Recreates the 'DataWarehouse' database from scratch.
3. Initializes the core Medallion schemas (Bronze, Silver, Gold).

!!! WARNING !!!
This script will DROP the ENTIRE 'DataWarehouse' database if it exists. 
All data and tables will be PERMANENTLY DELETED. 
Ensure you have a backup plan before executing.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
  END;
GO

-- Create 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
