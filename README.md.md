# Superstore Sales, Profit & Discount Analysis

**Author:** Shubhangi Rahul Badgujar  
**Role:** Data Analytics Intern  
**Milestone:** Day 30 — Project 1 Finalization  

---

## 📌 Project Overview
This repository presents an end-to-end data analytics study on the Superstore retail dataset (`2014-01-03` to `2017-12-30`). The workflow covers raw data validation and cleaning, feature engineering, cross-verification in SQL and Python, an interactive Power BI dashboard, a 9-page analytical report, and a 6-slide presentation for mentor review.

---

## 📊 Executive KPI Summary (`Analysis_Ready_Superstore.csv`)
| Core KPI | Verified Value | Business Context |
| :--- | :--- | :--- |
| **Total Sales** | `$2,297,200.86` | Total gross revenue across all regions and product categories |
| **Total Profit** | `$286,397.02` | Net profit after product costs and promotional discounts |
| **Profit Margin %** | `12.47%` | Average net profit retained per `$100` of sales |
| **Total Orders** | `5,009` | Distinct customer orders (`9,994` total line items) |
| **Total Customers** | `793` | Unique customers across Consumer, Corporate, and Home Office segments |

---

## 🔍 Key Analytical Findings
1. **Discount Threshold Impact:** Profit margins stay positive up to a `20%` discount (`29.51%` at `0%`, `16.61%` at `1-10%`, `11.58%` at `11-20%`), then turn negative at `21-30%` (`-10.05%`) and drop sharply above `30%` (`-48.16%`).
2. **Regional Performance:** **West** leads with `$725,457.82` in sales and `1,611` orders (`14.94%` margin). **Central** records the lowest profit margin (`7.92%` on `$501,239.89` sales) due to heavy discounting, while **South** has the lowest order volume (`822` orders on `$391,721.91` sales).
3. **Sub-Category Winners & Losses:** **Copiers** (`+$55,617.82`), **Phones** (`+$44,515.73`), and **Accessories** (`+$41,936.64`) are top profit drivers, whereas **Tables** (`-$17,725.48`), **Bookcases** (`-$3,472.56`), and **Supplies** (`-$1,189.10`) generate net losses.
4. **Quarterly Seasonality:** Sales increase steadily from **Q1** (`$359,681.58`) to **Q4** (`$878,077.48`), peaking in Q4 at more than `2.4x` Q1 revenue.

---

## 💡 Priority Recommendations
- **Cap or Require Approval on Discounts >20%:** Prevent severe margin loss in `21-30%` and `>30%` discount bands.
- **Address Loss-Making Sub-Categories:** Review pricing, freight costs, and discount rules on **Tables**, **Bookcases**, and **Supplies**.
- **Grow Order Volume in the South Region:** Increase customer orders above the `822` baseline using controlled promotions (`<=20%` discount).
- **Prepare Q4 Inventory & Discount Rules Early:** Support peak Q4 demand (`$878.1K` baseline) while protecting quarterly profit margins.

---

## 📁 Repository Folder Structure
```text
Superstore-Sales-Analytics/
├── README.md
├── data/
│   ├── raw/
│   │   └── Sample - Superstore (1).csv
│   └── cleaned/
│       ├── Cleaned_Superstore.csv
│       └── Analysis_Ready_Superstore.csv
├── sql/
│   ├── 01_data_cleaning.sql
│   └── 02_kpi_analysis.sql
├── scripts/
│   └── superstore_analysis.py
├── dashboard/
│   ├── dashboard.pbix
│   └── dashboard_preview.png
├── report/
│   └── Shubhangi_Rahul_Badgujar_Project_1_Report.pdf
└── presentation/
    └── shubhangi_superstore_presentation.html
```

---

## 🛠️ Tools & Technologies
- **SQL:** Data validation, views, and KPI aggregations (`GROUP BY`, `SUM()`, `COUNT(DISTINCT order_id)`)
- **Python:** `pandas`, `numpy`, `matplotlib`, `seaborn` for cleaning, feature engineering, and EDA
- **Excel:** Initial data inspection and quick sanity checks
- **Power BI:** Interactive dashboard with `Region`, `Category`, and `Year` slicers and conditional margin formatting
- **Git & GitHub:** Version control and organized project deliverables

---

## 🚀 How to Run & Review
1. **Run Python Analysis:**
   ```bash
   python scripts/superstore_analysis.py
   ```
2. **Execute SQL Scripts:** Run `sql/01_data_cleaning.sql` followed by `sql/02_kpi_analysis.sql` in your SQL environment.
3. **Explore Power BI Dashboard:** Open `dashboard/dashboard.pbix` in Power BI Desktop (or view `dashboard/dashboard_preview.png`) and test live filtering across `Region`, `Category`, and `Year`.
4. **Review Documentation:** Open `report/Shubhangi_Rahul_Badgujar_Project_1_Report.pdf` and `presentation/shubhangi_superstore_presentation.html`.