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

### 12. Appendix
#### ERD

<img width="929" height="554" alt="image" src="https://github.com/user-attachments/assets/441c9e8d-ede4-4b3c-a6f0-96db1b93af03" />

#### there is so many SQL Queris just check sample Snapshots

<img width="466" height="320" alt="image" src="https://github.com/user-attachments/assets/a2ee8ae0-34a5-4f6a-b849-644339e70d57" />

<img width="482" height="319" alt="image" src="https://github.com/user-attachments/assets/b3f75089-363d-472b-9f28-08cab80bbf20" />

<img width="941" height="160" alt="image" src="https://github.com/user-attachments/assets/c0c8d7e6-a4e3-4e87-87c7-b28ea718cef4" />

<img width="940" height="356" alt="image" src="https://github.com/user-attachments/assets/3117d783-2431-4b3a-bdee-8fa20c93d3c9" />

<img width="940" height="388" alt="image" src="https://github.com/user-attachments/assets/08f16ce8-372c-40b7-b7a6-3cfb94cb454c" />


### Power BI Dashboard Images
<img width="1189" height="667" alt="Dashboard" src="https://github.com/user-attachments/assets/089baea3-4cc4-4e1d-b736-780d23ddfa79" />

### Python Graph Outputs

<img width="617" height="290" alt="image" src="https://github.com/user-attachments/assets/f46cd564-35cc-4032-9b61-e4c123359df3" />

<img width="438" height="350" alt="image" src="https://github.com/user-attachments/assets/dcd8af40-26f9-4488-b0be-81214e57ac99" />

<img width="598" height="337" alt="image" src="https://github.com/user-attachments/assets/4f121746-41e4-4db0-b67b-84add1a3e321" />

<img width="643" height="310" alt="image" src="https://github.com/user-attachments/assets/3aa3489e-e81f-40a5-9aa7-454470d7f6bc" />

<img width="582" height="366" alt="image" src="https://github.com/user-attachments/assets/1f337bda-de93-4496-a081-b3323c16fe98" />

<img width="680" height="335" alt="image" src="https://github.com/user-attachments/assets/ea9eba7f-2f1c-4f40-b18c-6c88ae1c9c65" />





 5)


 6)
