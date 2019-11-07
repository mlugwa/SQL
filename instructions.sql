-- The Database and all tables were created using the Adminer (a web based gui)
-- The UI is found at http://localhost:8080 when the server is up

--------------------------------------------- INSTRUCTIONS ----------------------------------------------------------

-- 1. Create a database called “Umuzi”.

-- 2. Create the following tables in the Umuzi database:

--Customers
--Employees
--Orders
--Payments
--Products

-- 3. Create a primary key for each table with auto-increment (make sure you correctly specify the data types, e.g. the ID field should be int).

-- 4. Create foreign keys so that every ID in the order table references an existing ID in the tables referenced (e.g., ProductID, EmployeeID, etc).

-- 5. INSERT the records in the tables below into the table you created in step 2.

-- 6. Document what information is stored in your database. Be sure to say what information is kept in what table, and which keys link the records between tables.

-------------------------------------- TABLES CREATION AND DATA INSERTION ------------------------------------------
-- Creating database called Umuzi:

CREATE DATABASE Umuzi;
-- This shows an empty database



-- Creating the Customers table and specifying primary key:

CREATE TABLE Customers (
	Customer_ID serial PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR,
	Address VARCHAR(200),
	Phone INTEGER(10),
	Email VARCHAR(100),
	City VARCHAR(20),
	Country VARCHAR(50),
)


-- The following commands were used in the Adminer interface typed into the SQL editor
-- Inserting the data/information into the Customers table:


