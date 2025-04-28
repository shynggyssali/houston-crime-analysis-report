# Houston Crime Analysis Report – 2024

## Overview
This repository contains a comprehensive analysis of patterns of crime across Houston in 2024, with a special focus on unsafe crime (e.g., assault, robbery, burglary, drug violations). The analysis inspects crime distribution by type, time of the day, month, neighborhood, and premise. 

---

## Contents
- Final Report: Houston Crime Analysis Report - 2024 (PDF)
- Python Code: Spatial join script to assign crimes to Houston super neighborhoods using latitude/longitude coordinates and a GeoJSON file.
- SQL Queries: Scripts used to summarize unsafe crimes by type, neighborhood, and premise.
- Cleaned Data: Full cleaned dataset with neighborhood names.
- Visualizations: Top 25 unsafe crimes by type, neighborhood, and premise.

---

## Tools Used
- Python (pandas, shapely, json) — for data enrichment (spatial join)
- SQL — for data checking and summarization
- Tableau — for creating interactive visualizations
- Microsoft Excel — for initial data cleaning and preparation
- Microsoft Word — for structured reporting

---

## Data Sources
- Houston Crime Data: [Source](https://www.houstontx.gov/police/cs/Monthly_Crime_Data_by_Street_and_Police_Beat.htm)
- Houston Super Neighborhood GeoJSON: [Source](https://github.com/codeforgermany/click_that_hood/blob/main/public/data/houston.geojson)

---

## How to Use
- View the full report (houston-crime-analysis-report.pdf) for insights and findings.
- Explore the Python script (assign-neighborhoods.py) for spatial joining method.
- Use the cleaned data (nibrs24-with-neighborhoods.csv) for practice or further analysis.
