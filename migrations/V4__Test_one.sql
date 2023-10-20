CREATE TABLE users (
	UserID INT PRIMARY KEY,
	UserName VARCHAR(30) NOT NULL,
	UserSurname VARCHAR(50),
	Email VARCHAR(50) UNIQUE NOT NULL,
	UserPassword VARCHAR(20) NOT NULL,
	RegistrationDate DATE NOT NULL,
	Status VARCHAR(10) NOT NULL
);

CREATE TABLE orders (
	OrderID INT PRIMARY KEY,
	UserID INT,
	OrderDate DATE NOT NULL,
	TotalAmount INT NOT NULL,
	Status VARCHAR(10) NOT NULL,
	OrderAddress VARCHAR(100) NOT NULL,
	FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE productcategories(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50) UNIQUE NOT NULL,
	Description VARCHAR(200),
	CreateDate DATE NOT NULL,
	UpdateDate DATE
);

CREATE TABLE products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50) UNIQUE NOT NULL,
	Description VARCHAR(200),
	Price INT NOT NULL CHECK (Price >= 30),
	InStock INT,
	CategoryID INT,
	FOREIGN KEY (CategoryID) REFERENCES productcategories(CategoryID)
); 

INSERT INTO users (UserID, UserName, UserSurname, Email, UserPassword, RegistrationDate, Status)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 'password123', '2023-01-15', 'Active'),
    (2, 'Alice', 'Smith', 'alice.smith@example.com', 'securepass', '2023-02-20', 'Active'),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', 'pass456', '2023-03-25', 'Inactive'),
    (4, 'Eva', 'Williams', 'eva.williams@example.com', 'strongpwd', '2023-04-30', 'Active'),
    (5, 'Michael', 'Brown', 'michael.brown@example.com', 'mypassword', '2023-05-05', 'Active');

INSERT INTO orders (OrderID, UserID, OrderDate, TotalAmount, Status, OrderAddress)
VALUES
    (1, 1, '2023-01-10', 100, 'Shipped', '123 Main St, City A'),
    (2, 2, '2023-02-15', 75, 'Delivered', '456 Oak St, City B'),
    (3, 3, '2023-03-20', 50, 'Cancelled', '789 Elm St, City C'),
    (4, 4, '2023-04-25', 200, 'Shipped', '101 Pine St, City D'),
    (5, 5, '2023-05-30', 150, 'Processing', '202 Cedar St, City E');

INSERT INTO productcategories (CategoryID, CategoryName, Description, CreateDate, UpdateDate)
VALUES
    (1, 'Electronics', 'Electronics and gadgets', '2023-01-01', '2023-01-01'),
    (2, 'Clothing', 'Apparel and fashion', '2023-02-01', '2023-02-01'),
    (3, 'Home & Garden', 'Home decor and gardening', '2023-03-01', '2023-03-01'),
    (4, 'Books', 'Books and literature', '2023-04-01', '2023-04-01'),
    (5, 'Toys', 'Toys and games', '2023-05-01', '2023-05-01');
	
INSERT INTO products (ProductID, ProductName, Description, Price, InStock, CategoryID)
VALUES
    (1, 'Smartphone', 'Latest smartphone model', 500, 100, 1),
    (2, 'T-shirt', 'Cotton T-shirt', 50, 200, 2),
    (3, 'Garden Tools', 'Set of gardening tools', 50, 50, 3),
    (4, 'Science Fiction Book', 'Bestseller book', 40, 30, 4),
    (5, 'Board Game', 'Family board game', 30, 100, 5);