CREATE TABLE Users
(
 userID INT PRIMARY KEY,
 name CHAR(12) not null,
 surname CHAR(12) not null,
 user_name CHAR(15) not null UNIQUE,
 password CHAR(18) not null,
 email CHAR(20) not null UNIQUE

);
CREATE TABLE Addresses
(
 addressID INT PRIMARY KEY,
 city CHAR(20) not null,
 region CHAR(22) not null,
 postcode CHAR(6) CHECK (postcode LIKE '[0-9][0-9]-[0-9][0-9][0-9]') NOT NULL,
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
 surname CHAR (12) not null,
 name CHAR(12) not null,
 email CHAR(20) not null,
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
 is_fragile BIT,
 size_X INT,
 size_Y INT,
 size_Z INT,
 weight INT,
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
capacity INT,
addressREF INT REFERENCES Addresses ON DELETE CASCADE
);

CREATE TABLE Deliverymen
(
deliverymanID INT PRIMARY KEY,
phone_num CHAR(9) CHECK (phone_num like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
CREATE TABLE Vehicles
(
vehicleID INT  PRIMARY KEY,
register_plate CHAR(8),
type CHAR(12),
is_available BIT
);

CREATE TABLE Driverlogs
(
driverlogID INT PRIMARY KEY,
licence_type CHAR(2),
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
weight INT,
size_x INT,
size_y INT,
size_z INT,
transportREF INT REFERENCES Transports ON DELETE CASCADE
);
CREATE TABLE Transshipments
(
transshipmentID INT PRIMARY KEY,
date DATETIME,
transportREF INT REFERENCES Transports ON DELETE CASCADE
);