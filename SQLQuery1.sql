
DECLARE @sql NVARCHAR(max)=''

SELECT @sql += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql

CREATE TABLE Users
(
 user_id INTEGER PRIMARY KEY,
 name CHAR(12),
 surname CHAR(12),
 user_name CHAR(15),
 password CHAR(18),
 email CHAR(20) UNIQUE

);
CREATE TABLE Addresses
(
 address_ID INTEGER PRIMARY KEY,
 city CHAR(20),
 region CHAR(22),
 postcode CHAR(6),
 street CHAR(12),
 building_number INT

);
CREATE TABLE Receivers
(
 receiver_ID INTEGER PRIMARY KEY,
 surname CHAR (12),
 name CHAR(12),
 email CHAR(20),

);
CREATE TABLE Packages
(
 package_ID INTEGER PRIMARY KEY,
 is_fragile BIT,
 size_X INT,
 size_Y INT,
 size_Z INT,
 weight INT

);
CREATE TABLE Orders
(
 order_ID INTEGER PRIMARY KEY,
 date_of_check_in DATETIME,

);
CREATE TABLE Tracking_info
(
tracker_ID INT PRIMARY KEY,
message_CHAR CHAR(255)
);
CREATE TABLE Transshipments
(
transshipment_ID INT PRIMARY KEY,
date DATETIME
);
CREATE TABLE Delivery_units
(
unit_ID INT PRIMARY KEY,
capacity INT
);
CREATE TABLE Group_of_packages
(
group_ID INT PRIMARY KEY,
weight INT,
size_x INT,
size_y INT,
size_z INT
);
CREATE TABLE Deliverymen
(
deliveryman_ID INT PRIMARY KEY,
phone_num INT,
shift_start DATETIME,
shift_end DATETIME
);
CREATE TABLE Vehicles
(
vehicle_ID INT PRIMARY KEY,
register_plate CHAR(8),
type CHAR(12),
is_available BIT
);
CREATE TABLE Transports
(
transport_ID INT PRIMARY KEY,
status CHAR(10),
x_coor FLOAT,
y_coor FLOAT
);
CREATE TABLE Driverlogs
(
driverlog_ID INT PRIMARY KEY,
licence_type CHAR(2)
);