# Hospital Management Data Analysis Project
##### By: Roshan Nikam
### 1. Introduction
This project focuses on analysing hospital operations by integrating data from multiple functional units, including patient management, doctor schedules, appointments, treatments, and billing. Using SQL, Power BI, and Python, the project delivers data-driven insights to support better decision-making, improve resource utilization, and enhance overall hospital efficiency.

### 2. Project Objectives
• Import, clean, and manage hospital datasets using SQL.
• Perform advanced SQL querying.
• Build interactive dashboards in Power BI.
• Visualize insights using Python.
• Evaluate KPIs such as revenue, patient load, cancellations, and treatment costs.

### 3. Tools & Technologies Used
PostgreSQL (pgAdmin) – Data storage & SQL queries
Power BI – Dashboard creation
Python – Statistical analysis & charts
Pandas – Data preprocessing
Matplotlib/Seaborn – Visualizations

### 4. Dataset Summary
The project used five datasets:
• doctors.csv
• patients.csv
• appointments.csv
• billing.csv
• treatment.csv


### 5. Data Preparation
• Imported all CSV files into PostgreSQL.
• Cleaned missing values and inconsistencies.
• Created relational links via keys.
• Converted data types.
• Added measures in Power BI.

### 6. SQL Data Analysis
Analyses included:
• Appointments per doctor
• Monthly appointment trends
• Billing status
• Revenue per treatment
• Patient revisit frequency

### Sample SQL Query
SELECT d.name AS doctor_name,
       COUNT(a.appointment_id) AS total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;

7. Power BI Dashboard
Dashboard included:
• Bar chart: Patients per doctor
• Line chart: Appointment trend
• Pie chart: Billing status
• Donut chart: Appointment status
• KPIs: Total revenue, patients, gender ratio

### 7. Power BI Dashboard
Imported SQL data into Power BI.
Created dynamic and interactive dashboards with slicers for:
   o Reason for visit
   o Treatment type

### 8. Python Visualizations
Generated bar plots, line charts, and pie charts for enhanced insights.

### 09. Key Insights & Findings
• Chemotherapy & X-Ray had highest visits.
• 25% appointments cancelled.
• Dr. Sarah Taylor had most patients.
• Month 1 & Q2 saw peak visits.
• 34% billing pending, 33% failed.
• MRI generated highest revenue.


### 8. Python Visualizations
Used Python to create additional insights and visualizations using Pandas, Matplotlib, and
Seaborn.
Visuals Created:
Bar plot’s
Pie chart
Tables
line graph
#### Example Python Code:
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
query1=””” SELECT d.name AS doctor_name, COUNT(a.appointment_id) AS
total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;”””
df = pd.read_sql("query1, engine")
sns.barplot(data=df, x='department', y='total_charges')
plt.title("Billing Charges by Department")
plt.show()

### 9. Key Insights & Results
Highest patient traffic is in the Chemotherapy and X-Ray treatment.
25% Appointment Cancelled
Doctor Dr. Sarah Taylor had the highest number of patients.
Quarter two of the year and first month had peak appointment bookings.
34% billing amount pending and 33% bill failed.
Generated most revenue in first month.
16-time one patient took appointments.
Generated most revenue in MRI treatment type.
38 % received payment by credit card
10-time one patient visited to hospital.

### 11. Conclusion
The project effectively demonstrated how hospital data can be transformed into insights
through SQL, Power BI, and Python. The dashboards and visualizations provide a useful
analytical tool for hospital administrators to monitor operations and improve service
delivery.

### Power BI Dashboard Images
<img width="1189" height="667" alt="Dashboard" src="https://github.com/user-attachments/assets/089baea3-4cc4-4e1d-b736-780d23ddfa79" />





