-- 1. AVG rating by position

SELECT position, AVG(overall_rating) AS avg_position_rating
FROM player_info
GROUP BY position
ORDER BY avg_position_rating DESC;


-- 2. MAX rating at each position

SELECT pi.position, pi.name, pi.overall_rating AS max_position_rating
FROM player_info pi
INNER JOIN (
    SELECT position, MAX(overall_rating) AS max_rating
    FROM player_info
    GROUP BY position
) sub
ON pi.position = sub.position
AND pi.overall_rating = sub.max_rating
ORDER BY max_position_rating DESC;


--3.Avg players rating by age

SELECT 
    CASE 
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        ELSE '40 and above'
    END AS age_group,
    AVG(overall_rating) AS avg_rating
FROM player_info
GROUP BY age_group
ORDER BY age_group;


-- 4. Top 10 performers by skill(Dribbling) 
SELECT 
    pi.id,
    pi.name,
    pi.position,
    ad.dribbling
FROM 
    player_info pi
INNER JOIN 
    attackers_data ad
ON 
    pi.id = ad.id
ORDER BY 
    ad.dribbling DESC
LIMIT 10;


-- 5. AVG wage by position

SELECT position, ROUND (AVG(wage_euro)::numeric, 2) AS avg_position_wage
FROM player_info
GROUP BY position
ORDER BY avg_position_wage DESC;


-- 6. AVG value by position

SELECT position, ROUND (AVG(value_euro)::numeric, 2) AS avg_position_value
FROM player_info
GROUP BY position
ORDER BY avg_position_value DESC;


-- 7. AVG wage by overall_rating

SELECT overall_rating, ROUND (AVG(wage_euro)::numeric, 2) AS avg_rating_wage
FROM player_info
GROUP BY overall_rating
ORDER BY avg_rating_wage DESC;


-- 8. AVG value by overall_rating

SELECT overall_rating, ROUND (AVG(value_euro)::numeric, 2) AS avg_rating_value
FROM player_info
GROUP BY overall_rating
ORDER BY avg_rating_value DESC;


-- 9. MAX wage at each position

SELECT
    position,
    name,
    wage_euro AS max_position_wage
FROM
    player_info
WHERE
    (position, wage_euro) IN (
        SELECT
            position,
            MAX(wage_euro)
        FROM
            player_info
        GROUP BY
            position
    )
ORDER BY
    max_position_wage DESC;


-- 10. MAX value at each position

SELECT pi.position, pi.name, pi.value_euro AS max_position_value
FROM player_info pi
INNER JOIN (
    SELECT position, MAX(value_euro) AS max_value
    FROM player_info
    GROUP BY position
) sub
ON pi.position = sub.position
AND pi.value_euro = sub.max_value
ORDER BY max_position_value DESC;

--11. Underperforming players
WITH ranked_players 
AS ( SELECT name, position, overall_rating, wage_euro, value_euro, 
ROW_NUMBER() OVER (PARTITION BY position ORDER BY overall_rating ASC, wage_euro DESC) 
AS rank FROM player_info
WHERE wage_euro IS NOT NULL ) 
SELECT name, position, overall_rating, wage_euro, value_euro 
FROM ranked_players 
WHERE rank <= 10 
ORDER BY position, rank
LIMIT 15;

--12. Overratted players

SELECT name, overall_rating, wage_euro, value_euro 
FROM player_info 
WHERE wage_euro IS NOT NULL 
AND value_euro IS NOT NULL
ORDER BY overall_rating ASC, value_euro DESC
LIMIT 10;


SELECT name, age, overall_rating, potential, wage_euro, value_euro, (value_euro / wage_euro)/1000 AS value_to_wage_ratio 
FROM player_info 
WHERE wage_euro IS NOT NULL 
AND value_euro IS NOT NULL
ORDER BY value_to_wage_ratio DESC LIMIT 10;






