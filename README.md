# 🎯 Netflix Data Analytics Project 

This project covers the **full analytics lifecycle** — from cleaning raw Netflix data in SQL to building an **interactive Tableau dashboard** that answers key business questions about Netflix content.

---

## 🛠 Tools & Dataset
- **Tools:** PostgreSQL (via VS Code), Tableau Public
- **Dataset:** Netflix Titles (Kaggle)

---

## 🧹 Data Cleaning in PostgreSQL
Performed a full cleaning process to ensure data consistency and accuracy:
- Removed records with missing `show_id` and `date_added` to preserve data integrity
- Filled `NULL` values with `"Unknown"`
- Standardized text fields using `TRIM()`, `INITCAP()`, and `UPPER()`
- Removed duplicate rows to ensure uniqueness
- Processed **Genres** directly in Tableau using a calculated field

  [Data cleaning sql file](data_cleaning.sql)

---

## 📊 Dashboard Objectives
The dashboard focuses on exploring Netflix’s **global content structure** and **trends over time** by answering:
- What dominates Netflix: **Movies or TV Shows**?
- Which **countries** contribute the most content?
- How has **content volume** changed over the years?
- What is the **average duration** of movies and TV shows?
- Which **genres** are most popular, and how has their share changed over time?
- What is the **month-by-month percentage** distribution of genres, and which dominate overall?

---

## 📌 Key Insights

### ✅ Content Type
- Movies account for **over 70%** of Netflix content, significantly outnumbering TV shows

### 🌍 Geographic Reach
- **United States** is the top content producer
- **India** and the **UK** follow, reflecting strong regional production growth

### 📈 Release Trends
- Steady growth between **2012–2016**
- Sharp rise **2016–2018**, peaking in **2018** with **1,140 releases**
- High volume in 2019–2020, then visible decline in 2021 (likely post-COVID production impact)

### 🕒 Duration Stats
- Average movie length: **101 minutes**
- TV shows: most have **2 seasons** on average, suggesting shorter-format storytelling

### 🎭 Genre Analysis
- Selected **top 5 genres**: Drama, Comedy, Documentaries, Action, Horror; grouped others as “Other”
- **Drama (3,026 titles)** and **Comedy (1,847 titles)** are the most dominant
- Line chart revealed genre trends over time, showing consistent Drama & Comedy dominance
- 100% stacked bar chart provided monthly percentage distribution by genre

---

## 📈 Dashboard Preview
![Netflix Dashboard Preview](Content%20Types%20Analysis.png)
![Netflix Dashboard Preview](Genre%20Analysis.png)

You can explore the interactive version on [Tableau Public](https://public.tableau.com/views/NetflixAnalysis_17544774090480/ContentTypesAnalysis?:language=en-US&:redirect=auth&:display_count=n&:origin=viz_share_link).

---

## 📝 Conclusions
- **Movies dominate** Netflix's content offering, but TV shows maintain a significant share
- **US-based productions** lead by a wide margin, with notable contributions from India and the UK
- Content growth peaked in **2018**, with a subsequent stabilization
- **Drama and Comedy** remain evergreen genres, consistently leading across the platform
- This analysis framework can be adapted for **content strategy** and **regional production planning**
