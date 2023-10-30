--Task 1

CREATE DATABASE Task
USE Task

CREATE TABLE Users (
    UserID INT  PRIMARY KEY IDENTITY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Roles (
    RoleID INT  PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL
);
CREATE TABLE UserRoles (
    UserRoleID INT  PRIMARY KEY IDENTITY,
    UserID INT,
    RoleID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
INSERT INTO Users (Username, Password)
VALUES
    ('Aqil', '2004'),
    ('Tural', '2003'),
    ('Perviz', '2001');
	
INSERT INTO Roles (Name)
VALUES
    ('Master'),
    ('Contributors'),
    ('Admin');

	
INSERT INTO UserRoles (UserID, RoleID)
VALUES (1, 1),(2, 2),(3, 3)


SELECT Users.Username, Roles.Name AS RoleName
FROM Users
INNER JOIN UserRoles ON Users.UserID = UserRoles.UserID
INNER JOIN Roles ON UserRoles.RoleID = Roles.RoleID;

---------------------------------------------------------
--Task 2


CREATE TABLE Categories (
    CategoryID INT  PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Colors (
    ColorID INT   PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL
);
CREATE TABLE Products (
    ProductID INT   PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


CREATE TABLE ProductColors (
    ProductColorID INT   PRIMARY KEY IDENTITY,
    ProductID INT,
    ColorID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ColorID) REFERENCES Colors(ColorID)
);


SELECT p.Name AS ProductName, p.Price, p.Cost,c.Name AS CategoryName,co.Name AS ColorName
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN ProductColors pc ON p.ProductID = pc.ProductID
LEFT JOIN Colors co ON pc.ColorID = co.ColorID;


INSERT INTO Categories (Name)
VALUES ('Das'),('Pul'),('Geyim')

INSERT INTO Colors (Name)
VALUES ('Mavi'),('Ağ'),('Qirmizi'),('Sari');

INSERT INTO Products (Name, Price, Cost, CategoryID)
VALUES ('zumrud', 300, 100, 1), ('dollar', 170, 10, 2),
       ('koyney', 20, 4, 3);


INSERT INTO ProductColors (ProductID, ColorID)
VALUES (1, 1), (1, 2),(2, 1),(2, 3),(3, 4);










