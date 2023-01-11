-- GIVE NUMBER OF PACKAGES SENDED BY EVERY USER

SELECT name,surname, COUNT(Packages.packageID) AS 'Number of packages'
	FROM Users, Packages, Orders
	WHERE Packages.orderREF = orderID AND
	Orders.userREF = Users.userID
	GROUP BY Users.name,surname
	ORDER BY name


--Find the average weight of packages sent to a specific city:
SELECT AVG(weight) AS 'average package weight in Gdansk', COUNT(PackageID) AS 'No of packages to city'
FROM Packages
JOIN Addresses ON Packages.addressREF = Addresses.addressID
WHERE Addresses.city = 'Torun'

--- Find all of the tracking information for packages sent to a specific receiver
SELECT Tracking_info.trackerID, Tracking_info.message_CHAR, name
FROM Tracking_info
JOIN Packages ON Tracking_info.packageREF = Packages.packageID
JOIN Receivers ON Packages.receiverREF = Receivers.receiverID

--Find all the delivery men that has delivered packages to a specific city
SELECT deliverymanID, phone_num
FROM Deliverymen
JOIN Transports ON Transports.deliverymanREF = Deliverymen.deliverymanID
JOIN Delivery_units ON Delivery_units.unitID = Transports.toUnitREF
JOIN Addresses ON Delivery_units.addresREF = Addresses.addressID
WHERE Addresses.city = 'Torun'

--Find the most common delivery unit that was used for a package delivery:
SELECT Delivery_units.unitID, COUNT(Delivery_units.unitID) AS 'frequency'
FROM Delivery_units
JOIN Transports ON Transports.fromUnitREF = Delivery_units.unitID 
GROUP BY Delivery_units.unitID
ORDER BY COUNT(Delivery_units.unitID) DESC

--- package info crate view
drop VIEW Package_info
CREATE VIEW Package_info AS
SELECT Packages.packageID, Packages.size_X, Packages.size_Y, Packages.size_Z, Packages.weight, Orders.date_of_check_in, Users.user_name
FROM Packages
LEFT JOIN Orders ON Orders.orderID = Packages.orderREF
LEFT JOIN Users ON Users.userID = Orders.userREF;


SELECT * FROM Package_info
WHERE weight > 20
ORDER BY Package_info.date_of_check_in DESC

-- crating view of


--subqueries
SELECT user_name,
(SELECT COUNT(packageID) FROM Packages WHERE Packages.orderREF = Orders.orderID) AS 'Number of Packages'
FROM Users
JOIN Orders ON Users.userID = Orders.userREF

-- 2nd suquery date
SELECT * FROM Users 
WHERE userID IN (SELECT userREF FROM Orders WHERE date_of_check_in >= '2020-01-01')