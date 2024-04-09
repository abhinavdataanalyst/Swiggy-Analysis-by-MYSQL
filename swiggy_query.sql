The analysis done by me by using mysql is here.

SELECT *
FROM swiggy;

-- HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
SELECT
COUNT(distinct restaurant_name) as high_rated_resauarant
FROM swiggy
WHERE rating > 4.5;

-- WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
SELECT city,
COUNT(restaurant_name) as restaurant_count
FROM swiggy
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 1;

-- HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

SELECT 
count(distinct restaurant_name) as restaurant_number
FROM swiggy
WHERE restaurant_name LIKE '%Pizza%';

-- WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?

SELECT cuisine,
COUNT(*) as cuisine_count
FROM swiggy
GROUP BY cuisine
ORDER BY cuisine_count desc
LIMIT 1;

-- WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
SELECT city,
AVG(rating) as avg_rating
FROM swiggy
GROUP BY city
order by avg_rating DESC;



-- FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN indian cuisine.

SELECT restaurant_name,cost_per_person
FROM swiggy
WHERE cuisine <> 'indian'
ORDER by restaurant_name DESC
LIMIT 5;

-- FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.

SELECT distinct restaurant_name,cost_per_person
FROM swiggy 
WHERE cost_per_person > (SELECT avg(cost_per_person) FROM swiggy);

-- WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?

SELECT restaurant_name,menu_category,
COUNT(item) as no_of_item
FROM swiggy
WHERE menu_category = 'main course'
GROUP BY restaurant_name,menu_category
order by no_of_item DESC;

SELECT distinct restaurant_name,veg_or_nonveg
from swiggy
WHERE restaurant_name = 'veg'
order by restaurant_name ASC;

-- WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?

SELECT restaurant_name,
AVG(price) as avg_price
FROM swiggy
GROUP BY restaurant_name
ORDER BY avg_price
LIMIT 1;

-- WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

SELECT distinct restaurant_name,
COUNT(distinct menu_category) as category
FROM swiggy
GROUP BY restaurant_name
ORDER BY category DESC
LIMIT 5;

-- WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?

SELECT distinct restaurant_name,menu_category,
MAX(price) as highestprice
FROM swiggy
WHERE menu_category = 'Recommened'
GROUP BY restaurant_name,menu_category;



