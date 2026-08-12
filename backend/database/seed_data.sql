-- =========================================================
-- Adidas Vietnam Procurement OS - Full Realistic Seed Data
-- Password for ALL employees: 123456789@
-- Hash: $2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi
-- =========================================================
USE adidas_procurement;
SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing transactional/master data (keep structure)
DELETE FROM Audit_Log;
DELETE FROM Payment;
DELETE FROM Invoice_Detail;
DELETE FROM Invoice;
DELETE FROM Discrepancy_Ticket;
DELETE FROM Goods_Receipt_Detail;
DELETE FROM Goods_Receipt;
DELETE FROM Shipment;
DELETE FROM PO_Approval_History;
DELETE FROM Purchase_Order_Detail;
DELETE FROM Purchase_Order;
DELETE FROM Quotation_Detail;
DELETE FROM Quotation;
DELETE FROM RFQ_Detail_PR_Link;
DELETE FROM RFQ_Detail;
DELETE FROM RFQ;
DELETE FROM Purchase_Requisition_Detail;
DELETE FROM Purchase_Requisition;
DELETE FROM Supplier_Evaluation;
DELETE FROM Vendor;
DELETE FROM Material;
DELETE FROM Role_Permission;
DELETE FROM Employee;
DELETE FROM Role;

-- Role (7 rows)
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R01', 'Supply Chain Planner', 'Demand forecasting and PR creation');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R02', 'Sourcing Specialist', 'RFQ, quotation, vendor and PO creation');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R03', 'Procurement Manager', 'PO approval and executive reporting');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R04', 'Vendor', 'External supplier portal user');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R05', 'Warehouse Clerk', 'Goods receipt and discrepancy handling');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R06', 'Accountant', '3-way match verification and payment');
INSERT INTO Role (RoleID, RoleName, Description) VALUES ('R07', 'System Admin', 'User, role and audit log management');

-- Role_Permission (18 rows)
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R01', 'Purchase Requisition', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R01', 'Demand Forecast', 0, 1, 0, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R02', 'Vendor Master', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R02', 'PR Queue', 0, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R02', 'RFQ', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R02', 'Quotation', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R02', 'Purchase Order', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R03', 'Purchase Order', 0, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R03', 'Executive Dashboard', 0, 1, 0, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R04', 'RFQ Inbox', 1, 1, 0, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R04', 'PO Portal', 0, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R04', 'Invoice Submission', 1, 1, 0, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R05', 'Goods Receipt', 1, 1, 0, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R05', 'Discrepancy Log', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R06', 'Invoice', 0, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R06', 'Payment', 1, 1, 1, 0);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R07', 'User Management', 1, 1, 1, 1);
INSERT INTO Role_Permission (RoleID, ModuleName, CanCreate, CanRead, CanUpdate, CanDelete) VALUES ('R07', 'Audit Log', 0, 1, 0, 0);

-- Employee (15 rows)
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP001', 'Nguyen Van Hung', 'Supply Chain Planning', 'Supply Chain Planner', 'R01', 'hung.nguyen@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP002', 'Tran Thi Mai', 'Supply Chain Planning', 'Senior Demand Planner', 'R01', 'mai.tran@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP003', 'Le Van Duc', 'Sourcing', 'Sourcing Specialist', 'R02', 'duc.le@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP004', 'Pham Thi Lan', 'Sourcing', 'Sourcing Specialist', 'R02', 'lan.pham@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP005', 'Hoang Van Nam', 'Sourcing', 'Senior Sourcing Specialist', 'R02', 'nam.hoang@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP006', 'Vu Thi Huong', 'Procurement Management', 'Procurement Manager', 'R03', 'huong.vu@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP007', 'Dang Van Phuc', 'Procurement Management', 'Senior Procurement Manager', 'R03', 'phuc.dang@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP008', 'Bui Thi Thu', 'Warehouse & QA', 'Warehouse Clerk', 'R05', 'thu.bui@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP009', 'Do Van Tuan', 'Warehouse & QA', 'Warehouse Clerk', 'R05', 'tuan.do@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP010', 'Ngo Thi Kim', 'Warehouse & QA', 'QA Inspector', 'R05', 'kim.ngo@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP011', 'Ly Van Thanh', 'Finance & Accounting', 'Accountant', 'R06', 'thanh.ly@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP012', 'Truong Thi Ngoc', 'Finance & Accounting', 'Senior Accountant', 'R06', 'ngoc.truong@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP013', 'Phan Van Khoa', 'IT Department', 'System Admin', 'R07', 'khoa.phan@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP014', 'Dinh Thi Yen', 'Sourcing', 'Sourcing Specialist', 'R02', 'yen.dinh@adidas-vn.com', 'Inactive', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');
INSERT INTO Employee (EmployeeID, FullName, Department, Position, RoleID, Email, Status, PasswordHash) VALUES ('EMP015', 'Vo Van Long', 'Supply Chain Planning', 'Supply Chain Planner', 'R01', 'long.vo@adidas-vn.com', 'Active', '$2a$10$FBo1IkvVASbtDina3ogFXeU2yzRlfw52XCByO2MAFd6Lsg76d/nBi');

