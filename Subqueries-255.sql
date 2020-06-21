## 1. Writing More Complex Queries ##

SELECT Major, ShareWomen
from recent_grads
where ShareWomen >
(SELECT AVG(ShareWomen)
  FROM recent_grads);

## 2. Subqueries ##

SELECT Major, Unemployment_rate
from recent_grads
where Unemployment_rate <
(SELECT AVG(Unemployment_rate)
  FROM recent_grads);

## 3. Subquery in SELECT ##

SELECT CAST(COUNT(*) as float)/ (select CAST(COUNT(*) AS FLOAT) FROM recent_grads) as proportion_abv_avg
from recent_grads
where ShareWomen >
(SELECT AVG(ShareWomen)
  FROM recent_grads);
  


## 4. The IN Operator ##

select Major_category, Major
FROM recent_grads
where Major_category IN ('Business','Humanities & Liberal Arts','Education');

## 5. Returning Multiple Results in Subqueries ##

SELECT Major_category, Major
  FROM recent_grads
 WHERE Major_category IN (SELECT Major_category
  FROM recent_grads
 GROUP BY Major_category
 ORDER BY SUM(TOTAL) DESC
 limit 3);


## 6. Building Complex Subqueries ##

SELECT  AVG(CAST(Sample_size AS FLOAT)/Total) as avg_ratio
from recent_grads;

## 7. Practice Integrating A Subquery With The Outer Query ##

SELECT Major, Major_category, CAST(Sample_size AS FLOAT)/Total as ratio
from recent_grads
where ratio >
(SELECT AVG(CAST(Sample_size AS FLOAT)/Total) as avg_ratio
from recent_grads);