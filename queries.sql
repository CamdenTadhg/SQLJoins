-- write your queries here
--Join the two tables so that every column and record appears, regardless of if there is not an owner_id
SELECT * FROM owners
FULL JOIN vehicles
ON owners.id =  vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name, last_name, and count of vehicles

SELECT first_name, last_name, count(*) FROM vehicles
JOIN owners
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers
SELECT first_name, last_name, cast(avg(price) AS int) AS average_price, count(*) AS count
FROM vehicles
JOIN owners
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
HAVING count(*) > 1 AND avg(price) > 10000
ORDER BY first_name desc;