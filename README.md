# Credit_Card_Dashboard
Power BI Dashboard

Project Overview: Develop a comprehensive weekly dashboard for credit card operations, providing real-time insights into key performance metrics and trends. This tool will empower stakeholders to monitor and analyze credit card activities effectively.

## Step 1: Import Data to SQL Database

1. **Prepare CSV File**: Ensure the data in the CSV file is clean and formatted correctly for import.
2. **Create Tables in SQL**: Define the appropriate table schema in the SQL database to store the data.
3. **Import CSV File into SQL**: Use bulk insert or other appropriate methods to load the data into the SQL tables.

## Step 2: DAX Queries

- **AgeGroup**: Categorizes customers based on age.
  ```dax
  AgeGroup = SWITCH(
      TRUE(),
      'public cust_detail'[customer_age] < 30, "20-30",
      'public cust_detail'[customer_age] >= 30 && 'public cust_detail'[customer_age] < 40, "30-40",
      'public cust_detail'[customer_age] >= 40 && 'public cust_detail'[customer_age] < 50, "40-50",
      'public cust_detail'[customer_age] >= 50 && 'public cust_detail'[customer_age] < 60, "50-60",
      'public cust_detail'[customer_age] >= 60, "60+",
      "unknown"
  )

  - **IncomeGroup**: Categorizes customers based on income.
  IncomeGroup = SWITCH(
    TRUE(),
    'public cust_detail'[income] < 35000, "Low",
    'public cust_detail'[income]>= 35000 && 'public cust_detail'[income] < 70000, "Medium",
    'public cust_detail'[income] >= 70000, "High",
    "unknown"
)

Week Number Calculation: Extracts the week number from the date. 
week_num2 = WEEKNUM('public cc_detail'[week_start_date])


Revenue Calculation: Sums up various revenue components.
Revenue = 'public cc_detail'[annual_fees] + 'public cc_detail'[total_trans_amt] + 'public cc_detail'[interest_earned]

Current Week Revenue: Calculates revenue for the current week.
Current_week_Revenue = CALCULATE(
    SUM('public cc_detail'[Revenue]),
    FILTER(
        ALL('public cc_detail'),
        'public cc_detail'[week_num2] = MAX('public cc_detail'[week_num2])
    )
)

Previous Week Revenue: Calculates revenue for the previous week.
Previous_week_Revenue = CALCULATE(
    SUM('public cc_detail'[Revenue]),
    FILTER(
        ALL('public cc_detail'),
        'public cc_detail'[week_num2] = MAX('public cc_detail'[week_num2]) - 1
    )
)

Step 3: Key Insights - Week 53 (31st Dec) Overview YTD
The following insights were derived from the data analysis:

Overall Revenue: The total revenue amounted to $57 million.
Total Interest Earned: $8 million in interest was accrued.
Total Transaction Amount: Transactions totaled $46 million.
Revenue by Gender:
Male customers: $31 million
Female customers: $26 million
Credit Card Performance:
Blue and Silver credit cards accounted for 93% of overall transactions.
Regional Contribution:
The states of Texas, New York, and California contributed to 68% of the total revenue.
Activation and Delinquency Rates:
Activation Rate: 57.5%
Delinquency Rate: 6.06%


