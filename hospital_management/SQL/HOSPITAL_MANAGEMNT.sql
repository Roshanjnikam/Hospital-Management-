--- create table Doctor 
create table Doctor(
                    Doctor_id TEXT primary key ,
					First_Name VARCHAR(100) not null,
					Last_Namle VARCHAR(100),
					Specialization VARCHAR(100),
					Phone_Number VARCHAR(15) ,
					Year_Experience INT,
					Hospital_Branch VARCHAR(100),
					Email VARCHAR(100) 
					
);
---create table Patient
create table Patient(
                  Patient_id TEXT primary key,
				  First_Name VARCHAR(100) not null,
				  Last_name VARCHAR(100),
				  Gender VARCHAR(10),
				  D_o_b DATE,
				  Contact_No VARCHAR(15),
				  Address TEXT,
				  Registration_date DATE,
				  Insurance_Provider VARCHAR(100),
				  Insuarance_No TEXT,
				  Email varchar(100)
				  				  
);
--- create table Appointment
create table Appointment(
                       Appointment_id TEXT primary key,
					   Patient_id TEXT REFERENCES Patient(Patient_id),
					   Doctor_id TEXT REFERENCES Doctor(Doctor_id),
					   Appointment_date DATE,
					   Appointment_time TIME,
					   ReAson_for_visit TEXT,
					   Status VARCHAR(30)
);
---create tabke tretment
create table Treatment(
                      Treatment_id TEXT primary key,
					  Appointment_id TEXT REFERENCES Appointment(Appointment_id),
					  Tretment_type TEXT,
					  Description TEXT,
					  Cost DECIMAL(10,2),
					  Treatment_date DATE
			  
);
---create table billing
create table Billing(
                     Bill_id TEXT primary key,
					 Patient_id TEXT REFERENCES Patient(Patient_id),
					 Treatment_id TEXT REFERENCES Treatment(Treatment_id),
					 Bill_date DATE,
					 Amount DECIMAL(10,2),
					 Payment_method varchar(100),
					 Payment_status Varchar(100)
);

---- add data from csv
copy doctor from 'D:\postgres\Projects\hospital_management\doctors.csv' delimiter ',' HEADER;
copy patient from 'D:\postgres\Projects\hospital_management\patients.csv' delimiter ',' HEADER;
copy appointment from 'D:\postgres\Projects\hospital_management\appointments.csv' delimiter ',' HEADER;
copy treatment from 'D:\postgres\Projects\hospital_management\treatments.csv' delimiter ',' HEADER;
copy billing from 'D:\postgres\Projects\hospital_management\billing.csv' delimiter ',' HEADER;

--- 
---Patient & Appointment Analysis 

---1.How many total appointments were made per doctor?
select d.first_name ||' ' || d.last_namle as doctor_name, 
count(a.appointment_id) as total_appointment from doctor as d 
left join appointment as a  on d.doctor_id=a.doctor_id 
group by doctor_name 
order by total_appointment desc;

---2.Which patients have the highest number of appointments?
select p.first_name ||' '|| p.last_name as patient_name,
count(a.appointment_id) as total_appointments from patient as p 
left join appointment as a on p.patient_id=a.patient_id
group by patient_name
order by total_appointments desc;

---3.What is the trend of appointments over the last 12 months?
SELECT  extract(month from appointment_date) AS month_name,
           COUNT(*) AS total_appointments
FROM appointment group by month_name order by month_name;

---4.How many appointments were completed, canceled, or pending?
select status,count(a.appointment_id) as appointment from appointment as a 
group by status order by appointment desc;

---Billing & Revenue

---5.What is the total billing amount generated per month?
select extract(month from b.bill_date)as Month ,sum(b.amount) as Total_Amount 
from billing as b group by Month order by Month ;

--- 6.Which doctor generates the most revenue?
select d.first_name ||' '|| d.last_namle as doctor_name ,
sum(b.amount) as revenue from doctor as d
join appointment as a on d.doctor_id=a.doctor_id
join billing as b on a.patient_id=b.patient_id 
group by doctor_name order by revenue desc;

---7.What is the average billing amount per treatment type?
select  t.tretment_type as treatmenttype ,avg(b.amount) as average_amount 
from treatment as t
left join billing as b on t.treatment_id=b.treatment_id 
group by treatmenttype order by average_amount desc;

---8.What percentage of billing is overdue or unpaid?
select payment_status,count(*)*100.0/(select count(*) from billing) as percentage
   from billing group by Payment_status;

---Treatment & Diagnosis

---9.How many patients received each type of treatment?
select tretment_type,count(appointment_id) as total
from treatment group by tretment_type order by total desc;

---10.What is the average cost associated with each treatment?
select tretment_type, avg(cost) as average_cost from treatment 
group by tretment_type order by average_cost desc;

---11 what is the revenue by each treatment?
select tretment_type, sum(cost) as revenue from treatment group by tretment_type 
order by revenue desc;

---Doctor Performance

---12.Which doctors have the highest number of appointments?
select d.first_name ||' '||d.last_namle  as Name ,count(a.appointment_id) as total from doctor as d
left join appointment as a on d.doctor_id=a.doctor_id 
group by Name order by total desc;

---13.What is the average appointment time per doctor? (if you have time data)
select d.first_name ||' '|| d.last_namle as name , avg(a.appointment_time) as average_time
from doctor as d 
left join appointment as a on d.doctor_id=a.doctor_id
group by name order by average_time desc;

---14.How does the revenue generated by each doctor compare?
select d.first_name ||' '|| d.last_namle as name ,sum(b.amount) as total_revenue from doctor as d
join appointment as a on d.doctor_id=a.doctor_id 
join billing as b on a.patient_id=b.patient_id
group by name order by total_revenue desc;

---Patient Behavior & Outcomes

---15.How often do patients revisit the hospital ?
select distinct(p.patient_id) as patientID ,
p.first_name ||' '|| p.last_name as name ,
count(a.appointment_id) as visit_total from patient as p
join appointment as a on p.patient_id=a.patient_id
group by patientID , name order by visit_total desc;

---16.What percentage of patients have multiple treatments?
WITH treatment_counts AS (
    SELECT
        a.patient_id,
        COUNT(t.treatment_id) AS treatment_count
    FROM treatment t
    JOIN appointment a ON t.appointment_id = a.appointment_id
    GROUP BY a.patient_id
)
SELECT
    CASE WHEN treatment_count > 1 THEN 'Multiple Treatments' ELSE 'Single Treatment' END AS treatment_group,
    COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT patient_id) FROM appointment) AS percentage
FROM treatment_counts
GROUP BY treatment_group;

---17.Are there seasonal patterns in patient visits or treatments?
with seasonal as( select extract(month from treatment_date)as month ,
count(*) as total_appointment from treatment group by month order by month)
select 
      case
	  when month>=1 and month<=3 then 'quarter_1'
	  when month>=3 and month<=6 then 'quarter_2'
	  when month>=6 and month<=9 then 'quarter_3'
	  when month>=9 and month <=12 then 'quarter_4'
	  else 'invalid' end as quarters,
	  sum(total_appointment) as total_appointment from  seasonal 
	  group by quarters order by quarters ;

---- another way
select extract(month from treatment_date)as month ,count(*) as total_appointment
from treatment group by month order by month ;

