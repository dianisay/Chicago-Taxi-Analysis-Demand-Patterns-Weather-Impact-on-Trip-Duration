# 🚖 Chicago Taxi Analysis: Demand Patterns & Weather Impact on Trip Duration

## 📌 Introduction
This project explores **Chicago taxi operations** by analyzing trip data from multiple sources.  
We investigate demand concentration by company and neighborhood, as well as the impact of **weather conditions** on trip duration from *The Loop* to *O'Hare International Airport*.  

The main goals are:
- Identify top-performing taxi companies and most popular drop-off locations.
- Examine whether rainy Saturdays significantly affect travel times to the airport.

---

## 📂 Dataset
The analysis uses three CSV files:

1. **project_sql_result_01.csv** – Taxi companies and trip counts (Nov 15–16, 2017)  
2. **project_sql_result_04.csv** – Average number of trips by Chicago neighborhood (Nov 2017)  
3. **project_sql_result_07.csv** – Trip duration and weather conditions for rides from The Loop to O'Hare

---

## ⚙️ Methodology
The project follows five main steps:

1. **Data Import & Inspection**  
   - Loaded datasets into pandas DataFrames  
   - Reviewed structure, column names, and sample rows  

2. **Data Cleaning & Formatting**  
   - Ensured correct datatypes for timestamps, numerical values, and strings  
   - Checked for and addressed missing or inconsistent entries  

3. **Exploratory Data Analysis (EDA)**  
   - Top taxi companies by number of trips  
   - Top 10 neighborhoods by trip completions  
   - Visualizations with bar charts for company performance and neighborhood popularity  

4. **Hypothesis Testing**  
   - **H₀:** Average trip duration from The Loop to O'Hare is the same on rainy Saturdays and other days  
   - **H₁:** Average trip duration from The Loop to O'Hare differs on rainy Saturdays  
   - Chose significance level α (e.g., 0.05)  
   - Applied an independent t-test after checking assumptions  

5. **Conclusion & Business Insight**  
   - Summarized operational hotspots for taxi companies  
   - Provided evidence-based insight into weather’s effect on airport trips

---

## 📊 Key Analyses
- Ranking of taxi companies by trip volume  
- Mapping demand by neighborhood  
- Statistical testing of travel time differences under varying weather conditions

---

## ✅ Conclusion
The project demonstrates proficiency in:  
- **Python (pandas, matplotlib, seaborn, scipy)**  
- **Data cleaning and aggregation**  
- **Exploratory and statistical analysis**  
- **Business-oriented interpretation of transportation data**

Insights can guide fleet allocation, marketing strategies, and operational adjustments for taxi services.

---

## 💻 Tech Stack
- Python  
- Pandas  
- Matplotlib  
- Seaborn  
- SciPy  
- Jupyter Notebook  

---

## 📈 Sample Visualization
_Add charts for:_
- **Top taxi companies by trip count**  
- **Top 10 neighborhoods by trip completions**  
- **Distribution of trip durations (rainy vs non-rainy Saturdays)**  

---

## 🤝 Contact
Created by **[Your Name]**  
🔗 [LinkedIn](https://linkedin.com/in/yourprofile) | [Portfolio](https://yourportfolio.com)
