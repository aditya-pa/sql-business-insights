# 📊 SQL Business Insights Project

## 🚀 Overview

This project uses SQL to analyze restaurant customer data, answering key business questions and uncovering insights on ordering behavior and promo code usage. The findings are shared through SQL queries, a Word document, and a PowerPoint presentation for actionable business insights.

---

## 📂 Project Structure

| File / Folder               | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| `SQL_Queries.sql`           | Contains all SQL queries written to explore and answer the business questions. |
| `Findings_Document.docx`    | Word document summarizing key insights and data analysis results.          |
| `Findings_Presentation.pptx`| PowerPoint presentation summarizing the insights and recommendations.       |
| `Dashboard.jpg`             | Screenshot of dashboard                                                     |

---

## 📌 Key Insights

- ✅ 82.5% of orders were placed using **promo codes**.
- 🍽️ Orders were **evenly split across cuisine types**.
- 🚫 Only **1 out of 73 orders was cancelled** — very low failure rate.
- 📈 Identified **daily new user acquisition** since platform launch.
- 🔁 Found customers who **churned after a single order** in Jan 2025.
- 📉 Detected users acquired a month ago who haven't ordered in the last 7 days.
- 🔔 Created query logic to help **growth team trigger messages after every 3rd order**.
- 💸 Found repeat customers who **only use promo codes**.
- 📊 Calculated the **percentage of organic customers** in Jan 2025 (placed first order without a promo).

---

## ❓ Business Questions Answered

1. Top 3 outlets by cuisine type (without using `TOP` or `LIMIT`).
2. Daily new customer acquisition trend since launch.
3. Users acquired in Jan 2025 who only placed one order.
4. Customers inactive for 7 days but acquired a month ago via promo.
5. Trigger query for targeting customers after every third order.
6. Users with more than one order, all using promo codes.
7. Percentage of organically acquired customers in Jan 2025.

---

## 📚 Source

The business questions in this project are inspired by a video from **Ankit Bansal’s YouTube channel**. This project was created purely for learning and practice purposes.

---

## 🧰 Tools Used

- **SQL Server Management Studio (SSMS)** – for data exploration and querying  
- **Power BI** – for interactive dashboard creation  
- **Word** – for summarizing findings and analysis in a detailed report  
- **PowerPoint** – for presenting insights to stakeholders

---

## 📥 Dataset Summary

- **73 rows**, **7 columns**
- **9 unique restaurants**
- High **promo code usage**
- Balanced distribution of **cuisine types**
- Only **1 cancelled order**

---

## 💡 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sql-business-insights.git
