**Project : Extract Transform & Load (ETL) using SQL Server Integration Services(SSIS) and Visual Studio(VS Studio) : Khayelihle Ngcebo Mfeka**

# Project Overview

**Business Case:**

The business has customer purchase data in local currency, but needs that data converted and needs the Customer contact information with it.

The purchase data is in SQL Server, the currency conversion data is in Excel, and the customer contact information is in a csv file.

The task is to bring this data together in a new SQL Server database for the business.

Below is the complete step-by-step demonstration of the ETL process in SSIS:

To demonstrate the process, I will setup the following:


1. **Source Database Setup** (*setting up of `financial_transactions_db` database, `dbo.financial_transcations` and `dbo.customer_details` tables*)
   
2. **Excel File Setup** (*setting up `exchange_rates.xlsx` to be transformed on VS Studio and loaded to the destination SQL Server database*)
   
3. **CSV File Setup** (*setting up of `suppliers.csv` to be transformed on VS Studio and loaded to our destination SQL Server database*)

4. **Data Warehouse Setup** (*setting up of `financial_data_warehouse` database and `dbo.financial_analysis` table in the  a data warehouse(destination), once all the transformations are done the data ready for use will be loaded on this database*) -

Code to the setups [here](https://github.com/KhayelihleMfeka/Data-Science-Projects/blob/main/ETL%20Using%20SSIS/Database%20setup.md)

5. **Create a Visiual Studio Project** (*SSIS package*) `financial_transcations_ETLProject.sln`
components used:
      1. **Create control flow task**  (*Manages the sequence of tasks (e.g., Execute SQL Task, Data Flow Task, Script Task, File System Task*)

         1.`exchange_rates ` data flow task created - task to get the transformed exchange rates from Excel the OLE DB Destination(`financial_data_warehouse`) exchange rates table
         2.`suppliers` data flow task created- task to get the tranmsformed suppliers table from a Csv File to OLE DB Destination(`financial_data_warehouse`) suppliers table)





      3. **Data Flow** (*A subsection of the Control Flow that manages the flow of data from sources to destinations, using transformations such as data conversions and lookups.*)
     

* Suppliers flat file - Conversion done to match data warehouse - Stored OLE DB Destination
* Exchange rate Excel File - Conversion done to match data warehouse - Stored OLE DB Destination
* **Customer Transcations Task** - **OLE DB Source**(*JOIN Financial Transcations and Customer Details Tables*) - **Lookup the Exchange Rate** (*currency - from currency and return exchange rates*)- **UNION matched and No match outputs** - **Derive column(*amount*) to convert amount using the exchange rate** - **lookup Suppliers** (*using supplier name and bring back contact name and phone*)
* **MultiCast** (*no match suppliers go to OLE DB Destination and NULLS are split using Conditional Split and sent to Flat file destination with report of missing suppliers*)



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





