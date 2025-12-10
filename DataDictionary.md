# Data Dictionary – Air Quality & Respiratory Illness Project

This data dictionary describes the cleaned datasets used in the IS 477 course project analyzing relationships between Chicago air quality and respiratory illness trends.

---

## **1. air_clean.csv (EPA Air Quality Data)**

| Column              | Description                                     | Type    | Example                  |
| ------------------- | ----------------------------------------------- | ------- | ------------------------ |
| state_code          | EPA state code                                  | string  | 17                       |
| county_code         | EPA county code                                 | string  | 031                      |
| site_number         | Air monitoring site number                      | string  | 0076                     |
| parameter_code      | Pollutant code (e.g., PM2.5)                    | string  | 88101                    |
| parameter           | Air pollutant measured                          | string  | PM2.5 - Local Conditions |
| date_local          | Date of the measurement                         | date    | 2015-01-06               |
| arithmetic_mean     | Daily mean pollutant concentration              | float   | 10.3                     |
| units_of_measure    | Units for pollutant measurement                 | string  | Micrograms/cubic meter   |
| observation_count   | Number of observations used to compute the mean | integer | 1                        |
| observation_percent | Percent of valid observations                   | float   | 100.0                    |
| aqi                 | Air Quality Index (if available)                | integer | 53                       |
| local_site_name     | Name of the monitoring site                     | string  | COM ED MAINTENANCE BLDG  |
| site_address        | Location of the monitoring site                 | string  | 7801 LAWNDALE            |
| state               | State name                                      | string  | Illinois                 |
| county              | County name                                     | string  | Cook                     |
| city                | City name                                       | string  | Chicago                  |
| cbsa                | Core-Based Statistical Area                     | string  | Chicago-Naperville-Elgin |
| month               | Year-month period for aggregation               | string  | 2015-01                  |

---

## **2. hosp_clean.csv (Hospital ED Respiratory Illness Data)**

| Column               | Description                                                 | Type   | Example      |
| -------------------- | ----------------------------------------------------------- | ------ | ------------ |
| week_start           | MMWR week start date                                        | date   | 2015-01-04   |
| week_end             | MMWR week end date                                          | date   | 2015-01-10   |
| respiratory_category | Category of respiratory illness                             | string | Flu-like     |
| visit_type           | Encounter type (ED visit classification)                    | string | Outpatient   |
| demographic_category | Demographic grouping field                                  | string | Age Group    |
| demographic_group    | Specific demographic subgroup                               | string | 18–44        |
| percent              | Percent of ED visits attributed to the respiratory category | float  | 5.2          |
| season               | Season name (Winter, Spring, etc.)                          | string | Winter       |
| data_source          | Source of data                                              | string | CDPH ESSENCE |
| month                | Year-month period for aggregation                           | string | 2015-01      |

---

# **Notes**

- Both datasets contain a derived `month` column used for monthly aggregation in the analysis.
- Raw values related to measurement infrastructure (e.g., geolocation, site codes) were retained to preserve metadata, though not all are used in analysis.