-- Material (20 rows)
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT001', 'Cotton Fabric - White 200gsm', 'Fabric', 'Meter', 3.5, 5200, 2000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT002', 'Rubber Outsole - Boost Size 42', 'Component', 'Pair', 4.2, 1500, 3000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT003', 'EVA Midsole Foam - Standard', 'Component', 'Pair', 2.85, 2200, 1500, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT004', 'Primeknit Textile Upper - Black', 'Fabric', 'Meter', 6.75, 1800, 1000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT005', 'Polyester Mesh - Breathable 3mm', 'Fabric', 'Meter', 2.1, 4300, 2000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT006', 'Shoelace - Flat 120cm White', 'Accessory', 'Piece', 0.35, 18000, 8000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT007', 'Adidas Heel Logo Patch - TPU', 'Accessory', 'Piece', 0.42, 22000, 10000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT008', 'Boost Foam Pellet - Grade A', 'Component', 'Kg', 8.9, 900, 1200, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT009', 'Nylon Zipper YKK #5 - 20cm', 'Accessory', 'Piece', 0.55, 9500, 4000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT010', 'Elastic Waistband - 3cm Black', 'Accessory', 'Meter', 1.25, 6200, 3000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT011', 'Polyester Thread - Reinforced', 'Accessory', 'Spool', 1.8, 3100, 1500, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT012', 'Recycled Polyester Fabric - Ocean Plastic', 'Fabric', 'Meter', 5.6, 2600, 1500, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT013', 'Carton Box - Shoebox Standard', 'Packaging', 'Piece', 0.65, 12000, 5000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT014', 'Poly Bag - Apparel Packing', 'Packaging', 'Piece', 0.08, 45000, 20000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT015', 'Tag - Barcode & Size Label', 'Accessory', 'Piece', 0.05, 60000, 25000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT016', 'TPU Heel Counter - Reinforced', 'Component', 'Piece', 1.15, 7000, 3500, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT017', 'Rubber Sole - Terrex Grip', 'Component', 'Pair', 5.4, 850, 1000, 'Blocked');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT018', 'Insole Foam - Ortholite', 'Component', 'Pair', 1.95, 3200, 1500, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT019', 'Reflective Trim - Safety Strip', 'Accessory', 'Meter', 0.9, 2400, 1000, 'Active');
INSERT INTO Material (MaterialID, MaterialName, Category, UnitOfMeasure, StandardCost, CurrentStockQty, SafetyStockQty, Status) VALUES ('MAT020', 'Denim Fabric - Heavy 12oz', 'Fabric', 'Meter', 4.35, 1100, 800, 'Discontinued');

