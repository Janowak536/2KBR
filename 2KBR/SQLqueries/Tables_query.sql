create table Clients (
	clientID int NOT NULL PRIMARY KEY,
	Name varchar(50),
	NIP char(10) UNIQUE,
	Phone char(11) UNIQUE,
	Email varchar(100) UNIQUE,
	Address varchar(100),
	City varchar(20),
	postalCode char(6),
	clientType varchar(20),
	discountCode varchar(20) UNIQUE,
	CONSTRAINT [CHK_NIP]
	CHECK (NOT [NIP] like '%[^0-9]%'),
	CONSTRAINT [CHK_Phone]
	CHECK (NOT [Phone] like '+%[0-9]%'),
	CONSTRAINT [CHK_pCode]  
    CHECK ([postalCode] like '[0-9][0-9]-[0-9][0-9][0-9]')
)

CREATE table Models (
	modelID int NOT NULL PRIMARY KEY,
	modelName char(20),
	Type char (20),
	worthValue decimal(15, 2)
)

CREATE table Colors (
	colorID int NOT NULL PRIMARY KEY,
	colorName char(20),
	Type char(20),
	worthValue decimal(15,2)
)

CREATE table MDF (
	mdfID int NOT NULL PRIMARY KEY,
	mdfName char(20),
	Type char(20),
	worthValue decimal(15,2)
)

CREATE table Orders (
	orderID int NOT NULL PRIMARY KEY,
	modelID int NOT NULL FOREIGN KEY REFERENCES Models(modelID),
	colorID int NOT NULL FOREIGN KEY REFERENCES Colors(colorID),
	mdfID int NOT NULL FOREIGN KEY REFERENCES MDF(mdfID),
	totalValue decimal(20,2) NOT NULL
)

CREATE table clientsOrders (
	clientID int NOT NULL FOREIGN KEY REFERENCES Clients(clientID),
	orderID int NOT NULL FOREIGN KEY REFERENCES Orders(orderID),
	orderDate date NOT NULL,
	orderValue decimal(15,2) NOT NULL
)






