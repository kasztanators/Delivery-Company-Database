CREATE TABLE Users
(
 userID INT PRIMARY KEY,
 name CHAR(20) CHECK (name like '[a-zA-Z]{3, 20}') not null,
 surname CHAR(12) CHECK (surname like '%[^a-zA-Z]%') not null,
 user_name CHAR(15) not null UNIQUE,
 password CHAR(18) not null,
 email VARCHAR(255) CHECK (email like '%_@__%.__%')not null UNIQUE

);
CREATE TABLE Addresses
(
 addressID INT PRIMARY KEY,
 city CHAR(20) CHECK (city like '%[^a-zA-Z]%') not null,
 region CHAR(30) not null,
 postcode CHAR(6) CHECK (postcode like '[0-9][0-9]-[0-9][0-9][0-9]') not null,
 street CHAR(12) not null, 
 building_number INT
	
);
CREATE TABLE HasAddress
(
userREF INT REFERENCES Users ON DELETE CASCADE,
addressREF INT REFERENCES Addresses ON DELETE CASCADE,
PRIMARY KEY (userREF, addressREF)
);
CREATE TABLE Receivers
(
 receiverID INTEGER PRIMARY KEY,
 name CHAR(30) CHECK ( name like '%[^a-zA-Z]%')not null,
 surname CHAR (30) CHECK ( surname like '%[^a-zA-Z]%')not null,
 email CHAR(25)CHECK (email like '%_@__%.__%') not null
);
CREATE TABLE Orders
(
 orderID INTEGER PRIMARY KEY,
 date_of_check_in DATETIME,
 userREF INT REFERENCES Users ON DELETE CASCADE

);
CREATE TABLE Packages
(
 packageID INTEGER PRIMARY KEY,
 is_fragile BIT not null,
 size_X INT not null,
 size_Y INT not null,
 size_Z INT not null,
 weight INT not null,
 addressREF INT REFERENCES Addresses ON DELETE CASCADE,
 orderREF INT REFERENCES Orders ON DELETE CASCADE,
 receiverREF INT REFERENCES Receivers ON DELETE CASCADE
);

CREATE TABLE Tracking_info
(
trackerID INT PRIMARY KEY,
message_CHAR VARCHAR(255),
);
CREATE TABLE Tracker
(
trackerREF INT REFERENCES Tracking_info ON DELETE CASCADE,
receiverREF INT REFERENCES Receivers ON DELETE CASCADE,
PRIMARY KEY (trackerREF, receiverREF)
);

CREATE TABLE Delivery_units
(
unitID INT PRIMARY KEY,
capacity INT not null,
addressREF INT REFERENCES Addresses ON DELETE CASCADE
);

CREATE TABLE Deliverymen
(
deliverymanID INT PRIMARY KEY,
phone_num CHAR(9) CHECK (phone_num like '[0-9]{11}') not null
);
CREATE TABLE Vehicles
(
vehicleID INT  PRIMARY KEY,
register_plate CHAR(8) not null,
type CHAR(12) not null,
is_available BIT not null
);

CREATE TABLE Driverlogs
(
driverlogID INT PRIMARY KEY,
licence_type CHAR(2) not null,
deliverymanREF INT REFERENCES Deliverymen ON DELETE CASCADE,
vehicleREF INT REFERENCES Vehicles ON DELETE CASCADE
);
CREATE TABLE Transports
(
transportID INT PRIMARY KEY,
status CHAR(10),
x_coor FLOAT,
y_coor FLOAT,
vehicleREF INT REFERENCES Vehicles ON DELETE CASCADE,
deliverymanREF INT REFERENCES Deliverymen ON DELETE CASCADE,
unitREF INT REFERENCES Delivery_units ON DELETE CASCADE
);
CREATE TABLE Group_of_packages
(
groupID INT PRIMARY KEY,
weight INT not null,
size_x INT not null ,
size_y INT not null,
size_z INT not null,
transportREF INT REFERENCES Transports ON DELETE CASCADE
);
CREATE TABLE Transshipments
(
transshipmentID INT PRIMARY KEY,
date DATETIME not null,
transportREF INT REFERENCES Transports ON DELETE CASCADE
);