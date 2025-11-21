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

- **Status:** Pending

### 2.4 Exploratory Analysis & Visualization (Both)

- **Status:** Not started

### 2.5 Workflow Automation (Abhinav)

- **Status:** Not started

### 2.6 Documentation & Metadata (Both)

- **Status:** Not started

---

## 3. Updated Timeline

| Task                                 | Responsible | Original Timeline | Current Status  | Expected Completion |
| ------------------------------------ | ----------- | ----------------- | --------------- | ------------------- |
| Data acquisition & initial download  | Kirtan      | Week 1–2          | **Completed**   | ✓                   |
| Data cleaning & integration          | Kirtan      | Week 2–3          | **Completed**   | ✓                   |
| Database setup & storage             | Abhinav     | Week 2–3          | Not Started     | Week 4              |
| Exploratory analysis & visualization | Both        | Week 3–4          | **In Progress** | Nov 25              |
| Workflow automation                  | Abhinav     | Week 4            | Not Started     | Nov 25              |
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

### Team Member: **Kirtan**

- Contributions to this milestone:
- Files/scripts worked on:
- Next planned tasks:

(Add a similar section for all team members.)

---

### Team Member: **Abhinav**

_End of StatusReport.md template – update all placeholders with your actual project details._
