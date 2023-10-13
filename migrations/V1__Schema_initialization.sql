CREATE TABLE Post (
    PostID INT PRIMARY KEY,
	PostName VARCHAR(30),
	Salary DECIMAL(10, 2),
	Prize DECIMAL(10, 2)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
	PostID INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(50),
    Birthday DATE,
	PhoneNumber VARCHAR(15),
	Email VARCHAR(50),
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE Store (
	StoreID INT PRIMARY KEY,
	Adress VARCHAR(50),
	TimeOpen TIME,
	TimeClose TIME,
	StoreArea VARCHAR(10),
	AmoubtEmployees INT,
	Passability VARCHAR(10)
);

CREATE TABLE Supplier (
	SupplierID INT PRIMARY KEY,
	SupplierName  VARCHAR(50),
	Site VARCHAR(50),
	Email VARCHAR(255),
	Department VARCHAR(30)
);

CREATE TABLE Product(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50),
	Description VARCHAR(255),
	Series VARCHAR(50),
	Department VARCHAR(30),
	ProductCost DECIMAL(5,2)
);

CREATE TABLE ProductSupplier(
	ProductID INT,
	SupplierID INT,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Purchase(
	PurchaseID INT PRIMARY KEY,
	PurchaseDate DATE,
	PurchaseTime TIME,
	ProductID INT,
	EmployeeID INT,
	StoreID INT,
	PurchaseCost DECIMAL(10, 2),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);