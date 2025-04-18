
 # TechHive Global Sales Performance Analysis



## Table of Contents
- [Project Background](#project-background)
- [Data Structure & Initial Checks](#data-structure--initial-checks)
- [Executive Summary](#executive-summary)
  - [Overview of Findings](#overview-of-findings)
- [Insights Deep Dive](#insights-deep-dive)
  - [Sales Trends and Growth Rates](#sales-trends-and-growth-rates)
  - [Key Product Level Performance](#key-product-level-performance)
  - [Loyalty Program Performance](#loyalty-program-performance)
  - [Regional Comparisons](#regional-comparisons)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)


# Project Background
TechHive Global, US-based e-commerce company founded in 2018, specializes in selling popular electronics such as Apple, Samsung, and ThinkPad products worldwide via its website and mobile app.

The company holds a significant amount of data related to its sales, marketing efforts, operational efficiency, product portfolio, and customer loyalty program that has been underutilized. This project thoroughly analyzes and synthesizes that data to uncover actionable insights that drive strategic decisions and enhance TechHive Global’s competitive edge and overall success.

Insights and recommendations are provided on the following key areas:

- **Sales Trends and Growth Rates:** Evaluating historical sales patterns globally and by region, focusing on order volume, average order value and revenue.
- **Key Product Performance:** An analysis of various of product lines to understand their impact on revenue
- **Loyalty Program Performance:** Evaluating the impact of the loyalty program on sales and customer retention.
- **Regional Comparisons:** Comparing performance across regions in terms of sales and order volume.

The SQL queries used to inspect and clean the data for this analysis can be found [here](https://github.com/gedaipek/SQL-project/blob/main/scripts/SQL/Data%20Cleaning.sql).

Targeted SQL queries regarding various business questions can be found [here](https://github.com/gedaipek/SQL-project/blob/main/scripts/SQL/Targeted%20Business%20Questions.sql).

# Data Structure & Initial Checks

TechHive Global's database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 160,127 records. A description of each table is as follows:

![erdgithub](https://github.com/user-attachments/assets/4c23ec7d-4d12-4e1c-9db2-219a34f194f9)

Prior to beginning the analysis, a variety of checks were conducted to ensure data quality and to become familiar with the dataset. The SQL queries utilized to inspect and perform quality control checks can be found [here](https://github.com/gedaipek/SQL-project/blob/main/docs/Techhive%20Power%20BI%20Dashboard.pbit).


# Executive Summary

### Overview of Findings

**TechHive Global's** total sales **from 2019 to 2022**  reached **$28M**, with **108K** total orders. The company's average order value across all years stands at **$260** per order. 

* In **2020**, the company recorded its highest growth, with more than double the number of sales (34K orders) and total sales revenue ($10M) than 2019. **MacBook Air** sales were the main product driver of this spike, growing **384%** from 2019 to 2020.

* However, since 2020, this upward trend reversed in the following years, with significant drops recorded in **2022**. Key performance indicators show year over year declines across the board: **revenue fell by 46%, order volume by 40%, and average order value by 10%**. This sharp decline may reflect post-pandemic market normalization.

* The loyalty program, introduced in 2019, has shown promising growth potential. While non members have historically spend more

Below is the sales overview page from the Power BI dashboard and more examples are included throughout the report. The entire interactive dashboard can be found here [here](https://github.com/gedaipek/SQL-project/blob/main/docs/TechHive%20Power%20BI%20Dashboard.pbit).

![Ekran görüntüsü 2025-04-17 185429](https://github.com/user-attachments/assets/5cea8271-5e14-4b57-b203-feadb25d3a9f)


# Insights Deep Dive
### Sales Trends and Growth Rates:

* **The company experienced a significant spike in sales in December 2020 with 4,005 total orders and $1,250,007 in revenue.** This spike corresponds with the boom in economy-wide spending due to the pandemic changing customer behavior.
  
* Beginning in April 2021, TechHive experienced a consistent **year over year revenue decline for 21 consecutive months**, reflecting a market adjustment post-pandemic. In October 2022, revenue hit a company lifetime low of **$178K**, representing a **72%** year over year decrease. In the following months, revenue recovered slightly, following normal holiday seasonality patterns.
  
* Despite the downward trend in 2022, the company's overall performance exceeds the 2019 pre-pandemic baseline in all three key performance indicators. This is primarily due to the stronger 1Q22, which recorded order volume and revenue well above the same period in 2020, with **order volume up 23% and revenue up 37%**.
  
* Average order value recorded a single increase in September 2022, which can be associated with an increased share of order volume toward premium products such as high-cost laptops.

![Ekran görüntüsü 2025-04-17 190552](https://github.com/user-attachments/assets/9ce18aed-b5a5-4aa5-9471-f4fc9f2841ff)


### Key Product Level Performance:

* **86% of the TechHive’s total revenue is concentrated in three products**, Gaming Monitor which holds the highest individual revenue share at 35%, Apple AirPods, and MacBook Air Laptop. These three products have generated 75,000 orders, representing 70% of total order volume, indicating a high dependency on a narrow product assortment.
 
* **In 2022**, **85% of the company's total orders comes from just three products**, Apple AirPods, Gaming Monitor, and MacBook Air Laptop. These products accounted for $3.96M in revenue in 2022, 79% of the company's total revenue.
  
* In the headphones category, the Bose SoundSport Headphones have underperformed, contributing to less than 1% of total revenue and orders despite being, on average, $40 cheaper than the well-performing Apple Airpods.

* The accessories category has grown in its share of total orders, increasing from **21% to 32%** in 2022. However, it still contributes less than 4% to overall revenue, indicating that while accessories are moving in volume, they generate limited financial impact.
  
* Between 2019 and 2022, Apple products **contributed to over 46% of total annual revenue on average**. However, this contribution was largely driven by high-performing products such as AirPods and the MacBook Air. In contrast, the iPhone’s contribution remained minimal, accounting for less than **1%** of both total orders and revenue per year, and revealing a notable performance gap within the brand’s product line.

![paylaşEkran görüntüsü 2025-04-15 204554](https://github.com/user-attachments/assets/07fc019b-3c31-4a69-85e7-38834c146919)


### Loyalty Program Performance:

* From 2019 to 2022, **loyalty members contributed 39% of total revenue**, with an average order value of **$240**. In contrast, **non members contributed 61%, spending $40 more per transaction on average**.

* The loyalty program, introduced in 2019, has shown promising growth potential. By April 2022, loyalty members reached a peak revenue share of 69%. **On an annual basis, they accounted for 60% of total revenue in 2022, up from 11% in 2019, 33% in 2020, and 55% in 2021**. This significant growth highlights the rising economic impact and transactional strength of the loyalty segment.

* In 2022, despite an overall decline in sales performance, **returning loyalty members maintained strong engagement spending $60 more per order than non-members and generating $2.7M in revenue.** This underscores the program’s continued ability to drive retention and high-value purchasing, even during market downturns.
  
![Ekran görüntüsü 2025-04-17 190112](https://github.com/user-attachments/assets/b1eed679-7950-4b31-99e3-c70fda79debb)


### Regional Comparisons:

* **North America is the company’s largest market, contributing 51% of total revenue and 47% of total order volume.** It is followed by Europe, the Middle East, and Africa, accounting for 29% of revenue and 25% of orders, then Asia-Pacific with 12% of revenue and 10% of orders, and finally Latin America, contributing 6% of revenue and 0.06% of total order volume.

* Between 2019 and 2022, North America consistently led in both revenue and order volume, with Q4 peaks driven by seasonal trends. Despite its dominance, the region experienced a 7% decline in average order value, suggesting a shift toward a broader customer base making more frequent but lower-value purchases.
  
* In 2022, both average order value and revenue declined across all regions. However, **North America maintained the highest AOV at $242, which is 35% higher than Latin America, the region with the lowest performer.**
  
* In Q4 2022, Europe, the Middle East, and Africa experienced a significant surge in order volume share, **increasing from 26% to 33% quarter-over-quarter**, highlighting robust seasonal demand and regional sales performance.

![Ekran görüntüsü 2025-04-13 001140](https://github.com/user-attachments/assets/cf421d16-1295-4dbb-9536-27571d998abd)


# Recommendations:

* With 70% of orders and 86% of revenue coming from just three products, diversifying the product category is crucial to reduce depency and mitigate business risk. Expanding the accessory category with new, high-demand product lines such as Apple charging cables, would provide opporunuties for upselling and support sustainable revenue growth.

* Capitalize on the growing share of Samsung accessories, which accounted for 32% of order count in 2022, **by introducing higher-cost Samsung products in already carried product categories such as laptops and cellphones.**

* **Reevaluate the performance of Bose SoundSport Headphones.** Since the product has consistently accounted for less than 1% of annual revenue, consider selling through remaining stock by offering bundle deals and flash sales targeted at loyalty members who are not part of the Apple ecosystem before discontinuing it.

* Despite the overall sales success of Apple products, iPhone sales have remained disappointingly low, contributing only 1% of revenue each year. **Enhancing marketing efforts targeted at previous Apple product buyers could boost Apple iPhone sales.**

* **Continue and push forward the loyalty program.** In order to convert non-members, consider offering a one-time sign-up discount paired with increased general marketing of membership benefits and savings. Focus targeted and personalized ads on previous customers, and utilize past order data to increase marketing efforts when previously purchased products may need replacing.

* While North America is the top-performing region, contributing 51% of total revenue and 47% of total orders, continue to prioritize this key market. **Consider targeted marketing campaigns and bundled offers to encourage higher-value purchases and reverse the downward trend in average order value.**
