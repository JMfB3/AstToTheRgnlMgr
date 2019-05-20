-- CREATE DATES TABLE 
CREATE TABLE date_loop (
    date_value DATE COMMENT 'date'
  , day_of_week VARCHAR(9) COMMENT 'Monday - Sunday'
  , day_of_wk VARCHAR(3) COMMENT 'Mon - Sun'
  , day_num_week INTEGER COMMENT 'Ex: Mon = 1, tue = 2, etc'
  , day_of_month INTEGER COMMENT 'Ex: Aug 12, 1990 = 12'
  , day_of_year INTEGER COMMENT 'Ex: Jan 1, 2020 = 1 || Dec 31, 2018 = 365(4)'
  , week_num_of_year INTEGER COMMENT 'Ex: Jan 1, 2020 = 1 || Dec 31,2018 = 52'
  , week_date_of_year DATE COMMENT 'Ex: Aug 12, 1990 = 08/06/1990 (Mon of that week)'
  , month_name VARCHAR(9) COMMENT 'Ex: Aug 12, 1990 = August'
  , mmm VARCHAR(3) COMMENT 'Ex: Aug 12, 1990 = Aug'
  , month_num INTEGER COMMENT 'Ex: Aug 12, 1990 = 08'
  , first_of_month DATE COMMENT 'Ex: Aug 12, 1990 = 08/01/1990'
  , yy INTEGER COMMENT 'Ex: Aug 12, 1990 = 90'
  , yyyy INTEGER COMMENT 'Ex: Aug 12, 1990 = 1990'
  , next_month DATE COMMENT 'Ex: Aug 12, 1990 = 09/01/1990'
);


-- Insert dates
INSERT INTO date_loop (
date_value
)

-- get 10 numbers
WITH nums AS (
SELECT 1 AS num UNION
SELECT 2 AS num UNION
SELECT 3 AS num UNION
SELECT 4 AS num UNION
SELECT 5 AS num UNION
SELECT 6 AS num UNION
SELECT 7 AS num UNION
SELECT 8 AS num UNION
SELECT 9 AS num UNION
SELECT 10 AS num 
),
-- square it
h_nums AS (
SELECT 
    ROW_NUMBER() OVER(ORDER BY nums.num ) AS num
FROM nums
CROSS JOIN nums AS more_nums
ORDER BY num
),
-- square it again to get lots of numbers 
k_nums AS (
SELECT 
    ROW_NUMBER() OVER(ORDER BY h_nums.num ) AS num
FROM h_nums
CROSS JOIN h_nums AS more_nums
ORDER BY num
)

-- INSERT past/present (comment out select option and limit. These numbers are based on 5/16/19 math. You'll need to update.)
SELECT 
      -- CURRENT_DATE() + NUM AS date_value
      CURRENT_DATE() - NUM AS date_value -- Switch to this, and change 4247 to 7075 for past
      -- , NUM
FROM k_nums 
-- LIMIT 4247
LIMIT 7075
;

-- Insert current date (left out of prior queries)
INSERT INTO date_loop (date_value)
SELECT CURRENT_DATE()
;

-- Order it
INSERT OVERWRITE INTO date_loop 
SELECT * FROM date_loop ORDER BY date_value;
