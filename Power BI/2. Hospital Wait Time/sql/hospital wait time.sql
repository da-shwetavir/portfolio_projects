-- Check data records
select count(*) from hsp_wait_time;

-- cleaning data
select `data year` from hsp_wait_time
where `data year` = '2019FY';
-- Replace 2019FY to 2019 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2019'
where `data year` = '2019FY';

-- 2. 2019Q3Q4
select `data year` from hsp_wait_time
where `data year` = '2019Q3Q4';
-- Replace 2019Q3Q4 to 2019 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2019'
where `data year` = '2019Q3Q4';

-- 3. 2020FY
select `data year` from hsp_wait_time
where `data year` = '2020FY';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2020'
where `data year` = '2020FY';

-- 4. 2020Q3Q4
select `data year` from hsp_wait_time
where `data year` = '2020Q3Q4';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2020'
where `data year` = '2020Q3Q4';

-- 5. 2021FY
select `data year` from hsp_wait_time
where `data year` = '2021FY';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2021'
where `data year` = '2021FY';

-- 5. 2021Q3Q4
select `data year` from hsp_wait_time
where `data year` = '2021Q3Q4';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2021'
where `data year` = '2021Q3Q4';

-- 6. 2022FY
select `data year` from hsp_wait_time
where `data year` = '2022FY';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2022'
where `data year` = '2022FY';

-- 6. 2022Q3Q4
select `data year` from hsp_wait_time
where `data year` = '2022Q3Q4';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2022'
where `data year` = '2022Q3Q4';


-- 6. 2023FY
select `data year` from hsp_wait_time
where `data year` = '2023FY';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2023'
where `data year` = '2023FY';

-- 6. 2023Q3Q4
select `data year` from hsp_wait_time
where `data year` = '2023Q3Q4';
-- Replace 2020FY to 2020 in column data year
SET SQL_SAFE_UPDATES = 0;
update hsp_wait_time
set `data year` = '2023'
where `data year` = '2023Q3Q4';

-- modify data year column 
select `Data year` from hsp_wait_time;
update hsp_wait_time
set `Data year`= CONCAT(`Data year`, '-01-01');

-- Removing NUll or blank values
select * from hsp_wait_time
where province is null or province ='';

SET SQL_SAFE_UPDATES = 0;
delete from hsp_wait_time
where province is null or province ='';

-- KPI
-- check reporting level
select distinct `ï»¿Reporting level`
from hsp_wait_time
where `ï»¿Reporting level`='National';

-- Count national
select count(Distinct province) from hsp_wait_time
where Province = 'Canada';

-- count province
select count(Distinct province) from hsp_wait_time
where Province <> 'Canada';

-- count procedures
select count(Distinct Indicator) from hsp_wait_time;

-- Calculate Median Values based on each province, each prodedure, unit of measurement(days)
-- 50th Percentile
-- 1. Province - Alberta, Procudure - Breast Cancer Surgery
with cte1 as(        SELECT
        `Indicator result`,
        ROW_NUMBER() OVER (ORDER BY `Indicator result`) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Alberta' and Indicator='Bladder Cancer Surgery' and `Unit of measurement`='Days'
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        )
        SELECT
    AVG(`Indicator result`) AS median_value
FROM
    cte1
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));


