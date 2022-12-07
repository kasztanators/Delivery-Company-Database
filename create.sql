
DECLARE @sql NVARCHAR(max)=''

SELECT @sql += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql

CREATE TABLE Users
(
 userID INT IDENTITY PRIMARY KEY,
 name CHAR(12) not null,
 surname CHAR(12) not null,
 user_name CHAR(15) not null UNIQUE,
 password CHAR(18) not null,
 email CHAR(20) not null UNIQUE

);
CREATE TABLE Addresses
(
 addressID INT IDENTITY PRIMARY KEY,
 city CHAR(20) not null,
 region CHAR(22) not null,
 postcode CHAR(6) CHECK (postcode LIKE '[0-9][0-9]-[0-9][0-9][0-9]') NOT NULL,
 street CHAR(12) not null, 
 building_number INT
	
);
CREATE TABLE HasAddress
(
userREF INT REFERENCES Users,
addressREF INT REFERENCES Addresses,
PRIMARY KEY (userREF, addressREF)
);
CREATE TABLE Receivers
(
 receiverID INTEGER IDENTITY PRIMARY KEY,
 surname CHAR (12) not null,
 name CHAR(12) not null,
 email CHAR(20) not null,
);
CREATE TABLE Orders
(
 orderID INTEGER IDENTITY PRIMARY KEY,
 date_of_check_in DATETIME,
 userREF INT REFERENCES Users 

);
CREATE TABLE Packages
(
 packageID INTEGER IDENTITY PRIMARY KEY,
 is_fragile BIT,
 size_X INT,
 size_Y INT,
 size_Z INT,
 weight INT,
 addressREF INT REFERENCES Addresses,
 orderREF INT REFERENCES Orders,
 receiverREF INT REFERENCES Receivers
);

CREATE TABLE Tracking_info
(
trackerID INT IDENTITY PRIMARY KEY,
message_CHAR VARCHAR(255),
);
CREATE TABLE Tracker
(
trackerREF INT REFERENCES Tracking_info,
receiverREF INT REFERENCES Receivers,
PRIMARY KEY (trackerREF, receiverREF)
);

CREATE TABLE Delivery_units
(
unitID INT IDENTITY PRIMARY KEY,
capacity INT,
addressREF INT REFERENCES Addresses
);

CREATE TABLE Deliverymen
(
deliverymanID INT IDENTITY PRIMARY KEY,
phone_num CHAR(9) CHECK (phone_num like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
CREATE TABLE Vehicles
(
vehicleID INT IDENTITY PRIMARY KEY,
register_plate CHAR(8),
type CHAR(12),
is_available BIT
);

CREATE TABLE Driverlogs
(
driverlogID INT IDENTITY PRIMARY KEY,
licence_type CHAR(2),
deliverymanREF INT REFERENCES Deliverymen,
vehicleREF INT REFERENCES Vehicles
);
CREATE TABLE Transports
(
transportID INT IDENTITY PRIMARY KEY,
status CHAR(10),
x_coor FLOAT,
y_coor FLOAT,
vehicleREF INT REFERENCES Vehicles,
deliverymanREF INT REFERENCES Deliverymen,
unitREF INT REFERENCES Delivery_units
);
CREATE TABLE Group_of_packages
(
groupID INT IDENTITY PRIMARY KEY,
weight INT,
size_x INT,
size_y INT,
size_z INT,
transportREF INT REFERENCES Transports
);
CREATE TABLE Transshipments
(
transshipmentID INT IDENTITY PRIMARY KEY,
date DATETIME,
transportREF INT REFERENCES Transports
);
drop table Addresses
drop table Orders
drop table Delivery_units
drop table Deliverymen
drop table Group_of_packages
drop table Driverlogs
drop table Packages
drop table Receivers
drop table Tracker
drop table Tracking_info
drop table Transshipments
drop table Users
drop table Vehicles
drop table HasAddress
drop table Transports