# Global Superstore Sales & Profitability Analysis

## 📋 Project Overview

This project provides an end-to-end business intelligence and data engineering solution designed to transform raw commercial data into executive-ready insights. By isolating non-returned orders, the analysis uncovers true revenue drivers, multi-year growth trajectories, and seasonal performance variations across geographies, product categories, and customer segments.

The final deliverables include an automated data processing pipeline, a relational database storage layer containing pre-compiled analytical business views, and an interactive two-page Power BI executive dashboard.

---

## 🛠️ Technical Stack & Architecture

* **Data Layer:** Raw transactional data (`Orders`, `Returns`, `People` datasets in CSV format).
* **Data Processing (Python):** `Pandas`, `Matplotlib`,  utilized within a Jupyter Notebook to clean, transform, export datasets and visualization.
* **Database Layer (SQL):** `MySQL` relational database instance hosting pre-compiled, aggregated business discovery queries.
* **Visualization Layer (Power BI):** Interactive two-page report engineered with advanced DAX measures, cohesive themes, chronological date sorting, and interactive UX filtering strips.

---

## 📁 Repository Structure

```filesystem
├── data/
│   ├── sample_-_superstore.xls - Orders.csv     # Historical transactional order lines
│   ├── sample_-_superstore.xls - Returns.csv    # Returned order item identifiers
│   └── sample_-_superstore.xls - People.csv     # Regional managers mapping
├── Sales Analysis-checkpoint.ipynb             # Jupyter Notebook for EDA & ETb Pipeline
├── Sales Analysis.sql                           # Production-ready MySQL analytical queries
├── Sales Analysis.pbix                          # Finalized Power BI Interactive Dashboard
├── Sales Analysis Dashboard.pdf                # PDF Export of the Executive Dashboard
└── README.md                                    # Project documentation (This file)

```

---

## ⚙️ Data Pipeline & ETL (Python)

The Jupyter Notebook handles initial data preparation, ingestion, and feature engineering:

1. **Data Profiling & Aggregation:** Ingested the raw multi-table CSV files and evaluated schema integrity using `df.info()` and `df.describe()`.
2. **Data Cleansing:** Standardized column names to uniform `snake_case`, handled missing values, and validated string-to-numeric typecast mappings.
3. **Relational Database Migration:** Established a connection to a local MySQL instance using an `SQLAlchemy` engine and transferred the staging dataframes directly into production-ready SQL database tables.

---

## 🗄️ Database Optimization & Analytical Queries (`Sales Analysis.sql`)

The backend database abstracts business logic by enforcing a standard baseline rule: **filtering out returned transactions** (`where returned = 'No' or ISBLANK`) to ensure revenue metrics represent true take-home value.

Core query areas include:

* **Time-Series Analysis:** Tracking year-over-year revenue velocity and computing chronological monthly seasonality blocks.
* **Logistics & Demographics:** Aggregating sales metrics across varying shipping modes and customer segments.
* **Geographic & Product Matrixes:** Breaking down performance rankings down to localized cities, operational sales regions, and deep-layer product sub-categories.

---

## 📊 Dashboard Architecture (`Sales Analysis.pbix`)

The interactive Power BI dashboard is split into two strategically isolated sheets to deliver structural clarity to executive stakeholders:

### Page 1: Executive Overview

Focused on high-level macro health indicators and long-term timelines.

* **Hero KPI Blocks:** Features dynamic cards tracking **Net Sales ($2.15M)**, **Net Profit ($269K)**, **Profit Margin (12.5%)**, and **Return Rate (7.8%)** built via robust DAX measures.
* **Seasonality & Annual Growth Trends:** Contains dual combo-charts highlighting multi-year momentum (stabilizing at an $80.2K ceiling by 2026) alongside a corrected chronological month trend line highlighting a massive Q4 holiday peak (November/December combined profit exceeding $74K) and an April seasonal floor ($11K profit).

### Page 2: Performance Breakdown (Dimensional Analysis)

Focused on granular data drilling and interactive business diagnostics.

* **Filter Panel UX:** Introduces a dark sidebar strip housing global categorical slicers (Country, Month, Region, Category) enabling instant report cross-filtering.
* **Distribution Breakdowns:** Maps performance density using dedicated column/bar charts isolating top-performing geographic powerhouses (New York City leading at $0.24M sales; West/East regions capturing the bulk share) and primary catalog drivers (Chairs and Phones combining for over $0.61M in volume).

---

## 📈 Core Business Insights Derived

* **The Q4 Revenue Engine:** Sales and profits accelerate aggressively starting in September, reaching peak performance floors in November and December. Operations teams can leverage this trend to maximize inventory levels and promotional spending ahead of Q4.
* **Product Catalog Pillars:** High-value corporate staples drive the business. Chairs and Phones serve as primary sub-category revenue pillars, while Technology dominates as the most profitable core category.
* **Operational Margin Shield:** The business maintains tight operational control with a stable 12.5% profit margin and a healthy, well-contained 7.8% order return rate.
