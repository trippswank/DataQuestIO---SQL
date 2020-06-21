## 2. If/Then in SQL ##

SELECT 
       CASE
       WHEN Sample_size < 200 THEN 'Small'
       WHEN Sample_size >= 200 and Sample_size < 1000 THEN 'Medium'
       WHEN Sample_size >= 1000 THEN 'Large'
       ELSE NULL
       END AS Sample_category
  FROM recent_grads;


## 3. Dissecting CASE ##

SELECT 
       Major,
       Sample_size,
       CASE
       WHEN Sample_size < 200 THEN 'Small'
       WHEN Sample_size >= 200 and Sample_size < 1000 THEN 'Medium'
       WHEN Sample_size >= 1000 THEN 'Large'
       ELSE NULL
       END AS Sample_category
  FROM recent_grads;


## 4. Calculating Group-Level Summary Statistics ##

SELECT 
      Major_category,
      SUM(Total) Total_graduates
FROM recent_grads
GROUP by Major_category;


## 5. GROUP BY Visual Breakdown ##

select Major_category, AVG(ShareWomen) Average_women
from recent_grads
group by 1;

## 6. Multiple Summary Statistics by Group ##

select Major_category, SUM(Women) Total_women, avg(ShareWomen) Mean_women, SUM(Total)*AVG(ShareWomen) as Estimate_women
from recent_grads
group by 1;


## 7. Multiple Group Columns ##

SELECT Major_category, Sample_category,
       AVG(ShareWomen) Mean_women, SUM(Total) Total_graduates
  FROM new_grads
 GROUP BY Major_category, Sample_category;
 


## 8. Querying Virtual Columns With the HAVING Statement ##

SELECT Major_category, AVG(Low_wage_jobs) / AVG(Total) as Share_low_wage
  FROM new_grads
 GROUP BY Major_category
HAVING Share_low_wage > 0.1;


## 10. Rounding Results With the ROUND() Function ##

SELECT 
       ROUND(ShareWomen, 4) AS Rounded_women,
       Major_category
  FROM new_grads
  limit 10;

## 11. Nesting functions ##

SELECT Major_category,
      ROUND(AVG(College_jobs) / AVG(Total), 3) as Share_degree_jobs
  FROM new_grads
 GROUP BY Major_category
HAVING Share_degree_jobs < 0.3;

## 12. Casting ##

SELECT Major_category, CAST(SUM(Women) as Float) / CAST(SUM(Total) as Float) as SW
FROM new_grads 
GROUP BY Major_category
ORDER by SW;