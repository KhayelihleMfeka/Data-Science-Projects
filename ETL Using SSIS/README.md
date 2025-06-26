**Project : Extract Transform & Load (ETL) using SQL Server Integration Services(SSIS) and Visual Studio(VS Studio) : Khayelihle Ngcebo Mfeka**

# Project Overview

**Business Case:**

The business has customer purchase data in local currency, but needs that data converted and needs the Customer contact information with it.

The purchase data is in SQL Server, the currency conversion data is in Excel, and the customer contact information is in a csv file.

The task is to bring this data together in a new SQL Server database for the business.

Below is the complete step-by-step demonstration of the ETL process in SSIS:

To demonstrate the process, I will setup the following:

  1. **Source Database Setup** (*creation of Financial Transcations Table and Customer Details Table on the SQL Server*)
  2. **Excel File Setup** (*creation of an Excel file to be transformed on VS Studio and loaded to our destination SQL Server database*)
  3. **CSV File Setup** (*creation of a flat file to be transformed on VS Studio and loaded to our destination SQL Server database*)
  4. **Data Warehouse Setup** (*creation of a data warehouse(destination), once all the transformations are done the data ready for use will be stored on this database*)

Code to the setups [here]()

The code will give us the following tables:

**Source - SQL Server database - Financial Transactions**

**Source - Excel - exchange_rates.xlsx**

**Source -Flat/Csv - suppliers.csv**

**Destination - SQL Server database - financial_data_warehouse**



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





