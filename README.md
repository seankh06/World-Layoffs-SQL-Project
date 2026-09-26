# World-Layoffs-SQL-Project

## Overview

The objective is to clean raw layoff data, perform exploratory data analysis, and derive meaningful business insights using SQL. 

The project is divided into three main phases:
1. Data Cleaning
2. Exploratory Data Analysis (EDA)
3. Funding Efficiency Analysis

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
11. Does layoff intensity relative to capital raised differ by funding stage, and is any apparent pattern real once sample size is controlled for?

---

## Key Findings

1. The dataset covers layoffs occurring between March 2020 and March 2023.
2. Amazon recorded the highest number of layoffs, affecting more than 18,000 employees, followed by Google, Meta, Salesforce, and Microsoft.
3. The United States experienced the largest number of layoffs by a significant margin, with over 256,000 employees affected.
4. Consumer and Retail were the industries most impacted by layoffs, indicating substantial workforce reductions across customer-facing businesses.
5. Post-IPO companies accounted for ~53% of all layoffs in the dataset (204,132 of ~383,700 total) — more than the next five funding stages combined (Unknown, Acquired, Series C, Series D, and Series B). This indicates large, established, publicly traded companies drove the bulk of layoffs during this period, not early-stage startups, which runs counter to the common assumption that layoffs are primarily a startup phenomenon.
6. Controlling for sample size by averaging layoffs-per-$1M-raised within each funding stage (rather than ranking individual companies), Series A–C startups averaged roughly 2.7–3x more layoffs per dollar raised than later-stage companies (Series F and beyond). This held up as a genuine step-down across the funding lifecycle (Series A: 0.77, B: 0.86, C: 0.63, declining to 0.20–0.29 for Series F–J), not just a small-sample artifact — suggesting earlier-stage, growth-phase startups cut deeper relative to capital raised, likely reflecting thinner margins for error before reaching sustainable unit economics. Post-IPO, Acquired, and Unknown-stage companies were excluded from this analysis since their "funds raised" figures don't reflect real venture funding (e.g., large public companies with only $1–2M recorded).
7. Several companies laid off 100% of their workforce despite raising substantial amounts of funding. For example:
   - Britishvolt ($2.4B raised)
   - Quibi ($1.8B raised)
   - Deliveroo Australia ($1.7B raised)
   - Katerra ($1.6B raised)
   - BlockFi ($1.0B raised)
8. Layoffs increased considerably during the 2022–2023 period, reflecting broader economic uncertainty and changes in the technology sector.
9. Monthly rolling totals reveal that layoffs were not isolated events but occurred continuously across multiple industries over several years.
10. The analysis shows that layoffs impacted companies at all stages, from startups to publicly traded organizations, highlighting the widespread nature of the global workforce reductions.

---

## Key SQL Concepts Used

- CTEs
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions (SUM, AVG, COUNT)
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
- Extending the funding-efficiency analysis by country, to check whether the stage pattern holds globally or is concentrated in specific regions.

---

## Author

Sean Kenneth Handoyo

- GitHub: https://github.com/seankh06
- LinkedIn: https://www.linkedin.com/in/seankennethhandoyo/
