# Unit 7 Homework Assignment: Looking for Suspicious Transactions

## Task 1. [Data Modeling](#Data-Modeling):

An ERD is created below following instructions on Quick Database Diagrams for on one-to-one and one-to-many relationships between 
* card holders, credit cards, merchants, merchant categories, transaction dates and amounts

![ERD](Images/ERD.png)
*[Quick Database Diagrams](https://app.quickdatabasediagrams.com/#/d/P2duCE)*
    * [ERD input on website](Code/ERD.txt)
        * where PK indicates a primary key, FK indicates a foreign key, >- indicates many to one, TIMESTAMP records both date and time into PostgresSQL 


## Task 2. [Data Engineering](#Data-Engineering): Create a database schema on PostgreSQL and populate your  database from the CSV files provided.
* Create a database in postgres 12 called "activities_db"
* Use the sql code exported from Quickdatabase Diagrams to create tables [Database schema](Code/table_schemata.sql)
* Import the following five csv files to the tables created correspondingly, checking header and delimiter as ","

### Data Files

* [card_holder.csv](Data/card_holder.csv)
* [credit_card.csv](Data/credit_card.csv)
* [merchant.csv](Data/merchant.csv)
* [merchant_category.csv](Data/merchant_category.csv)
* [transaction.csv](Data/transaction.csv)


## Task 3. [Data Analysis](#Data-Analysis): Analyze the data to identify possible fraudulent transactions.

It's time to identify fraudulent transactions. In this part of the homework assignment, you will analyze the data and then create a report to present your findings. You can use a Jupyter Notebook, a markdown file, or a word processor. Your report should answer the following questions:

* How can you isolate (or group) the transactions of each cardholder?

* Consider the time period 7:00 a.m. to 9:00 a.m.

  * What are the top 100 highest transactions during this time period?

  * Do you see any fraudulent or anomalous transactions?

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

* What are the top 5 merchants prone to being hacked using small transactions?

* Once you have a query that can be reused, create a view for each of the previous queries.

Create a report for fraudulent transactions of some top customers of the firm. To achieve this task, perform a visual data analysis of fraudulent transactions using Pandas, Plotly Express, hvPlot, and SQLAlchemy to create the visualizations.

* Verify if there are any fraudulent transactions in the history of two of the most important customers of the firm. For privacy reasons, you only know that their cardholders' IDs are 18 and 2.

  * Using hvPlot, create a line plot representing the time series of transactions over the course of the year for each cardholder. In order to compare the patterns of both cardholders, create a line plot containing both lines.

  * What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale.

* The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. You are asked to find any anomalous transactions during that period.

  * Using Plotly Express, create a series of six box plots, one for each month, in order to identify how many outliers per month for cardholder ID 25.

  * Do you notice any anomalies? Describe your observations and conclusions.

## Challenge

Another approach to identify fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers.

Read the following articles on outliers detection, and then code a function using Python to identify anomalies for any cardholder.

* [How to Calculate Outliers](https://www.wikihow.com/Calculate-Outliers)

* [Removing Outliers Using Standard Deviation in Python](https://www.kdnuggets.com/2017/02/removing-outliers-standard-deviation-python.html)

* [How to Use Statistics to Identify Outliers in Data](https://machinelearningmastery.com/how-to-use-statistics-to-identify-outliers-in-data/)


### Submission in Answers folder:

* [ERD](Images/ERD.png)

* [Table Schemata](Code/table_schemata.sql)

* [Queries to Detect Fraud](Code/queries.sql)

* [Visual Data Analysis](Code/visual_data_analysis.ipynb).

* [Challenge on Identifying Outliers](Code/challenge.ipynb)


---

# References:
* https://app.quickdatabasediagrams.com/#/d/P2duCE
* https://www.postgresql.org/docs/8.0/functions-datetime.html
* https://stackoverflow.com/questions/31668689/select-timestamp-data-for-specific-time-range-each-day
* https://towardsdatascience.com/detecting-financial-fraud-using-machine-learning-three-ways-of-winning-the-war-against-imbalanced-a03f8815cce9
* https://en.wikipedia.org/wiki/Data_analysis_techniques_for_fraud_detection
* https://www.bluefin.com/support/identifying-fraudulent-transactions/
* https://chargebacks911.com/credit-card-fraud-detection-techniques/
* https://www.fico.com/blogs/5-keys-using-ai-and-machine-learning-fraud-detection
* https://www.w3schools.com/sql/sql_dates.asp
* https://www.practicalecommerce.com/7-telltale-signs-payment-card-fraud
* https://chargebacks911.com/fraud-red-flags/
* https://blog.bluepay.com/how-to-recognize-a-potentially-fraudulent-credit-card-user
* https://www.verifi.com/resources/10-telltale-signs-of-a-fraudulent-order-how-to-stop-chargebacks-before-they-stop-you/
* https://hvplot.holoviz.org/user_guide/Plotting.html
* https://mode.com/blog/postgres-sql-date-functions
* https://docs.python.org/3.3/library/random.html#random.sample
* https://stackoverflow.com/questions/23199796/detect-and-exclude-outliers-in-pandas-data-frame
* http://www.itl.nist.gov/div898/handbook/prc/section1/prc16.htm
* https://www.shanelynn.ie/select-pandas-dataframe-rows-and-columns-using-iloc-loc-and-ix/
* https://medium.com/datadriveninvestor/finding-outliers-in-dataset-using-python-efc3fce6ce32