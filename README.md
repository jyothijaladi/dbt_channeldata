Customer Purchase Analytics DBT Project
This project is built using dbt (Data Build Tool) to model a customer purchase and visit analytics pipeline. It leverages raw data from a PostgreSQL warehouse (such as NeonDB) to create well-structured dimensional models and fact tables suitable for analytics and reporting.

 Models
This dbt project includes the following models:

Staging Models:
stg_channels.sql: Processes raw channel data.

stg_customers.sql: Processes raw customer data.

stg_products.sql: Processes raw product data.

stg_purchase_history.sql: Processes raw purchase history data.

stg_visit_history.sql: Processes raw visit history data.

Dimension Models:
dim_channels.sql: Contains channel information with a surrogate key sk_channel.

dim_customers.sql: Contains customer information with a surrogate key sk_customer.

dim_products.sql: Contains product information with a surrogate key sk_product.

dim_date.sql: Contains date dimension data generated for a range of dates.

Fact Models:
fct_purchase_history.sql: Contains facts related to purchase history, joined with dimensions like customer, product, and channel.

fct_visit_history.sql: Contains facts related to visit history, joined with dimensions like customer and channel.

Dependencies
This project uses the following dbt packages:

dbt_utils for helper functions (e.g., surrogate key generation)

dbt_date for generating date dimensions

To install the dependencies, run:

dbt deps

Run Models:
To run all the models
dbt run


Folder Structure Details
models/staging/
This folder contains the raw staging models that clean and prepare data before transforming it into dimensional structures. These models include customer data, product data, channel data, and purchase & visit history data.

models/marts/
This folder contains dimension and fact models, which are the core of the analytics pipeline. The fact tables contain the aggregated metrics (like total sales) while the dimension tables provide context (like customers, products, channels).

