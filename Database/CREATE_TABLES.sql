CREATE TABLE RoomType (
    RoomTypeID INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(100) NOT NULL
);


CREATE TABLE Room (
    RoomID INT IDENTITY PRIMARY KEY,
    RoomTypeID INT NOT NULL,
    RoomNumber NVARCHAR(50) NOT NULL,
    Area DECIMAL(8,2) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Room_RoomType
        FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);


CREATE TABLE Tenant (
    TenantID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(200) NOT NULL,
    Phone NVARCHAR(50),
    Email NVARCHAR(100)
);


CREATE TABLE LeaseContract (
    ContractID INT IDENTITY PRIMARY KEY,
    TenantID INT NOT NULL,
    RoomID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    RentPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Contract_Tenant
        FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID),

    CONSTRAINT FK_Contract_Room
        FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);


CREATE TABLE Invoice (
    InvoiceID INT IDENTITY PRIMARY KEY,
    ContractID INT NOT NULL,
    InvoiceDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    IsPaid BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_Invoice_Contract
        FOREIGN KEY (ContractID) REFERENCES LeaseContract(ContractID)
);


CREATE TABLE Payment (
    PaymentID INT IDENTITY PRIMARY KEY,
    InvoiceID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Payment_Invoice
        FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);
