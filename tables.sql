CREATE TABLE StockInfo(
  StockId NUMBER(10) NOT NULL,
  AsOfDate DATE, UNIQUE,
  MarketVal NUMBER(10),
  QtyAvailable NUMBER(10),
  PRIMARY KEY(StockId)
  );

CREATE TABLE SecurityTypes(
SecType VARCHAR(20) NOT NULL,
SecType_Desc VARCHAR(20) NOT NULL,
PRIMARY KEY (SecType)
);
CREATE TABLE Securities(
CompanyId NUMBER(10) NOT NULL,
SecurityId NUMBER(10) NOT NULL,
StockId NUMBER(10) NOT NULL,
RegCd VARCHAR(10),
SecType VARCHAR(20),
PRIMARY KEY(SecurityId),
FOREIGN KEY(CompanyId) REFERENCES Company(CompanyId),
FOREIGN KEY(StockId) REFERENCES CustomerHoldings(Holding_Id),
FOREIGN KEY(SecType) REFERENCES SecurityTypes(SecType)
);


------------------15/04/22--------------------

CREATE TABLE Stock_Info(
  Stock_Id NUMBER(10) NOT NULL,
  As_Of_Date DATE UNIQUE,
  Market_Val NUMBER(10),
  Qty_Available NUMBER(10),
  PRIMARY KEY(Stock_Id)
);
CREATE TABLE Company_Security(
Company_Id NUMBER(10) NOT NULL,
Security_Id NUMBER(10) NOT NULL,
Stock_Id NUMBER(10) NOT NULL,
Reg_Cd VARCHAR(10),
Sec_Type VARCHAR(20),
PRIMARY KEY(Security_Id),
FOREIGN KEY(Company_Id) REFERENCES Company(Company_Id),
FOREIGN KEY(StockId) REFERENCES CustomerHoldings(Holding_Id),
FOREIGN KEY(Sec_Type) REFERENCES SecurityTypes(Sec_Type)
);

CREATE TABLE Security_Type(
Sec_Type VARCHAR(20) NOT NULL,
Sec_Type_Desc VARCHAR(20) NOT NULL,
PRIMARY KEY (Sec_Type)
);