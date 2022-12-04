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
 date_of_check_in BIT
);