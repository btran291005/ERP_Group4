-- =========================================================
-- Adidas Vietnam Procurement Management System
-- Full schema — 24 entities, FK-safe creation order
-- =========================================================

CREATE DATABASE IF NOT EXISTS adidas_procurement CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE adidas_procurement;

SET FOREIGN_KEY_CHECKS = 0;

-- ---------- User & Authorization Management ----------

CREATE TABLE Role (
    RoleID      VARCHAR(10)  PRIMARY KEY,
    RoleName    VARCHAR(50)  NOT NULL,
    Description VARCHAR(255) NULL
);

CREATE TABLE Employee (
    EmployeeID VARCHAR(10)  PRIMARY KEY,
    FullName   VARCHAR(100) NOT NULL,
    Department VARCHAR(50)  NOT NULL,
    Position   VARCHAR(50)  NOT NULL,
    RoleID     VARCHAR(10)  NOT NULL,
    Email      VARCHAR(100) NOT NULL UNIQUE,
    Status     VARCHAR(20)  NOT NULL, -- Active, Inactive
    PasswordHash VARCHAR(255) NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

CREATE TABLE Role_Permission (
    PermissionID INT AUTO_INCREMENT PRIMARY KEY,
    RoleID     VARCHAR(10) NOT NULL,
    ModuleName VARCHAR(50) NOT NULL,
    CanCreate  BOOLEAN NOT NULL DEFAULT 0,
    CanRead    BOOLEAN NOT NULL DEFAULT 0,
    CanUpdate  BOOLEAN NOT NULL DEFAULT 0,
    CanDelete  BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    UNIQUE KEY uq_role_module (RoleID, ModuleName)
);

-- ---------- Master Data ----------

CREATE TABLE Material (
    MaterialID      VARCHAR(10)  PRIMARY KEY,
    MaterialName    VARCHAR(100) NOT NULL,
    Category        VARCHAR(50)  NULL,
    UnitOfMeasure   VARCHAR(20)  NOT NULL,
    StandardCost    DECIMAL(12,2) NULL,
    CurrentStockQty INT NOT NULL DEFAULT 0,
    SafetyStockQty  INT NOT NULL DEFAULT 0,
    Status          VARCHAR(20) NOT NULL -- Active, Inactive, Discontinued, Blocked
);

CREATE TABLE Vendor (
    VendorID       VARCHAR(10)  PRIMARY KEY,
    VendorName     VARCHAR(100) NOT NULL,
    TaxID          VARCHAR(20)  UNIQUE,
    CompanyCode    VARCHAR(10)  NOT NULL,
    PurchasingOrg  VARCHAR(10)  NOT NULL,
    ReconAccount   VARCHAR(20)  NOT NULL,
    Address        VARCHAR(255) NOT NULL,
    ContactPerson  VARCHAR(100) NULL,
    Phone          VARCHAR(20)  NULL,
    Email          VARCHAR(100) NULL,
    PaymentTerms   VARCHAR(50)  NULL,
    Currency       VARCHAR(10)  NULL,
    TariffFlag122  BOOLEAN NOT NULL DEFAULT 0,
    Status         VARCHAR(20) NOT NULL, -- Pending Approval, Rejected, Active, Inactive
    CreatedDate    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- Procurement Management ----------

CREATE TABLE Purchase_Requisition (
    PRID          VARCHAR(10) PRIMARY KEY,
    CreatedBy     VARCHAR(10) NOT NULL,
    RequiredDate  DATE NOT NULL,
    RequestDate   DATE NOT NULL,
    Status        VARCHAR(20) NOT NULL, -- Draft, Submitted, Processed, Cancelled
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Purchase_Requisition_Detail (
    PRDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PRID       VARCHAR(10) NOT NULL,
    MaterialID VARCHAR(10) NOT NULL,
    Quantity   INT NOT NULL,
    FOREIGN KEY (PRID) REFERENCES Purchase_Requisition(PRID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

CREATE TABLE RFQ (
    RFQID     VARCHAR(10) PRIMARY KEY,
    CreatedBy VARCHAR(10) NOT NULL,
    RFQDate   DATE NOT NULL,
    Status    VARCHAR(20) NOT NULL, -- Draft, Sent, Closed
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE RFQ_Detail (
    RFQDetailID INT AUTO_INCREMENT PRIMARY KEY,
    RFQID       VARCHAR(10) NOT NULL,
    MaterialID  VARCHAR(10) NOT NULL,
    Quantity    INT NOT NULL,
    RequiredDate DATE NOT NULL,
    FOREIGN KEY (RFQID) REFERENCES RFQ(RFQID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

CREATE TABLE RFQ_Detail_PR_Link (
    LinkID         INT AUTO_INCREMENT PRIMARY KEY,
    RFQDetailID    INT NOT NULL,
    PRDetailID     INT NOT NULL,
    LinkedQuantity INT NOT NULL,
    FOREIGN KEY (RFQDetailID) REFERENCES RFQ_Detail(RFQDetailID),
    FOREIGN KEY (PRDetailID) REFERENCES Purchase_Requisition_Detail(PRDetailID)
);

CREATE TABLE Quotation (
    QuotationID   VARCHAR(10) PRIMARY KEY,
    RFQID         VARCHAR(10) NOT NULL,
    VendorID      VARCHAR(10) NOT NULL,
    QuotationDate DATE NOT NULL,
    TotalAmount   DECIMAL(15,2) NOT NULL,
    LeadTimeDays  INT NOT NULL,
    Status        VARCHAR(20) NOT NULL, -- Pending, Accepted, Rejected
    FOREIGN KEY (RFQID) REFERENCES RFQ(RFQID),
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
);

CREATE TABLE Quotation_Detail (
    QuoteDetailID INT AUTO_INCREMENT PRIMARY KEY,
    QuotationID   VARCHAR(10) NOT NULL,
    MaterialID    VARCHAR(10) NOT NULL,
    UnitPrice     DECIMAL(12,2) NOT NULL,
    Quantity      INT NOT NULL,
    LineAmount    DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (QuotationID) REFERENCES Quotation(QuotationID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

CREATE TABLE Purchase_Order (
    POID           VARCHAR(10) PRIMARY KEY,
    VendorID       VARCHAR(10) NOT NULL,
    QuotationID    VARCHAR(10) NOT NULL,
    CreatedBy      VARCHAR(10) NOT NULL,
    PODate         DATE NOT NULL,
    Currency       VARCHAR(10) NOT NULL,
    TotalAmount    DECIMAL(15,2) NOT NULL,
    TotalTaxAmount DECIMAL(15,2) NOT NULL,
    Status         VARCHAR(20) NOT NULL, -- Pending Approval, Approved, Rejected, Sent, Confirmed, Closed
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (QuotationID) REFERENCES Quotation(QuotationID),
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Purchase_Order_Detail (
    PODetailID INT AUTO_INCREMENT PRIMARY KEY,
    POID       VARCHAR(10) NOT NULL,
    MaterialID VARCHAR(10) NOT NULL,
    Quantity   INT NOT NULL,
    UnitPrice  DECIMAL(12,2) NOT NULL,
    TaxRate    DECIMAL(5,2) NOT NULL,
    TaxAmount  DECIMAL(15,2) NOT NULL,
    LineAmount DECIMAL(15,2) NOT NULL,
    LineTotal  DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

CREATE TABLE PO_Approval_History (
    ApprovalID   VARCHAR(10) PRIMARY KEY,
    POID         VARCHAR(10) NOT NULL,
    ApproverID   VARCHAR(10) NOT NULL,
    Decision     VARCHAR(20) NOT NULL, -- Approved, Rejected
    Comments     VARCHAR(255) NULL,
    DecisionDate DATETIME NOT NULL,
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID),
    FOREIGN KEY (ApproverID) REFERENCES Employee(EmployeeID)
);

-- ---------- Vendor Management (evaluation depends on Quotation/PO) ----------

CREATE TABLE Supplier_Evaluation (
    EvaluationID   VARCHAR(10) PRIMARY KEY,
    VendorID       VARCHAR(10) NOT NULL,
    QuotationID    VARCHAR(10) NOT NULL,
    POID           VARCHAR(10) NULL,
    CostScore      DECIMAL(5,2) NOT NULL,
    QualityScore   DECIMAL(5,2) NOT NULL,
    DeliveryScore  DECIMAL(5,2) NOT NULL,
    TotalScore     DECIMAL(5,2) NOT NULL,
    EvaluationDate DATE NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (QuotationID) REFERENCES Quotation(QuotationID),
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID)
);

-- ---------- Logistics & Warehouse Management ----------

CREATE TABLE Shipment (
    ShipmentID     VARCHAR(10) PRIMARY KEY,
    POID           VARCHAR(10) NOT NULL,
    ShippingStatus VARCHAR(20) NOT NULL, -- In Production, Shipped, Delivered
    CarrierName    VARCHAR(100) NULL,
    TrackingNumber VARCHAR(50) NULL,
    UpdatedDate    DATETIME NOT NULL,
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID)
);

CREATE TABLE Goods_Receipt (
    GRID        VARCHAR(10) PRIMARY KEY,
    POID        VARCHAR(10) NOT NULL,
    ReceiptDate DATE NOT NULL,
    ReceivedBy  VARCHAR(10) NOT NULL,
    Status      VARCHAR(20) NOT NULL, -- Accepted, Partially Accepted, Rejected
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID),
    FOREIGN KEY (ReceivedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Goods_Receipt_Detail (
    GRDetailID   INT AUTO_INCREMENT PRIMARY KEY,
    GRID         VARCHAR(10) NOT NULL,
    PODetailID   INT NOT NULL,
    MaterialID   VARCHAR(10) NOT NULL,
    ReceivedQty  INT NOT NULL DEFAULT 0,
    RejectedQty  INT NOT NULL DEFAULT 0,
    DefectReason VARCHAR(100) NULL,
    FOREIGN KEY (GRID) REFERENCES Goods_Receipt(GRID),
    FOREIGN KEY (PODetailID) REFERENCES Purchase_Order_Detail(PODetailID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

-- ---------- Finance & Payment Management ----------

CREATE TABLE Invoice (
    InvoiceID      VARCHAR(10) PRIMARY KEY,
    InvoiceNumber  VARCHAR(50) NOT NULL,
    VendorID       VARCHAR(10) NOT NULL,
    POID           VARCHAR(10) NOT NULL,
    InvoiceDate    DATE NOT NULL,
    Currency       VARCHAR(10) NOT NULL,
    InvoiceAmount  DECIMAL(15,2) NOT NULL,
    TotalTaxAmount DECIMAL(15,2) NOT NULL,
    Status         VARCHAR(20) NOT NULL, -- Pending, Verified, Rejected, Paid
    AttachmentURL  VARCHAR(255) NULL,
    VerifiedBy     VARCHAR(10) NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (POID) REFERENCES Purchase_Order(POID),
    FOREIGN KEY (VerifiedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Invoice_Detail (
    InvoiceDetailID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceID       VARCHAR(10) NOT NULL,
    PODetailID      INT NOT NULL,
    MaterialID      VARCHAR(10) NOT NULL,
    InvoicedQty     INT NOT NULL,
    UnitPrice       DECIMAL(12,2) NOT NULL,
    TaxAmount       DECIMAL(15,2) NOT NULL,
    LineAmount      DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    FOREIGN KEY (PODetailID) REFERENCES Purchase_Order_Detail(PODetailID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

-- Discrepancy_Ticket depends on Goods_Receipt_Detail AND Invoice_Detail, so it is created after both
CREATE TABLE Discrepancy_Ticket (
    TicketID        VARCHAR(10) PRIMARY KEY,
    GRDetailID      INT NULL,
    PODetailID      INT NOT NULL,
    InvoiceDetailID INT NULL,
    RaisedBy        VARCHAR(10) NOT NULL,
    IssueType       VARCHAR(50) NOT NULL, -- Damaged, Shortage, Wrong Specification, Wrong Item, Other
    Description     VARCHAR(255) NULL,
    Status          VARCHAR(20) NOT NULL, -- Open, Under Review, Resolved, Closed
    ResolutionNotes VARCHAR(255) NULL,
    RaisedDate      DATETIME NOT NULL,
    ResolvedDate    DATETIME NULL,
    FOREIGN KEY (GRDetailID) REFERENCES Goods_Receipt_Detail(GRDetailID),
    FOREIGN KEY (PODetailID) REFERENCES Purchase_Order_Detail(PODetailID),
    FOREIGN KEY (InvoiceDetailID) REFERENCES Invoice_Detail(InvoiceDetailID),
    FOREIGN KEY (RaisedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Payment (
    PaymentID     VARCHAR(10) PRIMARY KEY,
    InvoiceID     VARCHAR(10) NOT NULL,
    ProcessedBy   VARCHAR(10) NOT NULL,
    ReconAccount  VARCHAR(20) NOT NULL,
    PaymentDate   DATE NOT NULL,
    Amount        DECIMAL(15,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    Status        VARCHAR(20) NOT NULL, -- Completed, Pending, Failed
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    FOREIGN KEY (ProcessedBy) REFERENCES Employee(EmployeeID)
);

-- ---------- Audit ----------

CREATE TABLE Audit_Log (
    AuditID    VARCHAR(10) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL,
    ActionType VARCHAR(20) NOT NULL, -- Create, Update, Delete
    TargetTable VARCHAR(50) NOT NULL,
    TargetID   VARCHAR(10) NOT NULL,
    OldValue   TEXT NULL,
    NewValue   TEXT NULL,
    Timestamp  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

SET FOREIGN_KEY_CHECKS = 1;