-- Vendor (18 rows)
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V001', 'Pou Chen Vietnam Enterprise Ltd.', '0301234567', 'ADVN', 'SOUR', '300700', 'Lot A2, Song Than II IP, Di An, Binh Duong', 'Nguyen Thi Hoa', '+84 274 3737 111', 'contact@pouchen-vn.com', 'Net 30', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V002', 'Feng Tay Vietnam Footwear Co., Ltd.', '0301234568', 'ADVN', 'SOUR', '300700', 'KCN Tra Noc, Can Tho', 'Chen Wei Ming', '+84 292 3841 222', 'sales@fengtay-vn.com', 'Net 45', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V003', 'Taekwang Vina Industrial Co., Ltd.', '0301234569', 'ADVN', 'SOUR', '300700', 'KCN Bien Hoa 2, Dong Nai', 'Kim Jung Soo', '+84 251 3836 333', 'procurement@taekwangvina.com', 'Net 30', 'USD', 1, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V004', 'Changshin Vietnam Co., Ltd.', '0301234570', 'ADVN', 'SOUR', '300700', 'Hoa Khanh IP, Da Nang', 'Park Sun Hee', '+84 236 3770 444', 'order@changshin-vn.com', 'Net 30', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V005', 'Hwaseung Vina Corp.', '0301234571', 'ADVN', 'SOUR', '300700', 'Ninh Binh IP, Ninh Binh', 'Lee Dong Hyun', '+84 229 3899 555', 'biz@hwaseungvina.com', 'Net 60', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V006', 'Vietnam Fabric & Textile JSC', '0301234572', 'ADVN', 'SOUR', '300701', 'Tan Binh IP, Ho Chi Minh City', 'Tran Van Bao', '+84 28 3815 6789', 'sales@vftex.vn', 'Net 30', 'VND', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V007', 'Duy Tan Plastics Manufacturing Corp.', '0301234573', 'ADVN', 'SOUR', '300701', 'Binh Tan District, Ho Chi Minh City', 'Le Thi Ngoc Anh', '+84 28 3752 4321', 'info@duytanplastics.com', 'Net 30', 'VND', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V008', 'YKK Vietnam Co., Ltd.', '0301234574', 'ADVN', 'SOUR', '300701', 'Long Duc IP, Dong Nai', 'Yamada Kenji', '+84 251 3511 678', 'export@ykk-vn.com', 'Net 45', 'USD', 1, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V009', 'Kyung Bang Vietnam Textile Co.', '0301234575', 'ADVN', 'SOUR', '300701', 'Bao Minh IP, Nam Dinh', 'Choi Min Jae', '+84 228 3888 999', 'cs@kyungbangvn.com', 'Net 30', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V010', 'Thai Binh Shoes Joint Stock Co. (TBS Group)', '0301234576', 'ADVN', 'SOUR', '300700', 'Di An, Binh Duong', 'Nguyen Duc Thanh', '+84 274 3751 234', 'export@tbsgroup.vn', 'Net 30', 'VND', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V011', 'Global Packaging Solutions Vietnam', '0301234577', 'ADVN', 'SOUR', '300701', 'Nhon Trach IP, Dong Nai', 'Pham Minh Tuan', '+84 251 3560 111', 'sales@gpsvietnam.com', 'Net 30', 'VND', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V012', 'Sunrise Rubber Industry Co., Ltd.', '0301234578', 'ADVN', 'SOUR', '300700', 'Bien Hoa, Dong Nai', 'Do Thi Thanh Ha', '+84 251 3822 456', 'order@sunriserubber.vn', 'Net 30', 'VND', 0, 'Pending Approval');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V013', 'Formosa Taffeta Vietnam Co., Ltd.', '0301234579', 'ADVN', 'SOUR', '300701', 'Nhon Trach 3 IP, Dong Nai', 'Huang Chih Wei', '+84 251 3560 777', 'sales@formosataffeta.com.vn', 'Net 45', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V014', 'Eclat Textile Vietnam Co., Ltd.', '0301234580', 'ADVN', 'SOUR', '300701', 'Trang Bang IP, Tay Ninh', 'Wu Chia Hao', '+84 276 3888 234', 'vn.sales@eclat.com', 'Net 30', 'USD', 0, 'Active');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V015', 'An Phat Packaging JSC', '0301234581', 'ADVN', 'SOUR', '300701', 'Rang Dong IP, Nam Dinh', 'Vu Van Hai', '+84 228 3777 890', 'contact@anphatpack.vn', 'Net 30', 'VND', 0, 'Inactive');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V016', 'Green Textile Recycling Co., Ltd.', '0301234582', 'ADVN', 'SOUR', '300701', 'Long An IP, Long An', 'Tran Thi Bich', '+84 272 3654 321', 'info@greentextile.vn', 'Net 30', 'VND', 0, 'Pending Approval');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V017', 'Dong Nai Rubber & Sole Manufacturing', '0301234583', 'ADVN', 'SOUR', '300700', 'Long Thanh, Dong Nai', 'Ngo Van Son', '+84 251 3945 678', 'sales@dnrubber.vn', 'Net 30', 'VND', 1, 'Rejected');
INSERT INTO Vendor (VendorID, VendorName, TaxID, CompanyCode, PurchasingOrg, ReconAccount, Address, ContactPerson, Phone, Email, PaymentTerms, Currency, TariffFlag122, Status) VALUES ('V018', 'Samil Vina Co., Ltd.', '0301234584', 'ADVN', 'SOUR', '300700', 'Hai Duong IP, Hai Duong', 'Song Ji Hoon', '+84 220 3891 234', 'export@samilvina.com', 'Net 30', 'USD', 0, 'Active');

