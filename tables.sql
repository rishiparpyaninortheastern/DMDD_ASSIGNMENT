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
