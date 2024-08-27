

--1. AVG 

-- a. AVG wage by position
SELECT position, ROUND (AVG(wage_euro)::numeric, 2) AS avg_position_wage
FROM player_info
GROUP BY position
ORDER BY avg_position_wage DESC;

-- b. AVG value by position
SELECT position, ROUND (AVG(value_euro)::numeric, 2) AS avg_position_value
FROM player_info
GROUP BY position
ORDER BY avg_position_value DESC;

-- c. AVG rating by position
SELECT position, ROUND(AVG(overall_rating)::numeric, 2) AS avg_position_rating
FROM player_info
GROUP BY position
ORDER BY avg_position_rating DESC;


--2. Impact of Age on Wage/Value

--a.Wage
SELECT age,
	ROUND (AVG(wage_euro)::numeric, 2) AS avg_wage
FROM player_info
GROUP BY age
ORDER BY avg_wage DESC;


--b.Value
SELECT age,
	ROUND (AVG(value_euro)::numeric, 2) AS avg_value
FROM player_info
GROUP BY age
ORDER BY avg_value DESC;

--3. Top Players by Improvement Potential 

--a.Players with High Improvement Potential

SELECT name, position, overall_rating, potential,
    (potential - overall_rating) AS improvement_potential
FROM player_info
ORDER BY improvement_potential DESC
LIMIT 10;

--b.Young Players with High Potential

SELECT name, position, overall_rating, potential, age,
    (potential - overall_rating) AS improvement_potential
FROM player_info
WHERE age < 25
ORDER BY improvement_potential DESC
LIMIT 10;


-- 4. Most value for money players

-- a. Most value for money attacking players
WITH AttackingAbility AS (
    SELECT pi.id,
           (ad.finishing + ad.volleys +
            ad.heading_accuracy + ad.dribbling + ad.curve +
            ad.shot_power + ad.long_shots) / 7.0 AS attacking_ability
    FROM attackers_data AS ad
    INNER JOIN player_info AS pi
    ON ad.id = pi.id
)

SELECT pi.name, 
       pi.position, 
       pi.wage_euro, 
       pi.value_euro,
       ROUND(aa.attacking_ability, 0) AS attacking_ability,  
       ROUND((pi.value_euro / aa.attacking_ability)::numeric, 2) AS value_ratio
FROM player_info AS pi
INNER JOIN AttackingAbility AS aa
ON pi.id = aa.id
ORDER BY value_ratio ASC
LIMIT 10;


-- b. Most value for money defensive players
WITH DefensiveAbility AS (
    SELECT pi.id,
           (dd.aggression + dd.interceptions + 
            dd.positioning + dd.marking + dd.standing_tackle +
            dd.sliding_tackle) / 6.0 AS defensive_ability
    FROM defensive_data AS dd
    INNER JOIN player_info AS pi
    ON dd.id = pi.id
)

SELECT pi.name, 
       pi.position, 
       pi.wage_euro, 
       pi.value_euro,
       ROUND(da.defensive_ability, 0) as defensive_ability,
	ROUND((pi.value_euro / da.defensive_ability)::numeric, 2) AS value_ratio
FROM player_info AS pi
INNER JOIN DefensiveAbility AS da
ON pi.id = da.id
ORDER BY value_ratio ASC
LIMIT 10;






--5.DreamXI 4-3-3

WITH categorized_players AS (
    SELECT
        name,
        position,
        overall_rating,
        CASE
            WHEN position IN ('CB') THEN 'CB'
			WHEN position IN ('LB', 'LWB') THEN 'LB'
			WHEN position IN ('RB', 'RWB') THEN 'RB'
            WHEN position IN ('CM', 'CDM') THEN 'CM'
			WHEN position IN ('LM') THEN 'LM'
			WHEN position IN ('RM') THEN 'RM'
            WHEN position IN ('LW') THEN 'LW'
			WHEN position IN ('RW') THEN 'RW'
			WHEN position IN ('ST', 'CF') THEN 'ST'
			WHEN position IN ('GK') THEN 'GK'
            ELSE 'Other'
        END AS player_role
    FROM player_info
),
ranked_players AS (
    SELECT
        name,
        position,
        overall_rating,
        player_role,
        ROW_NUMBER() OVER (PARTITION BY player_role ORDER BY overall_rating DESC) AS rank
    FROM categorized_players
    WHERE player_role IN ('GK', 'RB', 'CB', 'LB', 'RM', 'CM', 'LM', 'RW', 'LW', 'ST')
)
-- Select the top  Defenders,  Midfielders, and Attackers
SELECT
    name,
    position,
    overall_rating,
    player_role
FROM ranked_players
WHERE
    (player_role = 'GK' AND rank <= 1) OR
    (player_role = 'RB' AND rank <= 1) OR
	(player_role = 'CB' AND rank <= 2) OR 
	(player_role = 'LB' AND rank <= 1) OR
	(player_role = 'RM' AND rank <= 1) OR
	(player_role = 'CM' AND rank <= 1) OR
	(player_role = 'LM' AND rank <= 1) OR
	(player_role = 'RW' AND rank <= 1) OR
	(player_role = 'ST' AND rank <= 1) OR
	(player_role = 'LW' AND rank <= 1);
