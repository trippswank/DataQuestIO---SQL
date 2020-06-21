## 1. Introducing Joins ##

SELECT * 
FROM facts
INNER JOIN cities ON 
cities.facts_id = facts.id
LIMIT 10;

## 2. Understanding Inner Joins ##

SELECT c.*, f.name as country_name 
FROM facts AS f
INNER JOIN cities AS c ON c.facts_id = f.id
limit 5;

## 3. Practicing Inner Joins ##

SELECT f.name country, c.name capital_city
FROM cities c
INNER JOIN facts f ON f.id = c.facts_id
WHERE c.capital = 1;

## 4. Left Joins ##

SELECT facts.name country, facts.population population
FROM facts
LEFT JOIN cities ON cities.facts_id = facts.id
WHERE cities.facts_id IS NULL;


## 6. Finding the Most Populous Capital Cities ##

SELECT cities.name capital_city, facts.name country, cities.population population
from cities
INNER JOIN facts ON cities.facts_id = facts.id
where cities.capital = 1
order by 3 DESC
limit 10;

## 7. Combining Joins with Subqueries ##

SELECT c.name capital_city, f.name country, c.population population
from facts f
INNER JOIN (
        SELECT * FROM cities
        WHERE capital = 1
        ) c ON c.facts_id = f.id
WHERE c.population > 10000000
order by c.population DESC
limit 10;





## 8. Challenge: Complex Query with Joins and Subqueries ##

SELECT
    f.name country,
    c.urban_pop,
    f.population total_pop,
    (c.urban_pop / CAST(f.population AS FLOAT)) urban_pct
FROM facts f
INNER JOIN (
            SELECT
                facts_id,
                SUM(population) urban_pop
            FROM cities
            GROUP BY 1
           ) c ON c.facts_id = f.id
WHERE urban_pct > .5
ORDER BY 4 ASC;