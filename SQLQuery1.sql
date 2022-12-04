DROP TABLE Users
DROP TABLE Addresses

CREATE TABLE Users
(
 user_id INTEGER PRIMARY KEY,
 name TEXT,
 surname TEXT,
 user_name TEXT,
 password TEXT,
 email TEXT

);
CREATE TABLE Addresses
(
 address_ID INTEGER PRIMARY KEY,
 city TEXT,
 region TEXT,
 postcode TEXT,
 street TEXT,
 building_number INT

);
CREATE TABLE Receivers
(
 receiver_ID INTEGER PRIMARY KEY,
 surname TEXT,
 name TEXT,
 email TEXT,

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
tracker_ID INT,
message_text TEXT
);
CREATE TABLE Transshipments
(
transshipment_ID INT,
date DATETIME
);
CREATE TABLE Delivery_units
(
unit_ID INT,
capacity INT
);
CREATE TABLE Group_of_packages
(
group_ID INT,
weight INT,
size_x INT,
size_y INT,
size_z INT
);
CREATE TABLE Deliverymen
(
deliveryman_ID INT,
phone_num INT,
shift_start DATETIME,
shift_end DATETIME
);
CREATE TABLE Vehicles
(
vehicle_ID INT,
register_plate TEXT,
type TEXT,
is_available BIT
);
CREATE TABLE Transports
(
transport_ID INT,
status TEXT,
x_coor FLOAT,
y_coor FLOAT
);
CREATE TABLE Driverlogs
(
driverlog_ID INT,
licence_type TEXT
);