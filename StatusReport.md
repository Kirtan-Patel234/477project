# Interim Status Report

## 1. Project Overview

This project analyzes the relationship between air quality (PM2.5, ozone) and emergency department visits for respiratory illnesses in Chicago. Using EPA AQS and Chicago health data, we aim to explore weekly patterns, possible lag effects, and demographic variations to assess potential public health impacts.

---

## 2. Task Updates (from Project Plan)

### 2.1 Data Acquisition & Initial Download (Kirtan)

- **Status:** Completed
- **Artifacts:** `data/air_data.csv`, `data/hosp_data.csv`, `getData.ipynb`
- **Details:** Successfully fetched EPA AQS data and Chicago respiratory illness data via APIs. Data stored in repository with reproducible scripts.

### 2.2 Data Cleaning & Integration (Kirtan)

- **Status:** In Progress
- **Artifacts:** `data/air_data.csv`, `data/hosp_data.csv`, `dataIntegration.ipynb`
- **Details:** Began cleaning air quality dataset; working on weekly aggregation to match hospital data. Next step is normalization and date alignment.

### 2.3 Database Setup & Storage (Abhinav)

- **Status:** Completed
- **Artifacts:** `data/analysis.db`, `databaseSetup.ipynb`
- **Details:** Created SQLite database with schema for air quality, hospital visits, and monthly aggregated analysis. Database includes metadata tracking for reproducibility and supports efficient querying for analysis.

### 2.4 Exploratory Analysis & Visualization (Both)

- **Status:** In Progress
- **Artifacts:** `data/air_data.csv`, `data/hosp_data.csv`, `dataIntegration.ipynb`
- **Details:** We fit a regression model using the merged dataset between air quality and hosptial data. Our findings are available below in the report.

### 2.5 Workflow Automation (Abhinav)

- **Status:** Completed
- **Artifacts:** `workflowAutomation.ipynb`, `visualizations.ipynb`
- **Details:** Implemented automated data validation pipeline, reproducibility checks, and comprehensive visualization suite. Created scripts for data quality reporting and correlation analysis.

### 2.6 Documentation & Metadata (Both)

- **Status:** Not started

---

## 3. Updated Timeline

| Task                                 | Responsible | Original Timeline | Current Status  | Expected Completion |
| ------------------------------------ | ----------- | ----------------- | --------------- | ------------------- |
| Data acquisition & initial download  | Kirtan      | Week 1–2          | **Completed**   | ✓                   |
| Data cleaning & integration          | Kirtan      | Week 2–3          | **Completed**   | ✓                   |
| Database setup & storage             | Abhinav     | Week 2–3          | **Completed**   | ✓                   |
| Exploratory analysis & visualization | Both        | Week 3–4          | **In Progress** | Nov 25              |
| Workflow automation                  | Abhinav     | Week 4            | **Completed**   | ✓                   |
| Documentation & metadata             | Both        | Week 4–5          | **In Progress** | Dec 5               |
| Final report & GitHub release        | Both        | Week 5 (Dec 10)   | On Track        | Dec 10              |

---

## 4. Changes to Project Plan

Based on our analysis and feedback from Milestone 2, we made several key adjustments to the project methodology:

### **Methodological Adjustments**

- The initial EPA endpoint (`annualData/byCounty`) returned only **23 usable weeks**, which prevented meaningful integration with hospital data. We switched to the `dailyData/byCounty` endpoint for **Chicago only**, retrieving **~30,000 daily records**.
- EPA monitors only report when pollutant levels change. As a result, weekly aggregation produced sparse coverage and did not align with hospital data.
- To resolve this, we shifted from **weekly aggregation to monthly aggregation**, which better reflects standard practice in environmental research.
- After this pivot, the merge between datasets succeeded, resulting in **555 usable records**—sufficient for meaningful correlation and regression analyses.

### **Impact on Project Direction**

