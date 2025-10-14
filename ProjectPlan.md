# IS 477 Project: Analyzing the Relationship Between Air Quality and Respiratory Illness Trends in Chicago

## Overview

The goal of this project is to analyze the relationship between air quality and respiratory illness trends in Chicago. Specifically, we aim to investigate whether fluctuations in pollutants such as PM2.5 and ozone correlate with the frequency of emergency department visits for respiratory illnesses like COVID-19. This project will integrate environmental and public health datasets, clean and structure them for analysis, and visualize potential patterns.

---

## Research Question(s)

1. How do weekly or annual air quality levels (PM2.5, ozone) correlate with respiratory illness rates in Chicago?
2. Are there observable temporal trends or lag effects between air pollution exposure and hospital visits?
3. How does this relationship vary across different seasons or age groups?

---

## Team

**Team Members:**

- **Kirtan Patel:** Lead on data acquisition (EPA and Chicago APIs), data cleaning, and initial exploratory analysis.
- **Abhinav Arvind:** Responsible for database integration, workflow automation, visualization, and documentation.

**Roles & Responsibilities:**

- **Data Acquisition & Collection:** Write scripts to query the EPA AQS API and Chicago Open Data API; verify integrity of raw data.
- **Data Cleaning & Integration:** Process raw datasets, align temporal granularity, and join air quality data with hospital visits.
- **Analysis & Visualization:** Conduct correlation/regression analyses, generate plots, explore temporal trends.
- **Workflow Automation:** Implement reproducible workflow.
- **Documentation & Reporting:** Maintain Markdown documentation, data dictionaries, and reproducibility instructions.

---

## Datasets

1. **EPA Air Quality System (AQS) API**

   - **Description:** Provides annual or daily summary data on air pollutants (PM2.5, ozone) at the monitor level.
   - **Access:** API endpoint `https://aqs.epa.gov/data/api/annualData/byCounty` for Cook County, IL (state=17, county=031).
   - **Fields of Interest:** `sample_duration`, `arithmetic_mean`, `max_value`, `year`, `site_id`.
   - **Format:** JSON.

2. **City of Chicago Respiratory Illness Surveillance Data**
   - **Description:** Weekly emergency department visit data for respiratory illnesses, categorized by disease and age group.
   - **Access:** `https://data.cityofchicago.org/api/v3/views/7ce8-bpr6/query.json`
   - **Fields of Interest:** `week_start`, `week_end`, `respiratory_category`, `demographic_group`, `percent` (visit rate).
   - **Format:** JSON.

**Integration Approach:**

- Aggregate air quality data to weekly averages to match hospital data.
- Join datasets on `week_start` or `week_end` dates.
- Normalize variables for analysis (e.g., pollutant mean, visit percent).

---

## Timeline

| Task                                 | Responsible      | Timeline        |
| ------------------------------------ | ---------------- | --------------- |
| Data acquisition & initial download  | Kirtan           | Week 1–2        |
| Data cleaning & integration          | Kirtan + Abhinav | Week 2–3        |
| Database setup & storage             | Partner          | Week 2–3        |
| Exploratory analysis & visualization | Kirtan + Abhinav | Week 3–4        |
| Workflow automation                  | Partner          | Week 4          |
| Documentation & metadata             | Both             | Week 4–5        |
| Final report & GitHub release        | Both             | Week 5 (Dec 10) |

---

## Constraints

- EPA AQS data is **not real-time**; only available after processing (6+ months).
- Hospital visit data may contain incomplete demographic information or missing weeks.
- API rate limits may require batching requests.
- Integration requires aligning temporal granularity (daily/annual air data vs weekly hospital data).

---

## Gaps

- Exact mapping of AQS monitor sites to geographic coverage in Chicago may require spatial filtering.
- Lag analysis methodology (pollution exposure vs health outcome) needs to be finalized.
- Some demographic categories may be sparse, requiring aggregation.
- Will need guidance on statistical methods to properly interpret correlations.