INSERT INTO Customers (Customer_ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country) VALUES (1, 'John', 'Hibert', 'Male', '284 Chaucer St', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa');
INSERT INTO Customers (Customer_ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country) VALUES (2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa');
INSERT INTO Customers (Customer_ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country) VALUES (3, 'Leon', 'Glen', 'Male', '81 Everton Rd, Gillits', 0820832830, 'leon@gmail.com', 'Durban', 'South Africa');
INSERT INTO Customers (Customer_ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country) VALUES (4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', 44856872553, 'charl.muller@yahoo.com', 'Berlin', 'Germany');
INSERT INTO Customers (Customer_ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country) VALUES (5, 'Julia', 'Stein', 'Female', '2 Wernerring', 448672445058, 'js234@yahoo.com', 'Frankfurt', 'Germany');


-- Results of Customers table after data/information insertion:

customer_id   firstname  lastname   gender   address	    phone	email		  city		country
1	      John	 Hibert     Male     284 chaucer st 084789657	john@gmail.com	  Johannesburg	South Africa
2             Thando	 Sithole    Female   240 Sect 1	    0794445584	thando@gmail.com  Cape Town	South Africa
3	      Leon       Glen	    Male   81 Everton Rd,Gillits 0820832830 leon@gmail.com Durban	South Africa
4	      Charl	 Muller	    Male    290A Dorset Ecke 44856872553 charl.muller@yahoo.com	Berlin	Germany
5	      Julia	 Stein	    Female  2 Wernerring    448672445058 js234@yahoo.com  Frankfurt	Germany


-- Creating the Employees table with primary key:

CREATE TABLE Employees (
	Employee_ID serial PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Email VARCHAR(100),
	JobTitle VARCHAR(20),
)


-- Inserting data/information into the Employees table:

INSERT INTO Employees (Employee_ID, FirstName, LProductID INTEGER REFERENCES Products(Productid)astName, Email, JobTitle) VALUES (1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');
INSERT INTO Employees (Employee_ID, FirstName, LastName, Email, JobTitle) VALUES (2, 'Lesly', 'Cronje', 'lesc@gmail.com', 'Clerk');
INSERT INTO Employees (Employee_ID, FirstName, LastName, Email, JobTitle) VALUES (3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');


-- Results of Employees table after data/information insertion:
 
Employee_ID	FirstName	LastName	Email		JobTitle
1		Kani		Matthew		mat@gmail.com	Manager
2		Lesly		Cronje		lesc@gmail.com	Clerk
3		Gideon		Maduku		m@gmail.com	Accountant


-- Creating the Orders table:

CREATE TABLE Orders (
	Order_ID	serial PRIMARY KEY,
	Product_ID	INTEGER REFERENCES Products(Product_ID),
	Payment_ID	INTEGER REFERENCES Payments(Payment_ID),
	FulfilledByEmployee_ID INTEGER,
	DateRequired	DATETIME,
	DateShipped	DATETIME,
	Status		VARCHAR(20),
)


-- Inserting data/information into the Orders table:

INSERT INTO Orders (Order_ID, Product_ID, Payment_ID, FulfilledByEmployee_ID, DateRequired, DateShipped, Status) VALUES (1, 1, 1, 2, 05-09-2018, null, 'Not Shipped');
INSERT INTO Orders (Order_ID, Product_ID, Payment_ID, FulfilledByEmployee_ID, DateRequired, DateShipped, Status) VALUES (2, 1, 2, 2, 04-09-2018, 03-09-2018, 'Shipped');
INSERT INTO Orders (Order_ID, Product_ID, Payment_ID, FulfilledByEmployee_ID, DateRequired, DateShipped, Status) VALUES (3, 3, 3, 3, 06-09-2018, null, 'Not Shipped');


-- Results of Orders table after data/information insertion:

OrderID		ProductID	PaymentID	FulfilledByEmployeeID	DateRequired	DateShipped	Status
1		1		1		2			2018-05-09	NULL		Not Shipped
2		1		2		2			2018-04-09	2018-03-09	Shipped
3		3		3		3			2018-06-09	NULL		Not Shipped


-- Creating the Payments table:

CREATE TABLE Payments (
	Customer_ID	INTEGER REFERENCES Customers(Customer_ID),
	Payment_ID	serial PRIMARY KEY,
	PaymentDate	DATETIME,
	Amount		DECIMAL,
)


-- Inserting data/information into the Payments table:

INSERT INTO Payments (Customer_ID, Payment_ID, PaymentDate, Amount) VALUES (1, 1, 01-09-2018, 150.75);
INSERT INTO Payments (Customer_ID, Payment_ID, PaymentDate, Amount) VALUES (5, 2, 03-09-2018, 150.75);
INSERT INTO Payments (Customer_ID, Payment_ID, PaymentDate, Amount) VALUES (4, 3, 03-09-2018, 700.60);


-- Results of Payments table after data/information insertion:

CustomerID	PaymentID	PaymentDate	Amount
1		1		2018-01-09	150.75
5		2		2018-03-09	150.75
4		3		2018-03-09	700.60


-- Creating the Products table:

CREATE TABLE Products (
	Product_ID	serial PRIMARY KEY,
	ProductName	VARCHAR(100),
	Description	VARCHAR(300),
	BuyPrice	DECIMAL,
)


-- Inserting data/information into the Products table:

INSERT INTO Products (Product_ID, ProductName, Description, BuyPrice) VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever.', 150.75);
INSERT INTO Products (Product_ID, ProductName, Description, BuyPrice) VALUES (2, 'Classic Car', 'Turnable front wheels, steering function.', 550.75);
INSERT INTO Products (Product_ID, ProductName, Description, BuyPrice) VALUES (3, 'Sports Car', 'Turnable front wheels, steering function.', 700.60);


-- Results of Products table after data/information insertion:

ProductID  ProductName		     Description								BuyPrice
1	   Harley Davidson Chopper   This replica features working kickstand, front suspension, gear-shift...	150.75
2	   Classic Car		     Turnable front wheels, steering function.					550.75
3	   Sports Car	             Turnable front wheels, steering function.					700.60


----------------------------------------- PART 2 ---------------------------------------------

-- 1. SELECT ALL records from table Customers.

SELECT * FROM Customers;

customer_id  firstname	lastname  gender  address	  phone	     email	         city	      country
1	     John	Hibert	  Male	  284 chaucer st  084789657  john@gmail.com      Johannesburg  South Africa
2	     Thando	Sithole	  Female  240 Sect 1	  0794445584 thando@gmail.com    Cape Town     South Africa
3	     Leon	Glen	  Male	  81 Everton Rd,Gillits	0820832830 leon@gmail.com Durban      South Africa
4	     Charl	Muller	Male	  290A Dorset Ecke  44856872553 charl.muller@yahoo.com Berlin   Germany
5	     Julia	Stein	Female 	  2 Wernerring	  448672445058	js234@yahoo.com	 Frankfurt     Germany

-- 2. SELECT records only from the name column in the Customers table.



Show the name of the Customer whose CustomerID is 1.

UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.

DELETE the record from the Customers table for customer 2 (CustomerID = 2).

Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.

Return the MAXIMUM payment made on the PAYMENTS table.

Select all customers from the “Customers” table, sorted by the “Country” column.

Select all products with a price BETWEEN R100 and R600.

Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.

Select all fields from “Customers” where city is “Cape Town” OR “Durban”.

Select all records from Products where the Price is GREATER than R500.

Return the sum of the Amounts on the Payments table.

Count the number of shipped orders in the Orders table.

Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).

Using INNER JOIN create a query that selects all Payments with Customer information.

Select all products that have turnable front wheels.






