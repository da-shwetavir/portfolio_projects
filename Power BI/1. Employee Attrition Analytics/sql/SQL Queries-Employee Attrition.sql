select * from hr_data;
-- 1. Total Employees 
select sum(`Employee Count`) as Total_Employees from  hr_data;

-- 2. Education Wise Total Employees 
select sum(`Employee Count`) as Total_Employees from  hr_data
where Education IN ('High School');

-- 3. Department wise Total Employees
select sum(`Employee Count`) as Total_Employees from  hr_data
where Department IN ('Sales');

-- 4. Education_Field Wise Total Employees
select sum(`Employee Count`) as Total_Employees from  hr_data
where `Education Field` IN ('Medical');

-- 5. Attrition Count
select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes';

-- 6. Attrition Count Education Wise
select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND 
Education IN ('Doctoral Degree');

-- 7. Attrition Count Department Wise
select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND 
Department IN ('R&D');

-- 8. Attrition Count both department &  Education Field Wise
select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND Department IN ('R&D')
AND `Education Field` = 'Medical';

-- 9. Attrition Count with all  department ,  Education Field and Education wise
select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND Department IN ('R&D')
AND `Education Field` = 'Medical' and Education ='High School';

-- 10. Attrition Rate (Attrition count / Employees Count)
select 
ROUND(((select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' )
/sum(`Employee Count`)*100),2) as Attrition_Rate from hr_data;

-- 11. Attrition Rate (Attrition count / Employees Count) by Department 
select 
ROUND(((select count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND department = 'Sales' )
/sum(`Employee Count`)*100),2) as Attrition_Rate from hr_data
where department = 'Sales';

-- 12 Active Employees (Employees Count - Attrition Count)
Select (sum(`Employee Count`) - (select count(Attrition) as Attrition_count from hr_Data 
where Attrition = 'Yes' )) as Active_Employees from hr_data;

-- 13. Active Employees (Employees Count - Attrition Count) by Gender
Select (sum(`Employee Count`) - (select count(Attrition) as Attrition_count from hr_Data 
where Attrition = 'Yes' AND Gender ='Male')) as Active_Employees from hr_data where Gender ='Male';

-- 14. Avg Age
select Round(avg(age),0) as Avg_Age from hr_data;

-- 15. Attrition by Gender
select Gender, count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes'
Group by Gender
order by count(attrition)  DESC;

-- 16. Attrition by Gender
-- i) Filter by Education
-- ii) Filter by Department
select Gender, count(attrition) as Attrition_Count from hr_data
where Attrition = 'Yes' AND Education ='High School'
-- AND Department = 'Sales'
Group by Gender
order by count(attrition)  DESC;

# Charts
-- 1. Department wise Attrition
select Department, count(Attrition) as Attrition_Count,
ROUND((count(Attrition) / (Select count(Attrition) from hr_data where  Attrition = 'Yes')*100) ,2) as Dept_Attrition_pct
from hr_data
where Attrition = 'Yes'
Group by Department
order by Attrition_Count DESC;

-- 1. Department wise Attrition Filter by Gender
select Department, count(Attrition) as Attrition_Count,
ROUND((count(Attrition) / (Select count(Attrition) from hr_data where  Attrition = 'Yes' and Gender = 'Female')*100) ,2) as Dept_Attrition_pct
from hr_data
where Attrition = 'Yes' AND Gender = 'Female'
Group by Department
order by Attrition_Count DESC;

-- 3. No. of Employees by Age Group
select age, sum(`Employee Count`) from hr_data
group by age
order by Age;

-- 4. No. of Employees by Age Group Filter with Department
select age, sum(`Employee Count`) from hr_data
where department = 'R&D'
group by age
order by Age;

-- 5. Education Field Wise Attrition
select `Education Field`, count(Attrition) AS Attrition_count From hr_data
where Attrition = 'Yes'
group by `Education Field`
order by count(Attrition) DESC;

-- 6. Education Field Wise Attrition Filter with Department
select `Education Field`, count(Attrition) AS Attrition_count From hr_data
where Attrition = 'Yes' and Department = 'R&D'
group by `Education Field`
order by count(Attrition) DESC;

-- 7. Attrition by Age Groups and Gender
select `CF_age band`, Gender, count(Attrition) AS Attrition_count ,
Round((count(Attrition)/ (select count(Attrition) from hr_data where attrition= 'Yes'))*100,2) AS Attrition_PCT
From hr_data
where Attrition = 'Yes'
group by `CF_age band`, Gender
order by `CF_age band`, Gender;

-- 8. Job Satisfaction Level Rating  
select * from hr_data;
with cte1 as ( select `Job Role`, `Job Satisfaction`, sum(`Employee count`) as emp_cnt
From hr_data
Group by `Job Role`, `Job Satisfaction`
Order by `Job Role`, `Job Satisfaction`)
select `Job Role`,
SUM(CASE WHEN `Job Satisfaction` = 1 Then (emp_cnt) else 0 END ) as 'One',
SUM(CASE WHEN `Job Satisfaction` = 2 Then (emp_cnt) else 0 END ) as 'Two',
SUM(CASE WHEN `Job Satisfaction` = 3 Then (emp_cnt) else 0 END ) as 'Three',
SUM(CASE WHEN `Job Satisfaction` = 4 Then (emp_cnt) else 0 END ) as 'Four'
from cte1
Group by `Job Role`
Order by `Job Role`;

-- 9. No of Employes by different age groups and gender
select `CF_age band`,gender, sum(`Employee Count`) from hr_data
where department = 'R&D'
group by `CF_age band`,gender
order by `CF_age band`, gender;