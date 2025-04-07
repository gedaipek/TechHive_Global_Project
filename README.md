                                  # Elist Performance Analysis


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
Elist, a global e-commerce company founded in 2018, specializes in selling popular electronics such as Apple, Samsung, and ThinkPad products worldwide via its website and mobile app.

The company holds a significant amount of data related to its sales, marketing efforts, operational efficiency, product offerings, and customer loyalty program that has been previously underutilized. This project thoroughly analyzes and synthesizes that data to uncover actionable insights that drive strategic decisions and enhance Elist’s competitive edge and overall success.

Insights and recommendations are provided on the following key areas:

- **Sales Trends and Growth Rates:** Evaluation of historical sales patterns, both by region and globally, focusing on Revenue, Order Volume, and Average Order Value (AOV).
- **Key Product Performance:** An analysis of various product lines to understand their contribution to overall revenue and their association with product returns.
- **Customer Growth and Repeat Purchase Trends:** 
- **Loyalty Program Performance:** An assesment of the loyalty program success on sales and customer retention.
- **Refund Rate Trends:** Examination of refund behaviors over time to identify patterns in return rates and uncover products or categories with elevated risk.----
- **Regional Comparisons:** A comparison of sales performance and order volume across different regions to identify geographic opportunities and performance gaps.

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [scripts/SQL/EDA(Exploratry].

# Data Structure & Initial Checks

Elist's database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 108,127 records. A description of each table is as follows:


[Entity Relationship Diagram here]


Prior to beginning the analysis, a variety of checks were conducted to ensure data quality and to become familiar with the dataset. The SQL queries utilized to inspect and perform quality control checks can be found here [link].

# Executive Summary

### Overview of Findings

Explain the overarching findings, trends, and themes in 2-3 sentences here. This section should address the question: "If a stakeholder were to take away 3 main insights from your project, what are the most important things they should know?" You can put yourself in the shoes of a specific stakeholder - for example, a marketing manager or finance director - to think creatively about this section.

Below is the sales overview page from the Power BI dashboard and more examples are included throughout the report. The entire interactive dashboard can be found here [link].

[Visualization, including a graph of overall trends or snapshot of a dashboard]


# Insights Deep Dive
### Sales Trends and Growth Rates:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

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
