## 2. Joining Three Tables ##

SELECT t.track_id track_id, t.name track_name, mt.name track_type, il.unit_price, il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
WHERE invoice_id = 4;

## 3. Joining More Than Three Tables ##

SELECT
    il.track_id,
    t.name track_name,
    at.name artist_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
INNER JOIN album am ON am.album_id = t.album_id
INNER JOIN artist at ON at.artist_id = am.artist_id
WHERE il.invoice_id = 4;

## 4. Combining Multiple Joins with Subqueries ##

SELECT
    ta.album,
    ta.artist_name artist,
    COUNT(*) tracks_purchased
FROM invoice_line il
INNER JOIN (
            SELECT
                t.track_id,
                ar.name artist_name,
                al.title album
            FROM track t
            INNER JOIN album al ON al.album_id = t.album_id
            INNER JOIN artist ar ON ar.artist_id = al.artist_id
           ) ta
           ON ta.track_id = il.track_id
GROUP BY 1, 2
ORDER BY 3 DESC LIMIT 5;


## 5. Recursive Joins ##


select 
        e1.first_name || " " ||  e1.last_name as employee_name,
        e1.title employee_title,
        e2.first_name || " " ||  e2.last_name as supervisor_name,
        e2.title as supervisor_title 
FROM employee e1
LEFT JOIN employee e2 on e1.reports_to = e2.employee_id
order by 1;



## 6. Pattern Matching Using Like ##

SELECT
    first_name,
    last_name,
    phone
FROM customer
WHERE first_name LIKE "%Belle%";

## 7. Generating Columns With The Case Statement ##

SELECT
    c.first_name || ' ' || c.last_name as customer_name,
    COUNT(i.invoice_id) number_of_purchases,
    SUM(i.total) as total_spent,
    CASE
        WHEN SUM(i.total) < 40 THEN 'small spender'
        WHEN SUM(i.total) > 100 THEN 'big spender'
        ELSE 'regular' 
        END
        AS customer_category
FROM customer c
inner join invoice i
on i.customer_id = c.customer_id
group by 1
order by 1; 
