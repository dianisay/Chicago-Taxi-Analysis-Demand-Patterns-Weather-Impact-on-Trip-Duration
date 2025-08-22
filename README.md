# 🚖 Chicago Taxi Operations: Company Demand, Neighborhood Hotspots & Rainy Saturday Effects

## 📌 Introduction
This project analyzes **Chicago taxi data (Nov 2017)** to uncover operational patterns and test whether **rainy Saturdays** change trip duration from **The Loop** to **O’Hare**. It combines **SQL** (data retrieval/joins) and **Python** (EDA, visualization, hypothesis testing) to deliver actionable insights for fleet allocation and service reliability.

---

## 🎯 Business questions & goals
- **Company demand:** Which taxi companies led trip volume on Nov 15–16, 2017?
- **Brand filter:** How did companies containing “Yellow” or “Blue” perform (Nov 1–7)?
- **Market share view:** How do Flash Cab and Taxi Affiliation Services compare vs **Other**?
- **Neighborhood hotspots:** Which are the **Top 10** drop-off neighborhoods (Nov 2017)?
- **Service reliability:** Do **rainy Saturdays** change Loop→O’Hare trip duration?

---

## 📂 Data sources
- **Database tables:**
  - **neighborhoods:** `neighborhood_id`, `name`
  - **cabs:** `cab_id`, `vehicle_id`, `company_name`
  - **trips:** `trip_id`, `cab_id`, `start_ts`, `end_ts`, `duration_seconds`, `distance_miles`, `pickup_location_id`, `dropoff_location_id`
  - **weather_records:** `record_id`, `ts`, `temperature`, `description`
- **Website (weather, Nov 2017):** Chicago weather page (parsed programmatically)
- **CSV exports (for Python EDA):**
  - `project_sql_result_01.csv` — **company_name**, **trips_amount** (Nov 15–16)
  - `project_sql_result_04.csv` — **dropoff_location_name**, **average_trips** (Nov)
  - `project_sql_result_07.csv` — **start_ts**, **weather_conditions**, **duration_seconds** (Loop→O’Hare, Saturdays)

---

## 🧭 Methodology

### 1) Weather parsing (SQL + Python integration)
- **Parse:** Extract November 2017 weather records from the provided webpage (e.g., `pandas.read_html`).
- **Normalize:** Clean column names, standardize timestamps to hourly, and **classify**:
  - **Bad:** if `description` contains “rain” or “storm”
  - **Good:** otherwise
- **Join key:** Use hourly timestamps to align `trips.start_ts` with `weather_records.ts`.

### 2) SQL exploratory analysis
- **Company trips (Nov 15–16):** Aggregate by `company_name`, alias as **trips_amount**, order desc.
- **Brand filter (Nov 1–7):** Aggregate trips for companies with “Yellow” OR “Blue”.
- **Top brands vs Other (Nov):** Aggregate for **Flash Cab** and **Taxi Affiliation Services**; group the rest as **Other**; output field **company** ordered by **trips_amount**.

### 3) Weather labeling for hypothesis test
- **Neighborhood IDs:** Recover Loop and O’Hare IDs from `neighborhoods` (Loop=50, O’Hare=63).
- **Weather groups (CASE):** Produce a two-column table `ts`, **weather_conditions** (“Good”/“Bad”).
- **Trip selection:** Retrieve Saturday trips starting in Loop (50) and ending in O’Hare (63).
- **Join & filter:** Join trips to hourly weather on `start_ts`; **exclude** trips without weather.

### 4) Python EDA (CSV-based)
- **Import & inspect:** Read `project_sql_result_01.csv` and `project_sql_result_04.csv`; validate dtypes.
- **Top 10 neighborhoods:** Rank by **average_trips** and select top 10.
- **Visualize:**
  - **Company vs trips (Nov 15–16):** Sorted bar chart.
  - **Top 10 drop-offs:** Horizontal bar chart for readability.
- **Interpret:** Explain concentration of demand by company and spatial hotspots.

### 5) Hypothesis testing (Python)
- **Statement:** “Average Loop→O’Hare trip duration changes on rainy Saturdays.”
- **Hypotheses:**
  - **H₀:** Mean duration is the same on “Bad” vs “Good” Saturdays.
  - **H₁:** Mean duration differs between “Bad” and “Good” Saturdays.
- **Alpha:** Set **α = 0.05** (modifiable).
- **Test:** Two-sample **Welch’s t-test** (unequal variances); if non-normal or outliers dominate, confirm with **Mann–Whitney U** as robustness check.
- **Assumptions & checks:** Inspect distributions, sample sizes, variance ratio; report effect size (Cohen’s d or Cliff’s delta) and confidence interval.

---

## 📊 Key analyses & visuals
- **Company demand:** Bar chart of trips per company (Nov 15–16).
- **Neighborhood hotspots:** Top 10 drop-off neighborhoods by **average_trips** (Nov).
- **Weather effect:** Distribution/violin + CI plot of **duration_seconds** by **weather_conditions** (“Good” vs “Bad”), Saturdays only; add summary table with means, std, n, p-value.

---

## ✅ Results summary
- **Demand concentration:** Identify leading companies and quantify their share vs the long tail.
- **Spatial patterns:** Highlight neighborhoods with consistently high drop-offs.
- **Weather impact:** Report whether rainy Saturdays significantly change Loop→O’Hare durations; include **p-value**, **effect size**, and **practical implications** (e.g., buffer times, dispatch planning).

---

## 🧰 Tech stack
- **SQL:** Joins, CASE, grouping, filtering by datetime and weekday.
- **Python:** pandas, numpy, matplotlib, seaborn, scipy.stats.
- **Data parsing:** pandas HTML table ingestion; datetime handling.

---

## 🚀 Repro steps
1. **SQL:** Run notebooks/queries to generate `project_sql_result_01.csv`, `project_sql_result_04.csv`, `project_sql_result_07.csv`.
2. **Python EDA:** Open the notebook, set `DATA_DIR`, and execute cells to load CSVs, plot, and test hypotheses.
3. **Outputs:** Figures saved to `figures/`; summary metrics printed and exported to `reports/`.

---

## 📈 Sample figures to include
- **Company trips (Nov 15–16):** Sorted bar chart.
- **Top 10 drop-offs (Nov):** Horizontal bar chart.
- **Duration by weather (Saturdays):** Violin/box + mean CI; annotate p-value and effect size.

---

## 🤝 Contact
Created by **[Your Name]**  
🔗 [LinkedIn](https://linkedin.com/in/yourprofile) · 🌐 [Portfolio](https://yourportfolio.com)
