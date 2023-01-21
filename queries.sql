--1 GIVE NUMBER OF FRAGILE PACKAGES SENDED BY EVERY USER 

SELECT name,
       surname,
       COUNT(Packages.packageID) AS 'Number of packages'
FROM Users,
     Packages,
     Orders
WHERE Packages.orderREF = orderID
  AND Orders.userREF = Users.userID
  AND Packages.is_fragile =1
GROUP BY Users.name,
         surname
ORDER BY name

--2Find the average weight of packages sent to a specific city sended in 2020:
SELECT AVG(weight) AS 'average package weight',
       COUNT(PackageID) AS 'No of packages to city',
       city
FROM Packages
JOIN Addresses ON Packages.addressREF = Addresses.addressID
JOIN Orders ON Packages.orderREF = Orders.orderID
WHERE Orders.date_of_check_in > '2020-01-01 00:00:00'
AND Orders.date_of_check_in < '2021-01-01 00:00:00'
GROUP BY city

---3 retrieves messages info for packages where volume is below average
SELECT Tracking_info.trackerID, Tracking_info.message_CHAR, name, surname, email
	FROM Tracking_info
	JOIN Packages ON Tracking_info.packageREF = Packages.packageID
	JOIN Receivers ON Packages.receiverREF = Receivers.receiverID
	
	WHERE size_X*size_Y*size_Z < (SELECT AVG(size_X*size_Y*size_Z )FROM Packages)
	AND Receivers.email LIKE '%gmail.com'
	ORDER BY Tracking_info.trackerID
	

--4Find all the delivery men that has delivered packages to a specific region
SELECT deliverymanID, phone_num, city, capacity
FROM Deliverymen
JOIN Transports ON Transports.deliverymanREF = Deliverymen.deliverymanID
JOIN Delivery_units ON Delivery_units.unitID = Transports.toUnitREF
JOIN Addresses ON Delivery_units.addresREF = Addresses.addressID
WHERE Addresses.region = 'Kujawsko-Pomorskie' AND Transports.status = 'picked' 


--5Find the most commonly used delivery unit that was used for a package delivery:
SELECT Delivery_units.unitID,
       COUNT(Delivery_units.unitID) AS 'frequency',
       city
FROM Delivery_units
JOIN Transports ON Transports.fromUnitREF = Delivery_units.unitID
JOIN Addresses ON Addresses.addressID = Delivery_units.addresREF
GROUP BY Delivery_units.unitID,
         Addresses.city
HAVING COUNT(Delivery_units.unitID) >= 2
ORDER BY COUNT(Delivery_units.unitID) DESC

---6  crate view of number of packages by users where weight is greater than average

DROP VIEW Package_over_average

CREATE VIEW Package_over_average AS
SELECT Users.user_name,
       COUNT(Packages.packageID) AS 'number Packages over average'
FROM Packages
JOIN Orders ON Orders.orderID = Packages.orderREF
JOIN Users ON Users.userID = Orders.userREF
WHERE Packages.weight >
    (SELECT AVG(weight)FROM Packages)
GROUP BY(user_name)

SELECT *FROM Package_over_average
ORDER BY(user_name)
-- 7 transport destination where destination delivery unit capacity is the lowest
-- after 2021

DROP VIEW Transport_destination
CREATE VIEW Transport_destination AS
SELECT Transports.transportID,
       fromAddress.city AS 'from City',
       toAddress.city AS 'to City',
       toUnit.capacity AS 'capacity'
FROM Transports
JOIN Delivery_units fromUnits ON Transports.fromUnitREF = fromUnits.unitID
JOIN Addresses fromAddress ON fromUnits.addresREF = fromAddress.addressID
JOIN Delivery_units toUnit ON Transports.toUnitREF = toUnit.unitID
JOIN Addresses toAddress ON toUnit.addresREF = toAddress.addressID
WHERE toUnit.capacity =
    (SELECT MIN(Delivery_units.capacity)
     FROM Delivery_units
     JOIN Transshipments ON Transshipments.unitREF = Delivery_units.unitID
     WHERE Transshipments.date > '2021-01-01 00:00:00')


  SELECT * FROM Transport_destination 
  --8subqueries

  SELECT user_name,
         COUNT(packageID)AS 'Number of Packages'
  FROM Users,
       Packages,
       Orders WHERE Packages.orderREF = Orders.orderID
  AND Orders.userREF = Users.userID
GROUP BY user_name 
--9 2nd subquery date

SELECT *
FROM Users
WHERE userID IN
    (SELECT userREF
     FROM Orders
     WHERE date_of_check_in >= '2020-01-01')
	 
-- 10 number of deliverymen which can drive available vehicles

  SELECT COUNT(Deliverymen.deliverymanID) AS 'Number of available drivers'
  FROM Deliverymen
  JOIN Driverlogs ON Deliverymen.deliverymanID = Driverlogs.deliverymanREF
  JOIN Vehicles ON Vehicles.vehicleID = Driverlogs.vehicleREF WHERE Vehicles.is_available = 1 --11 POD KTOREGO MIASTA NAJCZESCIEJ PRZYJEZZDA£ POJAZD O TAKIEJ REJSTRACJI

  SELECT city,
         COUNT(register_plate) AS registers
  FROM Addresses
  JOIN Packages ON addressREF = Addresses.addressID
  JOIN PackageTransport ON packageREF = Packages.packageID
  JOIN Transports ON transportID = PackageTransport.packageREF
  JOIN Vehicles ON Vehicles.vehicleID = transportID
GROUP BY city
ORDER BY registers DESC