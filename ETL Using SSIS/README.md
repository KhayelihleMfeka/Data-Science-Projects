**Project : Extract Transform & Load (ETL) using SQL Server Integration Services(SSIS) and Visual Studio(VS Studio) : Khayelihle Ngcebo Mfeka**

# Project Overview

**Business Case:**

The business has customer purchase data in local currency, but needs that data converted and needs the Customer contact information with it.

The purchase data is in SQL Server, the currency conversion data is in Excel, and the customer contact information is in a Csv file.
            
The task is to bring this data together in a new SQL Server database for the business.

Below is the complete step-by-step demonstration of the ETL process in SSIS:

To demonstrate the process, I will setup the following:


1. **Source Database Setup** (*setting up of `financial_transactions_db` database, `dbo.financial_transcations` and `dbo.customer_details` tables*)
   
2. **Excel File Setup** (*setting up `exchange_rates.xlsx` to be transformed on VS Studio and loaded to the destination SQL Server database*)
   
3. **CSV File Setup** (*setting up of `suppliers.csv` to be transformed on VS Studio and loaded to our destination SQL Server database*)

4. **Data Warehouse Setup** (*setting up of `financial_data_warehouse` database and `dbo.financial_analysis` table in the  a data warehouse(destination), once all the transformations are done the data ready for use will be loaded on this database*) -

Code to the setups [here](https://github.com/KhayelihleMfeka/Data-Science-Projects/blob/main/ETL%20Using%20SSIS/Database%20setup.md)

5. **Create a Visiual Studio Project** (*SSIS package `financial_transcations_ETLProject.sln`*).

   components used:

   **Create control flow task**  (*Manages the sequence of tasks (e.g., Execute SQL Task, Data Flow Task, Script Task, File System Task*)
   
   **Data Flow** (*A subsection of the Control Flow that manages the flow of data from sources to destinations, using transformations such as data conversions and lookups.*)
   

    1.**Control flow task** -  exchange_rates - task to get the transformed exchange rates from Excel file to the OLE DB Destination(`financial_data_warehouse`) from                                          `exchange_rates` table.
   
     - *Data flow task* - exchange_rates - Gets Excel file `exchange_rates.xlsx` from path, converted to match data type and lenght of `dbo.exchange_rates` on the                       `financial_data_warehouse` database
  
    2.**Control flow task** -  suppliers - task to get the transformed suppliers from CSV to the OLE DB Destination (`financial_data_warehouse`) from `dbo.suppliers` table.
   
     - *Data flow task* - suppliers - Gets CSV file `suppliers.csv` from path, converted to match data type and lenght of `dbo.suppliers` on the `financial_data_warehouse`              database

    3.**Control flow task** -  customer transcations - Gets dato the OLE DB Destination (`financial_data_warehouse`) from `dbo.suppliers` table.
   
     - *Data flow task* - financial transcations - Gets all data from both `dbo.customer_details` and `dbo.financial_transaction` from `financial_transcations_db` using                JOIN.
     - Lookup exchange rates - lookup currency match with `from_currency` column on `dbo.exchange_rates` on the data warehouse and return exchange rate as output column.No             match redirected to no match ouput.
     - UNION ALL - combine matched and no match entries from the lookup to include all data.
     - Amount usd derived column - derive a column which will multiply the amount and exchange rate to get amount in USD.
     - lookup suppliers - Lookup supplier name from `dbo.suppliers` on the data warehouse and return supplier contact name and number.
     - Multicast - Run with the task and send data to `dbo.financial_analysis` on the data warehouse, also send a list on suppliers with no contact name to a CSV file                   using conditional split.

Below is the ETL Workflow for the project

**ETL Workflow**

- **Extract**:
  - **SQL Server**: Extract financial transactions and customer details from `financial_transactions_db`.
  - **Excel**: Extract exchange rates.
  - **CSV**: Extract supplier information.

- **Transform**:
  - Perform lookups to enrich transaction data with customer and supplier details.
  - For supplier information, perform a lookup using `suppliers.csv` to retrieve the supplier phone number based on `supplier_name`.
  - Convert transaction amounts to a common currency using exchange rates.

- **Load**:
  - Store the transformed data into a data warehouse for financial analysis.
  - **Destination Table**: The final transformed data will be loaded into a table named `financial_analysis` in the `financial_data_warehouse` database.

These datasets will provide a complete environment for demonstrating SSIS workflows, including Control Flow and Data Flow tasks, transformations, error handling, and deployment. 





