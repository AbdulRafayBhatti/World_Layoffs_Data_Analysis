# 🌍 Global Layoffs Data Cleaning & Exploratory Data Analysis Using SQL

An end-to-end SQL analytics project focused on cleaning, transforming, and analyzing a global layoffs dataset using MySQL.

This project demonstrates real-world data analyst workflows including:
- Data cleaning
- Data transformation
- Exploratory Data Analysis (EDA)
- Business insight generation
- SQL analytics techniques

---

# 📌 Project Overview

The dataset contains global layoffs information from companies across multiple industries and countries.

The raw data included:
- Duplicate records
- Missing values
- Inconsistent formatting
- Invalid data types
- Unstructured categorical values

The project transforms the raw dataset into a clean analytical dataset and performs SQL-based exploratory analysis to uncover business insights and layoff trends.

---

# 💼 Business Problem

Organizations, investors, and analysts need to understand:
- Which companies experienced the highest layoffs
- Which industries were most affected
- Layoff trends over time
- Country-wise layoff impact
- Startup funding stage risks
- Economic downturn patterns

This project helps answer those business questions using SQL.

---

# 🗂 Dataset Information

The dataset contains global company layoff records including:
- Company information
- Industry
- Location
- Layoff counts
- Layoff percentages
- Funding stages
- Dates
- Funds raised

---

# 🧱 Dataset Schema

| Column | Description |
|---|---|
| company | Company name |
| location | Company location |
| industry | Industry sector |
| total_laid_off | Number of employees laid off |
| percentage_laid_off | Percentage of workforce laid off |
| date | Layoff announcement date |
| stage | Company funding stage |
| country | Country name |
| funds_raised_millions | Total funds raised in millions |

---

# 🏗 Project Architecture

```text
Raw Dataset
     │
     ▼
Data Cleaning Layer
     │
     ├── Duplicate Removal
     ├── Standardization
     ├── Missing Value Handling
     ├── Date Conversion
     └── Invalid Row Filtering
     │
     ▼
Cleaned Dataset
     │
     ▼
Exploratory Data Analysis
     │
     ├── Company Analysis
     ├── Industry Analysis
     ├── Country Analysis
     ├── Time-Series Analysis
     ├── Stage Analysis
     └── Trend Analysis
     │
     ▼
Business Insights
```

---

# 🧹 Data Cleaning Workflow

## ✔ Created Staging Tables
Used staging tables to preserve raw data integrity.

## ✔ Removed Duplicate Records
Used `ROW_NUMBER()` with window functions to identify duplicates.

## ✔ Standardized Data
- Trimmed company names
- Standardized industry categories
- Fixed country formatting

## ✔ Converted Date Formats
Used `STR_TO_DATE()` to convert text dates into SQL DATE format.

## ✔ Handled Missing Values
- Converted blanks to NULL
- Filled missing industries using self joins

## ✔ Removed Invalid Rows
Deleted records with missing layoff metrics.

---

# 📊 Before vs After Cleaning

| Issue | Status |
|---|---|
| Duplicate Records | Removed |
| Missing Values | Handled |
| Invalid Dates | Converted |
| Formatting Issues | Fixed |
| Unnecessary Rows | Removed |

---

# 📊 Exploratory Data Analysis Workflow

The cleaned dataset was analyzed to answer key business questions.

---

## 🔹 Total Layoffs by Company

Identified companies with the highest workforce reductions.

### Business Insight
Large tech companies experienced the highest layoffs during economic slowdowns.

---

## 🔹 Layoffs by Industry

Analyzed which industries were most impacted.

### Business Insight
Technology and consumer sectors experienced major workforce reductions.

---

## 🔹 Layoffs by Country

Compared layoffs across countries.

### Business Insight
The United States recorded the highest layoffs among all countries.

---

## 🔹 Yearly Layoff Trends

Analyzed layoffs by year.

### Business Insight
Layoffs increased significantly during economic uncertainty periods.

---

## 🔹 Monthly Layoff Trends

Performed month-over-month layoff analysis.

### Business Insight
Certain months showed major spikes in layoffs, indicating economic instability periods.

---

## 🔹 Rolling Total Analysis

Used window functions to calculate cumulative layoffs over time.

### Business Insight
Cumulative layoffs steadily increased across the observed timeline.

---

## 🔹 Funding Stage Analysis

Analyzed layoffs based on company funding stage.

### Business Insight
Late-stage companies reported larger layoffs due to operational restructuring.

---

## 🔹 Top Companies by Year

Used ranking functions to identify the top companies with highest layoffs per year.



---

# 🧠 Key SQL Techniques Used

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions
- Rolling Totals
- Self JOINs
- Date Functions
- String Functions
- Data Transformation
- Data Cleaning

---

# 🛠 SQL Concepts Demonstrated

| Concept | Usage |
|---|---|
| CTEs | Modular query building |
| Window Functions | Ranking & rolling totals |
| Aggregate Functions | Trend analysis |
| Self JOIN | Missing value handling |
| Date Functions | Time-series analysis |
| String Functions | Data standardization |

---

# 📈 EDA Highlights

- Top companies by layoffs
- Industry-wise layoffs
- Country-wise layoffs
- Yearly trends
- Monthly trends
- Rolling totals
- Funding stage analysis
- Top 5 companies per year

---

# 📦 Project Structure

```text
Global-Layoffs-SQL-Analysis/
│
├── README.md
│
├── sql/
│   ├── data_cleaning.sql
│   └── exploratory_data_analysis.sql
│
└── dataset/
    ├── layoffs.csv
    └── layoffs_cleaned.csv  ← Final cleaned dataset (from layoffs_staging1)
```

---

# ⚙️ Technology Stack

- MySQL
- SQL
- GitHub
- CSV Dataset

---

# 🎯 Final Outcomes

The project successfully:
- Cleaned messy real-world data
- Built analysis-ready datasets
- Generated business insights
- Demonstrated advanced SQL skills
- Simulated real analyst workflows

---

# 🚀 Use Cases

This project can support:
- Business Intelligence
- Workforce analysis
- Economic trend analysis
- Executive reporting
- Dashboard development
- Data science preprocessing

---

# 📚 Learning Outcomes

Through this project, the following skills were strengthened:
- SQL Data Cleaning
- Data Transformation
- Exploratory Data Analysis
- Window Functions
- Business Analysis
- Analytical Thinking
- GitHub Documentation

---

# 🔮 Future Improvements

Possible future enhancements:
- Power BI dashboard
- Tableau dashboard
- Python EDA
- Predictive analytics
- SQL stored procedures
- Automated ETL workflows

---

# 🙌 Acknowledgment

Special thanks to:

## 🎓 Alex The Analyst

YouTube Channel: https://www.youtube.com/@AlexTheAnalyst

for providing valuable SQL and data analytics learning resources.

---

# 👨‍💻 Author

## Abdul Rafay Bhatti
Aspiring Data Analyst | SQL Enthusiast | Data Analytics Learner
