## 3. Your First Query ##

SELECT *
  FROM recent_grads;

## 4. Understanding your First Query ##

SELECT * 
  FROM recent_grads;
  
SELECT * 
FROM recent_grads;
  

## 6. The LIMIT Clause ##

SELECT *
  FROM recent_grads
 LIMIT 5;

## 7. Selecting Specific Columns ##

SELECT Major, ShareWomen  
  FROM recent_grads;

## 8. Filtering Rows Using WHERE ##

SELECT Major, ShareWomen  
  FROM recent_grads
 WHERE ShareWomen <= 0.5;

## 9. Expressing Multiple Filter Criteria Using 'AND' ##

SELECT Major, Major_category, Median, ShareWomen 
  FROM recent_grads
 WHERE Median > 50000
   AND ShareWomen > 0.5;

## 10. Returning One of Several Conditions With OR ##

SELECT major, median, Unemployed 
  FROM recent_grads
 WHERE median >= 10000 
    OR ShareWomen < 0.5
    limit 20;

## 11. Grouping Operators With Parentheses ##

SELECT Major, Major_category, ShareWomen, Unemployment_rate
  FROM recent_grads
 WHERE (Major_category = 'Engineering') 
   AND (ShareWomen > 0.5 OR Unemployment_rate < 0.051);

## 12. Ordering Results Using ORDER BY ##

SELECT Major, ShareWomen, Unemployment_rate
    FROM recent_grads
   WHERE ShareWomen > 0.3 and Unemployment_rate < 0.1
   ORDER BY ShareWomen DESC;

## 13. Practice Writing a Query ##

SELECT Major_category, Major, Unemployment_rate
  FROM recent_grads
 WHERE Major_category = 'Engineering' 
      or Major_category = 'Physical Sciences'
 order by Unemployment_rate ASC;