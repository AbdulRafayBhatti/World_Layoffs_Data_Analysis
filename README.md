# Layoffs Data Cleaning Using SQL 

A **SQL data cleaning project** that transforms a raw global layoffs dataset into a clean, structured, and analysis-ready dataset.

This project demonstrates professional-level data preprocessing techniques used in real data analytics workflows.

---

# 📊 Overview

The dataset contains global company layoffs data with inconsistencies such as:

- Duplicate records  
- Missing values  
- Unstructured text fields  
- Incorrect data types  
- Inconsistent formatting  

This project applies SQL-based cleaning techniques to convert it into a **high-quality analytical dataset**.

---

# 🗂 Dataset Schema

| # | Column | Description |
|---|---|---|
| 1 | company | Company name |
| 2 | location | Company location |
| 3 | industry | Industry sector |
| 4 | total_laid_off | Number of employees laid off |
| 5 | percentage_laid_off | Percentage of workforce laid off |
| 6 | date | Layoff announcement date |
| 7 | stage | Company funding stage |
| 8 | country | Country of company |
| 9 | funds_raised_millions | Total funds raised |

---

# ⚙️ Data Cleaning Pipeline

```text
Raw Dataset
     │
     ▼
Staging Table Creation (layoffs_staging)
     │
     ▼
Duplicate Detection (ROW_NUMBER)
     │
     ▼
Cleaned Staging Table (layoffs_staging1)
     │
     ▼
Standardization
  ├── Trim company names
  ├── Normalize industry values
  ├── Fix country formatting
     │
     ▼
Data Type Conversion
  ├── Convert date → DATE format
     │
     ▼
Missing Value Handling
  ├── Fill industry using company mapping
     │
     ▼
Filtering Invalid Rows
  ├── Remove NULL layoffs records
     │
     ▼
Final Clean Dataset (layoffs_Cleaned.csv)
```

---

# 🧰 Technology Stack

- 🗄 MySQL — Data Cleaning & Transformation  
- 🧠 SQL Window Functions — Duplicate detection  
- 🔍 CTEs — Data preprocessing  
- 🧹 String Functions — Data standardization  
- 📅 Date Functions — Date conversion  
- ⚡ GitHub — Version control & hosting  

---

# 🧪 Key SQL Techniques

- `ROW_NUMBER()` for duplicate detection  
- Common Table Expressions (CTEs)  
- Self JOIN for missing value imputation  
- `STR_TO_DATE()` for date conversion  
- `TRIM()` for text cleaning  
- Conditional DELETE operations  
- Table modification using `ALTER TABLE`  

---

# 🧼 Data Cleaning Workflow

## 🔹 1. Staging Layer

A staging table is created to preserve raw data integrity.

```sql
CREATE TABLE layoffs_staging LIKE layoffs;
INSERT INTO layoffs_staging SELECT * FROM layoffs;
```

---

## 🔹 2. Duplicate Detection

Duplicates are identified using:

```sql
ROW_NUMBER() OVER (
PARTITION BY company, location, industry,
total_laid_off, percentage_laid_off,
date, stage, country, funds_raised_millions
)
```

---

## 🔹 3. Duplicate Removal

Only rows where `row_num = 1` are retained.

---

## 🔹 4. Standardization

- Company names cleaned using `TRIM()`  
- Industry values unified (e.g., Crypto variations → Crypto)  
- Country formatting fixed  

---

## 🔹 5. Date Conversion

```sql
STR_TO_DATE(date, '%m/%d/%Y')
```

Converted string dates into proper SQL DATE format.

---

## 🔹 6. Missing Value Handling

- Blank industries converted to `NULL`  
- Missing values filled using company-based matching  

---

## 🔹 7. Filtering Invalid Data

Removed rows where:

- `total_laid_off IS NULL`
- `percentage_laid_off IS NULL`

---

# 📈 Before vs After Cleaning

| Issue | Status |
|---|---|
| Duplicate Records | ❌ Removed |
| Inconsistent Formatting | ❌ Fixed |
| Invalid Date Types | ❌ Converted |
| Missing Values | ❌ Handled |
| Irrelevant Rows | ❌ Removed |

---

# 📦 Project Structure

```text
Layoffs-SQL-Data-Cleaning/
│
├── README.md
├── layoffs_cleaning.sql
├── dataset/
│   ├── layoffs.csv
│   └── layoffs_Cleaned.csv   ← Final cleaned dataset (from layoffs_staging1)
```

---

# 🎯 Final Output

The dataset is now:

✔ Clean  
✔ Structured  
✔ Analysis-ready  
✔ Visualization-friendly  
✔ Business intelligence ready  

---

# 🚀 Use Cases

This dataset can now be used for:

- 📊 Exploratory Data Analysis (EDA)  
- 📉 Layoff trend analysis  
- 📈 Business dashboards  
- 🧠 Data science modeling  
- 📌 Company benchmarking  

---

# 💡 Design Philosophy

This project follows a **multi-layer data cleaning architecture**:

Raw Data → Staging → Transformation → Final Dataset

This ensures:
- Data integrity  
- Reproducibility  
- Scalability  
- Real-world analytics readiness  

---

# 🙌 Acknowledgment

Special thanks to:

## 🎓 Alex The Analyst

YouTube Channel: https://www.youtube.com/@AlexTheAnalyst

for providing excellent SQL and data analytics tutorials that guided and inspired this project.

---

# 👨‍💻 Author

**Abdul Rafay Bhatti**  
Aspiring Data Analyst | SQL Enthusiast | Data Engineering Learner  

---
