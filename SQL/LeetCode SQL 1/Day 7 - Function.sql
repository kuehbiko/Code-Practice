-- 1141. User Activity for the Past 30 Days I
-- Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
-- A user was active on someday if they made at least one activity on that day.
-- Return the result table in any order.

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE (activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27')
AND session_id IS NOT NULL
GROUP BY activity_date;


-- 1693. Daily Leads and Partners
-- Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.
-- Return the result table in any order.

SELECT date_id, make_name, 
COUNT(DISTINCT lead_id) AS unique_leads, 
COUNT(DISTINCT partner_id) AS unique_partners
FROM dailysales
GROUP BY date_id, make_name;


-- 1729. Find Followers Count
-- Write an SQL query that will, for each user, return the number of followers.
-- Return the result table ordered by user_id.

SELECT user_id, COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
