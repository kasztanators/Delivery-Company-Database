--1 GIVE NUMBER OF PACKAGES SENDED BY EVERY USER

SELECT name,surname, COUNT(Packages.packageID) AS 'Number of packages'
	FROM Users, Packages, Orders
	WHERE Packages.orderREF = orderID AND
	Orders.userREF = Users.userID
	GROUP BY Users.name,surname
	ORDER BY name


--2Find the average weight of packages sent to a specific city:
SELECT AVG(weight) AS 'average package weight in Torun', COUNT(PackageID) AS 'No of packages to city'
FROM Packages
JOIN Addresses ON Packages.addressREF = Addresses.addressID
WHERE Addresses.city = 'Torun'

--- 3Find all of the tracking information for packages sent to a specific receiver 
SELECT Tracking_info.trackerID, Tracking_info.message_CHAR, name
	FROM Tracking_info

	JOIN Packages ON Tracking_info.packageREF = Packages.packageID
	JOIN Receivers ON Packages.receiverREF = Receivers.receiverID
	WHERE Packages.weight < (SELECT AVG(Packages.weight)FROM Packages)
	ORDER BY Tracking_info.trackerID DESC
	

--4Find all the delivery men that has delivered packages to a specific city
SELECT deliverymanID, phone_num, city, capacity
FROM Deliverymen
JOIN Transports ON Transports.deliverymanREF = Deliverymen.deliverymanID
JOIN Delivery_units ON Delivery_units.unitID = Transports.toUnitREF
JOIN Addresses ON Delivery_units.addresREF = Addresses.addressID
WHERE Addresses.region = 'Kujawsko-Pomorskie' AND Transports.status = 'picked' 
AND Transports.x_coor < (SELECT AVG(Transports.x_coor) FROM Transports)
AND Transports.y_coor < (SELECT AVG(Transports.y_coor) FROM Transports )

--5Find the most common delivery unit that was used for a package delivery:
		SELECT Delivery_units.unitID, COUNT(Delivery_units.unitID) AS 'frequency'
		FROM Delivery_units
		JOIN Transports ON Transports.fromUnitREF = Delivery_units.unitID 
		GROUP BY Delivery_units.unitID
		ORDER BY COUNT(Delivery_units.unitID) DESC

---6 package info crate view
drop VIEW Package_info

CREATE VIEW Package_info AS
SELECT Packages.packageID, Packages.size_X, Packages.size_Y, Packages.size_Z, Packages.weight, Orders.date_of_check_in, Users.user_name
FROM Packages
JOIN Orders ON Orders.orderID = Packages.orderREF
JOIN Users ON Users.userID = Orders.userREF;


SELECT * FROM Package_info
WHERE weight > 20	
ORDER BY Package_info.date_of_check_in DESC

-- 7crating view of transport destination where destination delivery unit is he lowest
DROP VIEW Transport_destination

CREATE VIEW Transport_destination AS
SELECT Transports.transportID, fromAddress.city AS 'from City', toAddress.city AS 'to City', toUnit.capacity AS 'capacity'
FROM Transports
	JOIN Delivery_units fromUnits ON Transports.fromUnitREF = fromUnits.unitID
	JOIN Addresses fromAddress ON fromUnits.addresREF = fromAddress.addressID
	JOIN Delivery_units toUnit ON Transports.toUnitREF = toUnit.unitID
	JOIN Addresses toAddress ON toUnit.addresREF = toAddress.addressID
	WHERE toUnit.capacity = (SELECT MIN(Delivery_units.capacity)FROM Delivery_units
		JOIN Transshipments ON Transshipments.unitREF = Delivery_units.unitID
		WHERE Transshipments.date > '2021-12-21 09:28:32')


SELECT * FROM Transport_destination



--8subqueries
SELECT DISTINCT user_name ,
(SELECT COUNT(packageID) FROM Packages WHERE Packages.orderREF = Orders.orderID) AS 'Number of Packages'
FROM Users
JOIN Orders ON Users.userID = Orders.userREF

SELECT  DISTINCT user_name, COUNT(packageID)AS 'Number of Packages'
    FROM Users , Packages,Orders 
    WHERE Packages.orderREF = Orders.orderID
    AND  Orders.userREF = Users.userID
    GROUP BY user_name
--9 2nd subquery date
SELECT * FROM Users 
WHERE userID IN (SELECT userREF FROM Orders WHERE date_of_check_in >= '2020-01-01')