-- Calculate Median Values based on each province, each prodedure, unit of measurement(days)
-- 50th Percentile
-- 1. Province - Newfoundland and Labrador, Procudure - Bladder Cancer Surgery
with cte1 as(        SELECT
         cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Bladder Cancer Surgery' and `Unit of measurement`IN ('Days', 'Hours')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    cte1
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 2. Province -Newfoundland and Labrador , Procudure - Breast Cancer Surgery
with cte1 as(        SELECT
        cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Breast Cancer Surgery' and `Unit of measurement`='Days'
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    cte1
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));



-- 3. Province - Newfoundland and Labrador, Procudure - CABG
with rnk as(        SELECT
        cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='CABG' and `Unit of measurement`IN ('Days', 'Hours')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));


-- 4. Province - Newfoundland and Labrador, Procudure - Cataract Surgery
with rnk as(        SELECT
        cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Cataract Surgery' and `Unit of measurement`IN ('Days', 'Hours')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));



-- 5. Province - Newfoundland and Labrador, Procudure - Colorectal Cancer Surgery
with rnk as(        SELECT
         cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Colorectal Cancer Surgery' and `Unit of measurement`='Days'
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));



-- 6. Province - Newfoundland and Labrador, Procudure - CT Scan
with rnk as(        SELECT
         cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='CT Scan' and `Unit of measurement`='Days'
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 7. Province - Newfoundland and Labrador, Procudure - Hip Fracture Repair
with rnk as(        SELECT
         cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Hip Fracture Repair' and `Unit of measurement`IN ('Days', 'Hours')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 8. Province - Newfoundland and Labrador, Procudure - Hip Fracture Repair/Emergency and Inpatient
with rnk as(        SELECT
        cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Hip Fracture Repair/Emergency and Inpatient' and `Unit of measurement`IN ('Days', 'Hours')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));


-- 9. Province - Newfoundland and Labrador, Procudure - Hip Replacement
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Hip Replacement' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 10. Province - Newfoundland and Labrador, Procudure -Knee Replacement
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Knee Replacement' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 11. Province -Newfoundland and Labrador, Procudure -Lung Cancer Surgery
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Lung Cancer Surgery' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 12. Province -Newfoundland and Labrador, Procudure -MRI Scan
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='MRI Scan' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 13. Province - Newfoundland and Labrador, Procudure -Prostate Cancer Surgery
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Prostate Cancer Surgery' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 14. Province - Newfoundland and Labrador, Procudure -Prostate Cancer Surgery
with rnk as(        SELECT
       cast( `Indicator result` as unsigned) as procedures,
        ROW_NUMBER() OVER (ORDER BY  cast( `Indicator result` as unsigned)) AS row_num,
        COUNT(*) OVER () AS total_count
        FROM
        hsp_wait_time
        where Province = 'Newfoundland and Labrador' and Indicator='Radiation Therapy' and `Unit of measurement`IN ('Days')
        and `Indicator result`<> 'n/a' and metric ='50th Percentile'
        order by procedures asc
        )
        SELECT
    AVG(procedures) AS median_value
FROM
    rnk
WHERE
    row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));