-- Purchase_Requisition (5 rows)
INSERT INTO Purchase_Requisition (PRID, CreatedBy, RequiredDate, RequestDate, Status) VALUES ('PR26-001', 'EMP001', '2026-07-20', '2026-07-10', 'Processed');
INSERT INTO Purchase_Requisition (PRID, CreatedBy, RequiredDate, RequestDate, Status) VALUES ('PR26-002', 'EMP002', '2026-07-25', '2026-07-12', 'Processed');
INSERT INTO Purchase_Requisition (PRID, CreatedBy, RequiredDate, RequestDate, Status) VALUES ('PR26-003', 'EMP001', '2026-08-05', '2026-07-18', 'Processed');
INSERT INTO Purchase_Requisition (PRID, CreatedBy, RequiredDate, RequestDate, Status) VALUES ('PR26-004', 'EMP015', '2026-08-20', '2026-08-01', 'Submitted');
INSERT INTO Purchase_Requisition (PRID, CreatedBy, RequiredDate, RequestDate, Status) VALUES ('PR26-005', 'EMP001', '2026-08-25', '2026-08-10', 'Draft');

-- Purchase_Requisition_Detail (12 rows)
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (1, 'PR26-001', 'MAT002', 1200);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (2, 'PR26-001', 'MAT003', 1200);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (3, 'PR26-001', 'MAT006', 5000);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (4, 'PR26-002', 'MAT001', 3000);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (5, 'PR26-002', 'MAT004', 1500);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (6, 'PR26-002', 'MAT011', 2000);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (7, 'PR26-003', 'MAT008', 600);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (8, 'PR26-003', 'MAT018', 1800);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (9, 'PR26-003', 'MAT016', 2500);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (10, 'PR26-004', 'MAT009', 3000);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (11, 'PR26-004', 'MAT010', 2200);
INSERT INTO Purchase_Requisition_Detail (PRDetailID, PRID, MaterialID, Quantity) VALUES (12, 'PR26-005', 'MAT012', 1000);

-- RFQ (3 rows)
INSERT INTO RFQ (RFQID, CreatedBy, RFQDate, Status) VALUES ('RFQ26-001', 'EMP003', '2026-07-14', 'Closed');
INSERT INTO RFQ (RFQID, CreatedBy, RFQDate, Status) VALUES ('RFQ26-002', 'EMP004', '2026-07-16', 'Closed');
INSERT INTO RFQ (RFQID, CreatedBy, RFQDate, Status) VALUES ('RFQ26-003', 'EMP005', '2026-07-22', 'Sent');

-- RFQ_Detail (9 rows)
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (1, 'RFQ26-001', 'MAT002', 1200, '2026-08-15');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (2, 'RFQ26-001', 'MAT003', 1200, '2026-08-15');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (3, 'RFQ26-001', 'MAT006', 5000, '2026-08-15');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (4, 'RFQ26-002', 'MAT001', 3000, '2026-08-20');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (5, 'RFQ26-002', 'MAT004', 1500, '2026-08-20');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (6, 'RFQ26-002', 'MAT011', 2000, '2026-08-20');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (7, 'RFQ26-003', 'MAT008', 600, '2026-09-01');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (8, 'RFQ26-003', 'MAT018', 1800, '2026-09-01');
INSERT INTO RFQ_Detail (RFQDetailID, RFQID, MaterialID, Quantity, RequiredDate) VALUES (9, 'RFQ26-003', 'MAT016', 2500, '2026-09-01');

