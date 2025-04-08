                                  # TechHive Global Performance Analysis


    * Used Tools:       [SQL]SQL Server , [Power BI]
    * [Project  Type:]    (#idea)
    * [Features](#features)
  * [Installation](#installation)                  
USED           TOOLS:
Project  Type: Data Cleaning Exploratory Data Analysis Data Visalization
Relevant Link  
Type            Stakeholder

## Table of Contents
- [Project Background](#project-background)
- [Data Structure & Initial Checks](#data-structure--initial-checks)
- [Executive Summary](#executive-summary)
  - [Overview of Findings](#overview-of-findings)
- [Insights Deep Dive](#insights-deep-dive)
  - [Category 1](#category-1)
  - [Category 2](#category-2)
  - [Category 3](#category-3)
  - [Category 4](#category-4)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)

# Project Background
TechHive Global, US-based e-commerce company founded in 2018, specializes in selling popular electronics such as Apple, Samsung, and ThinkPad products worldwide via its website and mobile app.

The company holds a significant amount of data related to its sales, marketing efforts, operational efficiency, product offerings, and customer loyalty program that has been previously underutilized. This project thoroughly analyzes and synthesizes that data to uncover actionable insights that drive strategic decisions and enhance TechHive Global’s competitive edge and overall success.

Insights and recommendations are provided on the following key areas:

- **Sales Trends and Growth Rates:** Evaluation of historical sales patterns, both by region and globally, focusing on key metrics Revenue, Order Volume, and Average Order Value (AOV).
- **Key Product Performance:** An analysis of various of product lines to understand their impact on revenue and their association with product returns.
- **Loyalty Program Performance:** An assesment of the the company's loyalty program on sales and customer retention.
- **Regional Comparisons:** An evaluation of sales performance and order volume by region.

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [scripts/SQL/EDA(Exploratry].

# Data Structure & Initial Checks

TechHive Global's database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 108,127 records. A description of each table is as follows:


[Entity Relationship Diagram here]


Prior to beginning the analysis, a variety of checks were conducted to ensure data quality and to become familiar with the dataset. The SQL queries utilized to inspect and perform quality control checks can be found here [link].

# Executive Summary

### Overview of Findings

After Elist experienced strong growth that peaked in late 2020 with a 163% increase in revenue, the company’s sales have steadily declined, with significant drops recorded in 2022. Key performance indicators show year-over-year decreases across the board: revenue fell by 46%, order volume by 40%, and average order value by 10%. While this sharp decline may reflect post-pandemic market normalization, the following sections will explore additional factors influencing sales performance and highlight key opportunity areas for improvement.

Below is the sales overview page from the Power BI dashboard and more examples are included throughout the report. The entire interactive dashboard can be found here [link].

[Visualization, including a graph of overall trends or snapshot of a dashboard]


# Insights Deep Dive
### Sales Trends and Growth Rates:

* **Main insight 1.** The company's sales peak in December 2020 with 4,005 total orders and $1,246,007 monthly revenue. This corresponds with the boom in economy-wide spending due to pandemic changing customer behavior.
  
* **Main insight 2.** Starting from in April 2021, revenue declined on a year over year basis for 21 consecutive months. In October 2022, revenue hit a company lifetime low, with just over $178K, and -72% year over year growth rates. In the following months revenue recovered slightly, following spesific holiday seasonality patterns.
  
* **Main insight 3.** Despite the downward trend in 2022, the company's overall performance exceeds 2019 pre-pandemic level baseline in all three key indicator performance indicators. This is primarily due to the stronger 1Q22, which recorded revenue and order count well above the same period in 2020, up 37% and 23% respectively.
  
* **Main insight 4.** Average order value saw only one month increase in September 2022, this can be attributed to an increased share of high-cost laptop orders.

[Visualization specific to category 1]


### Key Product Level Performance:

* **Main insight 1.** 85% of the company’s total revenue is concentrated in three products, the 27in 4K Gaming Monitor which holds the highest individual revenue share at 35%, Apple AirPods Headphones, and the MacBook Air Laptop. These products have generated 75,000 orders and dominate overall sales.
  
* **Main insight 2.** 85% of the company's total orders are from just three products, Apple Airpods Headphones, 27in 4K Gaming Monitor, and Samsung Charcing Cable Pack. These products accounted for $3.96M in revenue in 2022, 79% of the company's total revenue.
  
* **Main insight 3.** In the headphones category, the Bose Soundsport Headphones have underperformed, contributing to less than 1% of total revenue and orders despite being, on average, $40 cheaper than the well-performing Apple Airpods.

* **Main insight 4.** The accessories category has grown in its share of total orders, increasing from 21% to 32% in 2022. However, it still contributes less than 4% to overall revenue, indicating that while accessories are moving in volume, they generate limited financial impact.
  
* **Main insight 5.** In the smarphone category, Apple Iphone generated under 1% of the company's total revenue and accounted for less than 1% of total orders between 2019 and 2022. In contrast, other Apple products such as the Airpods and Macbook Air together contributed over 50% of total revenue during the same period.

[Visualization specific to category 2]


### Loyalty Program Performance:

* **Main insight 1.** While loyalty members contributed to only 36% of total revenue with an average order value of $244, non-members generated 64% of total revenue by spending $283 per order on average. In 2020 tekrar sipariş veren 
  
* **Main insight 2.** Beginning in late 2021, loyalty members began to contribute more significantly to revenue. By 2022, they accounted for 52% of total orders and generated $3.96M in revenue, with spending on average $30 more per order that 14% higher than that of non-members. This shift reflects the increasing transactional value and economic impact of the loyalty segment.
  
* **Main insight 3.** Between 2019 and 2022, loyalty members had a 2.71% repeat purchase rate—considerably lower than non-members (9.88%). A total of 1,065 loyalty members made repeat purchases, compared to 4,877 non-members.
  
* **Main insight 4.** Among returning customers, non-members initially outperformed loyalty member in average order spent, peaking at $380 in 2020 and ½330 for loyalty members. However, this trend reversed in 2022, with loyalty members reporting a higher repeat purchase average order value,(
  

[Visualization specific to category 3]


### Regional Comparisons:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** Europe, the Middle East, and Africa saw a significant

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
