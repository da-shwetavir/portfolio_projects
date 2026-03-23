# 🏥 Canadian Healthcare Wait Times Dashboard

> **End-to-end analytics project** — MySQL · Power BI  
> Data source: [CIHI — Wait Times for Priority Procedures in Canada, 2025](https://www.cihi.ca/en/wait-times-for-priority-procedures-in-canada-2025)

---

## 📌 Project Overview

Canada's publicly funded healthcare system guarantees universal access — but the *experience* of that access varies dramatically by province. A knee replacement patient in **Newfoundland & Labrador** waits a median of **266 days** in 2024. The same patient in **Ontario** waits **88 days**. Same surgery, same country, same system — a **3× disparity**.

This project analyses 17 years of wait time data (2008–2024) published by the **Canadian Institute for Health Information (CIHI)** across 10 provinces and 14 priority procedures, surfacing patterns in provincial performance, COVID-19 disruption, benchmark compliance failures, and system recovery.

---

## 🖼️ Dashboard Preview

| Page | Description |
|------|-------------|
| ![Highlight](screenshots/Highlight.png) | **Overview & KPIs** — Scope, reporting level, time span |
| ![Spotlight](screenshots/Spotlight Insight.png) | **Spotlight Insights** — Longest/shortest waits in Canada |
| ![Heatmap](screenshots/WaitTime_Benchmark.png) | **Wait Time Heatmap** — P50 days & % benchmark toggle |
| ![Rankings](screenshots/Provincial Ranking.png) | **Provincial Rankings** — Sort by procedure, compare provinces |
| ![Trends](screenshots/Wait Time Trend.png) | **Wait Time Trends** — 2010–2024 with COVID annotation |

---

## ❓ Problem Statement

Despite a shared universal healthcare mandate, Canadian provincial health systems operate independently — creating measurable and consequential inequities in access and outcomes.

**This dashboard answers 8 key policy questions:**

1. Which province has the longest median wait for each priority procedure in 2024?
2. How did COVID-19 (2020–2022) impact surgical backlogs — and has recovery been uniform?
3. Which provinces consistently fail to meet national benchmark targets?
4. Is there a relationship between procedure volume and wait time length?
5. Which procedures carry the greatest inequality (P90 vs P50 gap)?
6. Which province improved the most from 2010 to 2024?
7. How do cancer surgery wait times compare — are urgent cases being prioritised?
8. Where should health investment be targeted for the broadest patient impact?

---

## 🔍 Key Findings

| Finding | Detail |
|---------|--------|
| 🔴 **NL Knee Replacement crisis** | Median 266 days · 
| 🟢 **Best performer** | Ontario — Knee Replacement: **88 days** · Radiation Therapy benchmark: **97.7%** |
| 🟢 **Shortest wait** | Saskatchewan — CABG: **4–5 days** median |
| 🟡 **COVID-19 impact** | Wait times spiked 2–3× in 2020 across all provinces; many still not recovered by 2024 |
| 🟡 **Volume paradox** | NL performed its highest-ever 568 knee surgeries in 2024 — yet waits remain at 266 days because demand exceeds capacity |

---

## 🗂️ Dataset

| Attribute | Detail |
|-----------|--------|
| **Source** | Canadian Institute for Health Information (CIHI) |
| **Publication** | Wait Times for Priority Procedures in Canada, 2025 |
| **URL** | https://www.cihi.ca/en/wait-times-for-priority-procedures-in-canada-2025 |
| **Rows** | ~19,000 |
| **Time span** | 2008–2024 (17 years) |
| **Provinces** | 10 (Alberta, BC, Manitoba, New Brunswick, NL, Nova Scotia, Ontario, PEI, Quebec, Saskatchewan) |
| **Procedures** | 14 (Bladder/Breast/Colorectal/Lung/Prostate Cancer Surgery, CABG, Cataract Surgery, CT Scan, Hip Fracture Repair, Hip Replacement, Knee Replacement, MRI Scan, Radiation Therapy) |
| **Metrics** | 50th percentile (median days), 90th percentile, % meeting benchmark, volume |
| **Reporting levels** | National, Provincial, Regional |

---

## 🛠️ Tech Stack

```
CIHI Open Data (Excel)
       │
       ▼
MySQL Database           ← Data cleaning, transformation, null handling, Relational modelling, structured storage, SQL queries
       │
       ▼
Power BI                 ← DAX measures, interactive visuals, slicers, drill-through
```

### Tools & Libraries

| Tool | Purpose |
|------|---------|
| **MySQL** | Relational database — fact + dimension table design |
| **Power BI Desktop** | Dashboard design, DAX, interactive filtering |
| **DAX** | Custom measures for benchmark compliance, YoY change, rankings |

---


---

## 📊 Power BI — DAX Measures

```dax
-- Median Wait Days (P50)
Median Wait Days =
CALCULATE(
    AVERAGE(fact_wait_times[result]),
    fact_wait_times[metric] = "50th Percentile"
)

-- % Meeting Benchmark
Benchmark Compliance % =
CALCULATE(
    AVERAGE(fact_wait_times[result]),
    fact_wait_times[metric] = "% Meeting Benchmark"
)

-- Year-over-Year Change
YoY Change (Days) =
VAR CurrentYear = CALCULATE([Median Wait Days], FILTER(ALL(fact_wait_times[data_year]), fact_wait_times[data_year] = MAX(fact_wait_times[data_year])))
VAR PrevYear    = CALCULATE([Median Wait Days], FILTER(ALL(fact_wait_times[data_year]), fact_wait_times[data_year] = MAX(fact_wait_times[data_year]) - 1))
RETURN CurrentYear - PrevYear

-- Provincial Rank (by median wait, ascending)
Province Rank =
RANKX(
    ALL(dim_province[province_name]),
    [Median Wait Days],
    ,
    ASC,
    DENSE
)
```

---


## 🙏 Acknowledgements

- **Data:** [Canadian Institute for Health Information (CIHI)](https://www.cihi.ca) — publicly available under CIHI's open data licence
- **Inspiration:** The 3× wait time disparity between Ontario and Newfoundland & Labrador for the same elective surgery

---

## 📬 Contact

**[Shweta Vir]**  
📧 da.vir.shweta@gmail.com  
💼 [LinkedIn](https://www.linkedin.com/in/shweta-vir-826b053a/)  
🐙 [GitHub](https://github.com/da-shwetavir)

---

*Built as a portfolio project to demonstrate end-to-end data analytics: ingestion → relational modelling → interactive visualisation.*