-- RFQ_Detail_PR_Link (9 rows)
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (1, 1, 1, 1200);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (2, 2, 2, 1200);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (3, 3, 3, 5000);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (4, 4, 4, 3000);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (5, 5, 5, 1500);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (6, 6, 6, 2000);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (7, 7, 7, 600);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (8, 8, 8, 1800);
INSERT INTO RFQ_Detail_PR_Link (LinkID, RFQDetailID, PRDetailID, LinkedQuantity) VALUES (9, 9, 9, 2500);

-- Quotation (4 rows)
INSERT INTO Quotation (QuotationID, RFQID, VendorID, QuotationDate, TotalAmount, LeadTimeDays, Status) VALUES ('QT26-001', 'RFQ26-001', 'V003', '2026-07-18', 10040.00, 25, 'Accepted');
INSERT INTO Quotation (QuotationID, RFQID, VendorID, QuotationDate, TotalAmount, LeadTimeDays, Status) VALUES ('QT26-002', 'RFQ26-001', 'V004', '2026-07-19', 10550.00, 35, 'Rejected');
INSERT INTO Quotation (QuotationID, RFQID, VendorID, QuotationDate, TotalAmount, LeadTimeDays, Status) VALUES ('QT26-003', 'RFQ26-002', 'V006', '2026-07-20', 23600.00, 20, 'Accepted');
INSERT INTO Quotation (QuotationID, RFQID, VendorID, QuotationDate, TotalAmount, LeadTimeDays, Status) VALUES ('QT26-004', 'RFQ26-002', 'V009', '2026-07-21', 24700.00, 30, 'Rejected');

