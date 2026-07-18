# World-Layoffs-SQL-Project

## Overview

The objective is to clean raw layoff data, perform exploratory data analysis, and derive meaningful business insights using SQL. 

The project is divided into two main phases:
1. Data Cleaning
2. Exploratory Data Analysis (EDA)

---

## Dataset

- Source: Kaggle - World Layoffs Dataset
- Records: 2361
- Time Period: March 2020 - March 2023
- Fields:
  - Company
  - Industry
  - Country
  - Total Laid Off
  - Percentage Laid Off
  - Date
  - Stage
  - Funds Raised

---

## Tools Used

- MySQL 8.0
- MySQL Workbench
- Git
- GitHub

---

## Data Cleaning Process

The following steps were performed:

- Removed duplicate records
- Standardized text values
- Converted date columns to DATE format
- Handled NULL and blank values
- Removed unnecessary columns

---

## Exploratory Data Analysis

Business questions answered:

1. What is the date range covered by the dataset?
2. Which companies laid off 100% of their workforce?
3. Which companies experienced the largest number of layoffs?
4. Which industries experienced the highest number of layoffs?
5. Which company stages were most affected by layoffs?
6. Which countries experienced the highest number of layoffs?
7. How did layoffs evolve over time by year?
8. What were the monthly layoff trends?
9. What is the rolling total of layoffs over time?
10. Which companies had the highest layoffs in each year?

---

## Key Findings

1. The dataset covers layoffs occurring between March 2020 and March 2023.
2. Amazon recorded the highest number of layoffs, affecting more than 18,000 employees, followed by Google, Meta, Salesforce, and Microsoft.
3. The United States experienced the largest number of layoffs by a significant margin, with over 256,000 employees affected.
4. Consumer and Retail were the industries most impacted by layoffs, indicating substantial workforce reductions across customer-facing businesses.
5. Post-IPO companies accounted for the largest share of layoffs, suggesting that even mature publicly traded companies were heavily affected.
6. Several companies laid off 100% of their workforce despite raising substantial amounts of funding. For example:
   - Britishvolt ($2.4B raised)
   - Quibi ($1.8B raised)
   - Deliveroo Australia ($1.7B raised)
   - Katerra ($1.6B raised)
   - BlockFi ($1.0B raised)
7. Layoffs increased considerably during the 2022–2023 period, reflecting broader economic uncertainty and changes in the technology sector.
8. Monthly rolling totals reveal that layoffs were not isolated events but occurred continuously across multiple industries over several years.
9. The analysis shows that layoffs impacted companies at all stages, from startups to publicly traded organizations, highlighting the widespread nature of the global workforce reductions.

---

## Key SQL Concepts Used

- CTEs
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions
- GROUP BY
- JOINs
- Date Functions
- Data Cleaning Techniques

## Project Structure

```text
World-Layoffs-SQL-Project
│
├── layoffs.csv
├── 01_import_data.sql
├── 02_data_cleaning.sql
├── 03_exploratory_data_analysis.sql
└── README.md
```

## File Description

- `layoffs.csv`
  - Original dataset containing global layoff records from 2020 to 2023.
    
- `01_import_data.sql`
  - Creates the `layoffs` table and imports the dataset into MySQL.

- `02_data_cleaning.sql`
  - Removes duplicates, standardizes values, handles NULLs, and prepares the dataset for analysis.

- `03_exploratory_data_analysis.sql`
  - Performs exploratory data analysis and answers key business questions related to global layoffs.

- `README.md`
  - Provides project documentation, business questions, key findings, and repository information.

---

## Future Improvements

Potential enhancements for this project include:
- Building an interactive dashboard using Tableau or Power BI.
- Performing predictive analysis on layoff trends.

---

## Author

Sean Kenneth Handoyo

- GitHub: https://github.com/seankh06
- LinkedIn: https://www.linkedin.com/in/seankennethhandoyo/
