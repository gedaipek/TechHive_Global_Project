
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
TechHive Global, US-based e-commerce company founded in 2018, specializes in selling popular electronics such as Apple, Samsung, and ThinkPad products worldwide through its website and mobile app.

The company holds a significant amount of data related to its sales, marketing efforts, operational efficiency, product portfolio, and customer loyalty program that has been underutilized. This project thoroughly analyzes and synthesizes that data to uncover actionable insights that drive strategic decisions and enhance TechHive Global’s competitive edge and overall success.

Insights and recommendations are provided on the following key areas:

- **Sales Trends and Growth Rates:** Evaluating historical sales patterns globally and by region, focusing on revenue, order volume, and average order value.
- **Key Product Performance:** An analysis of various of product lines to understand their impacts on revenue
- **Loyalty Program Performance:** Evaluating the impact of the loyalty program on customer retention and sales.
- **Regional Comparisons:** Comparing performance across regions in terms of sales and order volume.

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [scripts/SQL/EDA(Exploratry].



# Data Structure & Initial Checks

TechHive Global's database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 180,127 records. A description of each table is as follows:


![erd](https://github.com/user-attachments/assets/334981a3-cdd5-46d0-988e-e35f550562e8)


Prior to beginning the analysis, a variety of checks were conducted to ensure data quality and to become familiar with the dataset. The SQL queries utilized to inspect and perform quality control checks can be found here [link].


# Executive Summary

### Overview of Findings

TechHive's sales analysis of 180k records between 2019-2022 shows annual revenue stabilizing at around $7 million, with North America, Europe, The Middle East, and Africa contributing 85% of sales. Gaming Monitor, and Apple Airpods account for 65% of revenue. The company experienced strong growth that peaked in late 2020 with a 163% increase in revenue. However, the company’s sales have steadily declined afterward, with significant drops recorded in 2022. Key performance indicators show year over year decreases across the board: revenue fell by 46%, order volume by 40%, and average order value by 10%. While this sharp decline may reflect post-pandemic market normalization, the following sections will explore additional factors influencing sales performance and highlight key opportunity areas for improvement.

Below is the sales overview page from the Power BI dashboard and more examples are included throughout the report. The entire interactive dashboard can be found here [link].

![sonnn](https://github.com/user-attachments/assets/7e51bda8-9f7d-4a9d-b822-db70289bb997)


# Insights Deep Dive
### Sales Trends and Growth Rates:

* The company's sales peak in December 2020 with 4,005 total orders and $1,246,007 monthly revenue. This corresponds with the boom in economy-wide spending due to pandemic changing customer behavior. The company's sales peak in December 2020 with 4,005 total orders and $1,246,007 monthly revenue. This corresponds with the boom in economy-wide spending due to pandemic changing customer behavior.
  
* Starting from in April 2021, revenue declined on a year over year basis for 21 consecutive months. In October 2022, revenue hit a company lifetime low, with $178K, and 72% year over year decline. In the following months revenue recovered slightly, following spesific holiday seasonality patterns.
  
* Despite the downward trend in 2022, the company's overall performance exceeds 2019 pre-pandemic level baseline in all three key indicator performance indicators. This is primarily due to the stronger 1Q22, which recorded revenue and order count well above the same period in 2020, up 37% and 23% respectively.
  
* Average order value increased only once in September 2022, this can be attributed to an increased share of high-cost laptop orders.


![image](https://github.com/user-attachments/assets/89cead48-0e5f-4baf-92f5-9a373c187a4a)


### Key Product Level Performance:

* 86% of the TechHive’s total revenue is concentrated in three products, Gaming Monitor which holds the highest individual revenue share at 35%, Apple Airpods, and Macbook Air Laptop. These three products have generated 75,000 orders, representing 70% of total order volume, indicating a high dependency on a narrow product assortment.
 
* In 2022, 85% of the company's total orders comes from just three products, Apple Airpods, Gaming Monitor, and Macbook Air Laptop. These products accounted for $3.96M in revenue in 2022, 79% of the company's total revenue.
  
* In the headphones category, the Bose Soundsport Headphones have underperformed, contributing to less than 1% of total revenue and orders despite being, on average, $40 cheaper than the well-performing Apple Airpods.

* The accessories category has grown in its share of total orders, increasing from 21% to 32% in 2022. However, it still contributes less than 4% to overall revenue, indicating that while accessories are moving in volume, they generate limited financial impact.
  
* In the smarphone category, Apple Iphone generated under 1% of the company's total revenue and accounted for less than 1% of total orders between 2019 and 2022. In contrast, other Apple products such as the Airpods and Macbook Air together contributed over 50% of total revenue during the same period.

![3](https://github.com/user-attachments/assets/5e737f72-bb91-48da-8075-582cf65b8485)


### Loyalty Program Performance:

* Loyalty members contributed 36% of total revenue by spending an average of $244 per order, while non-members contributed 64% by spending $40 more per transaction on average.
  
* In 2019, loyalty members spent an average of $206 per order, generating around $390K in revenue. In contrast, non-members spent $232 per order, resulting in an 11% higher contribution to revenue compared to loyalty members.

* In 2021, the order volume share of loyalty members increased by 52%, driven by the acquisition of new members and repeat purchases from existing ones. Despite having a similar average order value of $260, non-members contributed $4.4M to total revenue. This contrast highlights the growing transactional value and economic impact of the loyalty segment.
  
* In 2022, despite a general downward trend in performance across both loyalty members and non-members, returning loyalty customers spent $30 more per order compared to non-members, contributing $2.7M in revenue. In contrast, non-members spent an average of $214 per order, resulting in $2.2M in total revenue. This highlights that even during periods of overall decline, the loyalty program continues to positively impact customer retention and spending behavior.
  

![aov by loyalty](https://github.com/user-attachments/assets/a058da61-437a-4adb-8ed7-f79d4070cb3a)


### Regional Comparisons:

* North America is the company’s largest market, contributing 51% of total revenue and 47% of total order volume. It is followed by Europe, the Middle East, and Africa, accounting for 29% of revenue and 25% of orders, then Asia-Pacific with 12% of revenue and 10% of orders, and finally Latin America, contributing 6% of revenue and 0.06% of total order volume.

* From 2019 to 2022, North America consistently held the highest share of both revenue and order volume, with particularly strong performance in Q4 due to seasonal patterns. While revenue and volume remained solid, average order value declined by 7%, indicates a shift toward a broader customer base making smaller, more frequent purchases.
  
* In 2022, both average order value and revenue declined across all regions. However, Asia-Pacific maintained the highest AOV at $241, which is approximately 35% higher than Latin America, the region with the lowest performer.
  
* In Q4 2022, Europe, the Middle East, and Africa experienced a significant surge in order volume share, increasing from 26% to 33% quarter-over-quarter, highlighting robust seasonal demand and regional sales performance.

![sales by regions](https://github.com/user-attachments/assets/535e2f32-9bf5-4b47-82db-1033ba2b65ca)


# Recommendations:

* With 70% of orders and 86% of revenue coming from just three products, diversifying the product category is crucial to reduce business risk. Expanding the accessory category with new, high-demand product lines, particularly Apple charging cables, would provide upsell opportunities and support sustainable revenue growth.

* Capitalize on the growing share of Samsung accessories which 32% of order count in 2022 by introducing higher-cost Samsung products in already carried product categories such as laptops and cellphones.

* Reevaluate and optimize Bose SoundSport Headphones. As the product has never made up more than 1% of annual revenue, attempt to sell through the product by implementing bundle offers and flash sales to non-Apple ecosystem loyalty members before discontinuing.

* Despite the general sales success of Apple products, iPhone sales have been disappointingly low (1% of revenue in 2022). Enhancing marketing efforts to previous Apple product buyers could boost sales.

* Continue and push forward the loyalty program. In order to convert non-members, consider offering a one-time sign-up discount paired with increased general marketing of membership benefits and savings. Focus targeted and personalized ads to previous customers, and utilize past order data to increase marketing efforts when previously purchased products may need replacing.

* While the North America is the top-performer region, contributing 51% of total revenue and 47% of total orders, continuing to prioritize this key market, consider targeted marketing campaigns and bundled offers to encourage higher-value purchases and reverse the downward trend in AOV.


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the purchase date column contained non-sensical dates, these were excluded from the analysis)