-- Quotation_Detail (12 rows)
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (1, 'QT26-001', 'MAT002', 4.15, 1200, 4980.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (2, 'QT26-001', 'MAT003', 2.80, 1200, 3360.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (3, 'QT26-001', 'MAT006', 0.34, 5000, 1700.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (4, 'QT26-002', 'MAT002', 4.30, 1200, 5160.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (5, 'QT26-002', 'MAT003', 2.95, 1200, 3540.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (6, 'QT26-002', 'MAT006', 0.37, 5000, 1850.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (7, 'QT26-003', 'MAT001', 3.40, 3000, 10200.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (8, 'QT26-003', 'MAT004', 6.60, 1500, 9900.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (9, 'QT26-003', 'MAT011', 1.75, 2000, 3500.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (10, 'QT26-004', 'MAT001', 3.55, 3000, 10650.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (11, 'QT26-004', 'MAT004', 6.90, 1500, 10350.00);
INSERT INTO Quotation_Detail (QuoteDetailID, QuotationID, MaterialID, UnitPrice, Quantity, LineAmount) VALUES (12, 'QT26-004', 'MAT011', 1.85, 2000, 3700.00);

-- Purchase_Order (2 rows)
INSERT INTO Purchase_Order (POID, VendorID, QuotationID, CreatedBy, PODate, Currency, TotalAmount, TotalTaxAmount, Status) VALUES ('PO26-001', 'V003', 'QT26-001', 'EMP005', '2026-07-23', 'USD', 10040.00, 803.20, 'Confirmed');
INSERT INTO Purchase_Order (POID, VendorID, QuotationID, CreatedBy, PODate, Currency, TotalAmount, TotalTaxAmount, Status) VALUES ('PO26-002', 'V006', 'QT26-003', 'EMP004', '2026-07-24', 'USD', 23600.00, 2360.00, 'Approved');

-- Purchase_Order_Detail (6 rows)
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (1, 'PO26-001', 'MAT002', 1200, 4.15, 8.0, 398.40, 4980.00, 5378.40);
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (2, 'PO26-001', 'MAT003', 1200, 2.80, 8.0, 268.80, 3360.00, 3628.80);
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (3, 'PO26-001', 'MAT006', 5000, 0.34, 8.0, 136.00, 1700.00, 1836.00);
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (4, 'PO26-002', 'MAT001', 3000, 3.40, 10.0, 1020.00, 10200.00, 11220.00);
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (5, 'PO26-002', 'MAT004', 1500, 6.60, 10.0, 990.00, 9900.00, 10890.00);
INSERT INTO Purchase_Order_Detail (PODetailID, POID, MaterialID, Quantity, UnitPrice, TaxRate, TaxAmount, LineAmount, LineTotal) VALUES (6, 'PO26-002', 'MAT011', 2000, 1.75, 10.0, 350.00, 3500.00, 3850.00);

-- Supplier_Evaluation (4 rows)
INSERT INTO Supplier_Evaluation (EvaluationID, VendorID, QuotationID, POID, CostScore, QualityScore, DeliveryScore, TotalScore, EvaluationDate) VALUES ('EVAL001', 'V003', 'QT26-001', 'PO26-001', 9.2, 9.0, 8.8, 9.0, '2026-07-19');
INSERT INTO Supplier_Evaluation (EvaluationID, VendorID, QuotationID, POID, CostScore, QualityScore, DeliveryScore, TotalScore, EvaluationDate) VALUES ('EVAL002', 'V004', 'QT26-002', NULL, 7.5, 8.0, 7.0, 7.5, '2026-07-20');
INSERT INTO Supplier_Evaluation (EvaluationID, VendorID, QuotationID, POID, CostScore, QualityScore, DeliveryScore, TotalScore, EvaluationDate) VALUES ('EVAL003', 'V006', 'QT26-003', 'PO26-002', 8.8, 9.3, 9.0, 9.0, '2026-07-21');
INSERT INTO Supplier_Evaluation (EvaluationID, VendorID, QuotationID, POID, CostScore, QualityScore, DeliveryScore, TotalScore, EvaluationDate) VALUES ('EVAL004', 'V009', 'QT26-004', NULL, 7.8, 8.2, 7.5, 7.8, '2026-07-22');

-- PO_Approval_History (2 rows)
INSERT INTO PO_Approval_History (ApprovalID, POID, ApproverID, Decision, Comments, DecisionDate) VALUES ('APR001', 'PO26-001', 'EMP006', 'Approved', 'Vendor score 9.0, cost competitive. Approved.', '2026-07-24 10:15:00');
INSERT INTO PO_Approval_History (ApprovalID, POID, ApproverID, Decision, Comments, DecisionDate) VALUES ('APR002', 'PO26-002', 'EMP006', 'Approved', 'Good delivery score, within budget. Approved.', '2026-07-25 14:30:00');

-- Shipment (2 rows)
INSERT INTO Shipment (ShipmentID, POID, ShippingStatus, CarrierName, TrackingNumber, UpdatedDate) VALUES ('SHP001', 'PO26-001', 'Delivered', 'DHL Supply Chain VN', 'DHLVN88231001', '2026-08-05 08:00:00');
INSERT INTO Shipment (ShipmentID, POID, ShippingStatus, CarrierName, TrackingNumber, UpdatedDate) VALUES ('SHP002', 'PO26-002', 'Shipped', 'Kerry Logistics VN', 'KLVN22091177', '2026-08-10 09:00:00');

-- Goods_Receipt (1 rows)
INSERT INTO Goods_Receipt (GRID, POID, ReceiptDate, ReceivedBy, Status) VALUES ('GR001', 'PO26-001', '2026-08-06', 'EMP008', 'Partially Accepted');

-- Goods_Receipt_Detail (3 rows)
INSERT INTO Goods_Receipt_Detail (GRDetailID, GRID, PODetailID, MaterialID, ReceivedQty, RejectedQty, DefectReason) VALUES (1, 'GR001', 1, 'MAT002', 1195, 5, 'Damaged');
INSERT INTO Goods_Receipt_Detail (GRDetailID, GRID, PODetailID, MaterialID, ReceivedQty, RejectedQty, DefectReason) VALUES (2, 'GR001', 2, 'MAT003', 1200, 0, NULL);
INSERT INTO Goods_Receipt_Detail (GRDetailID, GRID, PODetailID, MaterialID, ReceivedQty, RejectedQty, DefectReason) VALUES (3, 'GR001', 3, 'MAT006', 4980, 20, 'Wrong Specification');

-- Discrepancy_Ticket (2 rows)
INSERT INTO Discrepancy_Ticket (TicketID, GRDetailID, PODetailID, InvoiceDetailID, RaisedBy, IssueType, Description, Status, ResolutionNotes, RaisedDate, ResolvedDate) VALUES ('TCK001', 1, 1, NULL, 'EMP008', 'Damaged', '5 pairs of rubber outsole arrived damaged (crushed packaging).', 'Under Review', NULL, '2026-08-06 11:00:00', NULL);
INSERT INTO Discrepancy_Ticket (TicketID, GRDetailID, PODetailID, InvoiceDetailID, RaisedBy, IssueType, Description, Status, ResolutionNotes, RaisedDate, ResolvedDate) VALUES ('TCK002', 3, 3, NULL, 'EMP008', 'Wrong Specification', '20 shoelaces delivered in wrong color (black instead of white).', 'Open', NULL, '2026-08-06 11:10:00', NULL);

-- Invoice (1 rows)
INSERT INTO Invoice (InvoiceID, InvoiceNumber, VendorID, POID, InvoiceDate, Currency, InvoiceAmount, TotalTaxAmount, Status, AttachmentURL, VerifiedBy) VALUES ('INV26-001', 'TKV-INV-88213', 'V003', 'PO26-001', '2026-08-07', 'USD', 10813.45, 801.00, 'Pending', '/uploads/invoices/INV26-001.pdf', NULL);

-- Invoice_Detail (3 rows)
INSERT INTO Invoice_Detail (InvoiceDetailID, InvoiceID, PODetailID, MaterialID, InvoicedQty, UnitPrice, TaxAmount, LineAmount) VALUES (1, 'INV26-001', 1, 'MAT002', 1195, 4.15, 396.74, 4959.25);
INSERT INTO Invoice_Detail (InvoiceDetailID, InvoiceID, PODetailID, MaterialID, InvoicedQty, UnitPrice, TaxAmount, LineAmount) VALUES (2, 'INV26-001', 2, 'MAT003', 1200, 2.80, 268.80, 3360.00);
INSERT INTO Invoice_Detail (InvoiceDetailID, InvoiceID, PODetailID, MaterialID, InvoicedQty, UnitPrice, TaxAmount, LineAmount) VALUES (3, 'INV26-001', 3, 'MAT006', 4980, 0.34, 135.46, 1693.20);

-- No Payment record yet: INV26-001 is Pending verification due to open Discrepancy_Ticket TCK001/TCK002

-- Audit_Log (10 rows)
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD001', 'EMP001', 'Create', 'Purchase_Requisition', 'PR26-001', NULL, '{"Status":"Draft"}', '2026-07-10 09:05:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD002', 'EMP001', 'Update', 'Purchase_Requisition', 'PR26-001', '{"Status":"Draft"}', '{"Status":"Submitted"}', '2026-07-11 14:20:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD003', 'EMP003', 'Update', 'Purchase_Requisition', 'PR26-001', '{"Status":"Submitted"}', '{"Status":"Processed"}', '2026-07-14 10:00:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD004', 'EMP005', 'Update', 'Quotation', 'QT26-001', '{"Status":"Pending"}', '{"Status":"Accepted"}', '2026-07-22 16:45:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD005', 'EMP005', 'Create', 'Purchase_Order', 'PO26-001', NULL, '{"Status":"Pending Approval"}', '2026-07-23 09:30:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD006', 'EMP006', 'Update', 'Purchase_Order', 'PO26-001', '{"Status":"Pending Approval"}', '{"Status":"Approved"}', '2026-07-24 10:15:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD007', 'EMP008', 'Create', 'Goods_Receipt', 'GR001', NULL, '{"Status":"Partially Accepted"}', '2026-08-06 10:50:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD008', 'EMP008', 'Create', 'Discrepancy_Ticket', 'TCK001', NULL, '{"Status":"Open"}', '2026-08-06 11:00:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD009', 'EMP013', 'Create', 'Employee', 'EMP015', NULL, '{"Status":"Active","RoleID":"R01"}', '2026-07-01 08:00:00');
INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp) VALUES ('AUD010', 'EMP012', 'Update', 'Invoice', 'INV26-001', '{"Status":"Pending"}', '{"Status":"Pending"}', '2026-08-08 13:25:00');

SET FOREIGN_KEY_CHECKS = 1;