- Monthly aggregation improved statistical power and temporal alignment.
- Enabled exploratory analysis, lag-effect testing, and regression modeling.
- Strengthened project validity and ensured alignment with research goals.

### **Feedback Response Summary**

- Addressed data alignment issues mentioned during Milestone 2.
- Improved reproducibility through updated scripts and clearer aggregation logic.
- Adjusted workflow to prioritize robust temporal analysis.

---

## 5. Challenges & Solutions

### **Challenge: Sparse Weekly EPA Data**

- EPA monitoring data showed limited week-level variation because pollutant values are only recorded when they change.
- Weekly aggregation resulted in too few records for analysis, and merge attempts returned empty datasets.

### **Solution: Monthly Aggregation**

- We shifted to **monthly aggregation**, which produced **555 merged data points**.
- This level of granularity is consistent with environmental research standards and enabled further statistical testing.

### **Regression Findings**

A multiple linear regression using monthly air quality data and 1–2 month lagged variables resulted in:

- **R² = 0.000** → very weak explanatory power.
- All predictor p-values **> 0.80** → no significant relationship under the current model.

**Interpretation:**
This does **not invalidate the research question**. Instead, it suggests:

- Respiratory effects may occur with **longer lag periods** (e.g., 3–6 months).
- **Seasonality and demographic effects** may be influential.
- **Non-linear models** (RandomForest, GAM) may better capture relationships.

---

## 6. Next Steps

| Focus Area         | Planned Method                                                  |
| ------------------ | --------------------------------------------------------------- |
| Seasonality        | Group by month and analyze average percent of respiratory cases |
| Age group effects  | Compare trends across `demographic_group`                       |
| Extreme pollution  | Compare top 10% pollution months vs. remaining months           |
| Non-linear effects | Test RandomForestRegressor or GAM                               |
| Longer lag periods | Implement `shift(3–6)` to explore delayed health effects        |

These directions will guide our work for **Milestone 4**, focusing on deeper exploratory analysis and model experimentation.

---

## 7. Team Member Contributions

Each team member must write their **own summary** using this format and commit **their own addition** to the repo.

### Team Member: **Kirtan Patel**

**Primary Contributions (Milestone 3):**

- Led data acquisition for EPA AQS (Chicago) and respiratory hospital datasets.
- Performed data cleaning and developed temporal alignment strategy.
- Identified dataset mismatch in weekly aggregation and pivoted to monthly aggregation.
- Created merged analysis-ready dataset and ran initial correlation and regression tests.
- Updated StatusReport.md with methodology changes and technical justification.

**Files / Scripts Worked On:**

- `getData.ipynb`
- `dataIntegration.ipynb`
- `data/air.csv`
- `data/hosp_data.csv`

**Next Planned Tasks:**

- Test 3–6 month lag effects.
- Analyze seasonal and demographic variation.
- Begin exploring non-linear models and visualization.

---

### Team Member: **Abhinav Arvind**

**Primary Contributions (Milestone 3):**

- Developed SQLite database infrastructure for storing and querying air quality and hospital visit data.
- Created automated workflow validation pipeline to ensure data quality and reproducibility.
- Implemented comprehensive visualization suite for exploratory data analysis including time series, correlations, seasonal patterns, and distribution plots.
- Built data quality reporting system with automated validation checks.
- Contributed to project documentation and status tracking.

**Files / Scripts Worked On:**

- `databaseSetup.ipynb` - Database schema creation and data population
- `workflowAutomation.ipynb` - Pipeline automation and validation
- `visualizations.ipynb` - Exploratory data analysis visualizations
- `StatusReport.md` - Documentation and progress tracking

**Next Planned Tasks:**

- Run and validate all visualization outputs from the database.
- Implement advanced lag analysis (3-6 month periods).
- Explore non-linear modeling approaches (RandomForest/GAM).
- Create final analysis report with key findings and visualizations.
- Finalize documentation and prepare for GitHub release.

---

_End of StatusReport.md – Milestone 3_
