
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

- **Sales Trends and Growth Rates:** Evaluating historical sales patterns globally and by region, focusing on revenue, order volume, and average order value.
- **Key Product Performance:** An analysis of various of product lines to understand their impact on revenue
- **Loyalty Program Performance:** Evaluating the impact of the loyalty program on customer retention and sales.
- **Regional Comparisons:** Comparing performance across regions in terms of sales and order volume.

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [scripts/SQL/EDA(Exploratry].

# Data Structure & Initial Checks

TechHive Global's database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 180,127 records. A description of each table is as follows:

![erdgithub](https://github.com/user-attachments/assets/4c23ec7d-4d12-4e1c-9db2-219a34f194f9)

Prior to beginning the analysis, a variety of checks were conducted to ensure data quality and to become familiar with the dataset. The SQL queries utilized to inspect and perform quality control checks can be found here. (https://github.com/gedaipek/SQL-project/blob/main/scripts/SQL/Example%20Data%20Quality%20Checks..sql).


# Executive Summary

### Overview of Findings

From 2019 to 2022, TechHive’s average number of sales per year was 27,000, generating $7 million in annual revenue with an average order value of $260. In 2020, the company recorded its highest growth rate, with more than double the number of sales and total sales revenue than 2019. MacBook Air sales were the main product driver of this spike, growing 384% from 2019 to 2020. However, this upward trend reversed in the following years, with significant drops recorded in 2022. Key performance indicators show year over year declines across the board: revenue fell by 46%, order volume by 40%, and average order value by 10%. While this sharp decline may reflect post-pandemic market normalization, the following sections will explore additional factors influencing sales performance and highlight key opportunity areas for improvement.

Below is the sales overview page from the Power BI dashboard and more examples are included throughout the report. The entire interactive dashboard can be found here [link].

![1 192240](https://github.com/user-attachments/assets/7b8d7d66-3f3c-4c47-9810-31fb69bd97c9)


# Insights Deep Dive
### Sales Trends and Growth Rates:

* The company's sales peak in December 2020 with 4,005 total orders and $1,246,007 monthly revenue. This corresponds with the boom in economy-wide spending due to pandemic changing customer behavior.
  
* Starting from in April 2021, revenue declined on a year over year basis for 21 consecutive months. In October 2022, revenue hit a company lifetime low, with $178K, and 72% year over year decline. In the following months revenue recovered slightly, following spesific holiday seasonality patterns.
  
* Despite the downward trend in 2022, the company's overall performance exceeds 2019 pre-pandemic level baseline in all three key indicator performance indicators. This is primarily due to the stronger 1Q22, which recorded revenue and order volume well above the same period in 2020, up 37% and 23% respectively.
  
* Average order value recorded a single increase in September 2022, which can be associated with an increased share of order volume toward premium products such as high-cost laptops.

![ekleEkran görüntüsü 2025-04-15 203008](https://github.com/user-attachments/assets/b3944d4e-3650-4ff7-905a-fdd861ee8e33)


### Key Product Level Performance:

* 86% of the TechHive’s total revenue is concentrated in three products, Gaming Monitor which holds the highest individual revenue share at 35%, Apple Airpods, and Macbook Air Laptop. These three products have generated 75,000 orders, representing 70% of total order volume, indicating a high dependency on a narrow product assortment.
 
* In 2022, 85% of the company's total orders comes from just three products, Apple Airpods, Gaming Monitor, and Macbook Air Laptop. These products accounted for $3.96M in revenue in 2022, 79% of the company's total revenue.
  
* In the headphones category, the Bose Soundsport Headphones have underperformed, contributing to less than 1% of total revenue and orders despite being, on average, $40 cheaper than the well-performing Apple Airpods.

* The accessories category has grown in its share of total orders, increasing from 21% to 32% in 2022. However, it still contributes less than 4% to overall revenue, indicating that while accessories are moving in volume, they generate limited financial impact.
  
* In the smarphone category, Apple Iphone generated under 1% of the company's total revenue and accounted for less than 1% of total orders between 2019 and 2022. In contrast, other Apple products such as the Airpods and Macbook Air together contributed over 50% of total revenue during the same period.

![paylaşEkran görüntüsü 2025-04-15 204554](https://github.com/user-attachments/assets/07fc019b-3c31-4a69-85e7-38834c146919)


### Loyalty Program Performance:

* From 2019 to 2022, loyalty members contributed 39% of total revenue, with an average order value of $240. In contrast, non-members contributed 61%, spending $40 more per transaction on average.

* The loyalty program, introduced in 2019, has shown promising growth potential. By April 2022, loyalty members reached a peak revenue share of 69%. On an annual basis, they accounted for 60% of total revenue in 2022, up from 11% in 2019, 33% in 2020, and 55% in 2021. This significant growth highlights the rising economic impact and transactional strength of the loyalty segment.

* In 2022, despite an overall decline in sales performance, returning loyalty customers maintained strong engagement spending $60 more per order than non-members and generating $2.7M in revenue. This underscores the program’s continued ability to drive retention and high-value purchasing, even during market downturns.
  

![4](https://github.com/user-attachments/assets/6a54b4f7-93cf-4ba9-8a85-c1fb36d0cba0)


### Regional Comparisons:

* North America is the company’s largest market, contributing 51% of total revenue and 47% of total order volume. It is followed by Europe, the Middle East, and Africa, accounting for 29% of revenue and 25% of orders, then Asia-Pacific with 12% of revenue and 10% of orders, and finally Latin America, contributing 6% of revenue and 0.06% of total order volume.

* Between 2019 and 2022, North America consistently led in both revenue and order volume, with Q4 peaks driven by seasonal trends. Despite its dominance, the region experienced a 7% decline in average order value, suggesting a shift toward a broader customer base making more frequent but lower-value purchases.
  
* In 2022, both average order value and revenue declined across all regions. However, Asia-Pacific maintained the highest AOV at $241, which is approximately 35% higher than Latin America, the region with the lowest performer.
  
* In Q4 2022, Europe, the Middle East, and Africa experienced a significant surge in order volume share, increasing from 26% to 33% quarter-over-quarter, highlighting robust seasonal demand and regional sales performance.

![Ekran görüntüsü 2025-04-13 001140](https://github.com/user-attachments/assets/cf421d16-1295-4dbb-9536-27571d998abd)


# Recommendations:

* With 70% of orders and 86% of revenue coming from just three products, diversifying the product category is crucial to reduce business risk. Expanding the accessory category with new, high-demand product lines, particularly Apple charging cables, would provide upsell opportunities and support sustainable revenue growth.

* Capitalize on the growing share of Samsung accessories which 32% of order count in 2022 by introducing higher-cost Samsung products in already carried product categories such as laptops and cellphones.

* Reevaluate and optimize Bose SoundSport Headphones. As the product has never made up more than 1% of annual revenue, attempt to sell through the product by implementing bundle offers and flash sales to non-Apple ecosystem loyalty members before discontinuing.

* Despite the general sales success of Apple products, iphone sales have been disappointingly low (1% of revenue in 2022). Enhancing marketing efforts to previous Apple product buyers could boost sales.

* Continue and push forward the loyalty program. In order to convert non-members, consider offering a one-time sign-up discount paired with increased general marketing of membership benefits and savings. Focus targeted and personalized ads to previous customers, and utilize past order data to increase marketing efforts when previously purchased products may need replacing.

* While the North America is the top-performer region, contributing 51% of total revenue and 47% of total orders, continuing to prioritize this key market, consider targeted marketing campaigns and bundled offers to encourage higher-value purchases and reverse the downward trend in average order value.
