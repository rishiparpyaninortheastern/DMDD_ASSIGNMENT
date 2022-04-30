 
--RegionCodes table
--RegionCodes table is a static table that maintains the code for each region type, its description and timezone.

/* Attributes	Data Types and Size	Comments
RegCd	Varchar(30)	Not Null
Desc1	Varchar(30)	Not Null
Timezone	Varchar(30)	Not Null
 */
CREATE TABLE REGIONCODES 
(
  REGCD VARCHAR2(30) primary key NOT NULL 
, DESC1 VARCHAR2(30) NOT NULL 
, TIMEZONE VARCHAR2(30) NOT NULL 
) 

insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('North Saanich', ' open architecture', 'America/Vancouver');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Springfield', 'didactic archive', 'America/New_York');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Ḩabūr', 'customer loyalty', 'Asia/Aden');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Wangcun', 'knowledge base', 'Asia/Chongqing');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Yidao', 'orchestration', 'Asia/Shanghai');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Shancheng', ' exuding attitude', 'Asia/Chongqing');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Sendung', 'oriented leverage', 'Asia/Jakarta');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Kombolcha', 'transitional utilisation', 'Africa/Addis_Ababa');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Embarcación', 'defect paradigm', 'America/Argentina/Salta');
insert into RegionCodes (REGCD , DESC1, TIMEZONE) values ('Campoalegre', 'Future-proofed ', 'America/Bogota');

--SecurityTypes table
--SecurityTypes table contains attributes that maintain the type of security and company’s security type description.

/* Attributes	Data Types and Size	Comments
SecType	Varchar(30)	Not Null
SecType_Desc	Varchar(30)	Not Null */
CREATE TABLE SecurityTypes  
(
  SecType VARCHAR2(30)  NOT NULL 
, SecType_Desc VARCHAR2(30) NOT NULL 
) 

insert into SecurityTypes (SecType, SecType_Desc) values ('Technology', 'Finance');
insert into SecurityTypes (SecType, SecType_Desc) values ('Finance', 'Consumer Services');
insert into SecurityTypes (SecType, SecType_Desc) values ('Health Care', 'Technology');
insert into SecurityTypes (SecType, SecType_Desc) values ('Finance', 'n/a');
insert into SecurityTypes (SecType, SecType_Desc) values ('Consumer Services', 'Consumer Services');
insert into SecurityTypes (SecType, SecType_Desc) values ('Health Care', 'n/a');
insert into SecurityTypes (SecType, SecType_Desc) values ('Consumer Services', 'n/a');
insert into SecurityTypes (SecType, SecType_Desc) values ('Miscellaneous', 'Consumer Services');
insert into SecurityTypes (SecType, SecType_Desc) values ('n/a', 'n/a');
insert into SecurityTypes (SecType, SecType_Desc) values ('n/a', 'Energy');

--Address table
--Address table contains attributes that maintain the entire address information for each Customer and Company.

/* Attributes	Data Types and Size	Comments
CountryCd	VarChar	Primary key
CountryName	VarChar	Unique Key,Not Null
RegionCode	VarChar	Not Null */
CREATE TABLE Address  
(
  CountryCd VARCHAR2(30) Primary key  NOT NULL 
, CountryName VARCHAR2(30) Unique  NOT NULL 
, RegionCode VARCHAR2(30)  NOT NULL
) 

insert into Address (CountryCd, CountryName	, RegionCode) values ('CN', 'China', 'Lincheng');
insert into Address (CountryCd, CountryName	, RegionCode) values ('ID', 'Indonesia', 'Sukamaju Kidul');
insert into Address (CountryCd, CountryName	, RegionCode) values ('US', 'United States', 'Dallas');
insert into Address (CountryCd, CountryName	, RegionCode) values ('RU', 'Russia', 'Uptar');
insert into Address (CountryCd, CountryName	, RegionCode) values ('IL', 'Israel', 'Kafir Yasif');
insert into Address (CountryCd, CountryName	, RegionCode) values ('KZ', 'Kazakhstan', 'Ekibastuz');
insert into Address (CountryCd, CountryName	, RegionCode) values ('VN', 'Vietnam', 'Cầu Giấy');
insert into Address (CountryCd, CountryName	, RegionCode) values ('PL', 'Poland', 'Jasieniec');
insert into Address (CountryCd, CountryName	, RegionCode) values ('FR', 'France', 'Tulle');
insert into Address (CountryCd, CountryName	, RegionCode) values ('EG', 'Egypt', 'Al Wāsiţah');

--CustomerHoldings table
--The CustomerHoldings table contains the attributes which maintain information about the number of shares each customer holds at present.

/* Attributes	Data Types and Size	Comments
HoldingId	Number	Primary key,Auto Generated
SecurityId	Number	Foreign Key,Not Null
Qty	Varchar(30)	Unique Key,Not Null
CustomerId	Number	Foreign Key,Not Null
CompanyId	Number	Not Null
AsOfDate	Date	Date
 */
CREATE SEQUENCE seq_users
  START WITH 10000
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  CACHE 20
  NOCYCLE;

create table CustomerHoldings(
  HoldingId NUMBER DEFAULT seq_users.nextval PRIMARY KEY,
  SecurityId  Number  references Securities(SecurityId) NOT NULL,
  Qty	Varchar(30)	Unique  Not Null,
  CustomerId	Number	 references Customer(CustomerId) Not Null,
  CompanyId	Number	Not Null,
  AsOfDate  date )

insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 37, 'pede ullamcorper', 92, 100, '7/11/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 11, 'interdum mauris non', 18, 51, '4/16/2022');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 97, 'tortor quis', 12, 93, '6/11/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 15, 'eu pede', 18, 57, '5/14/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 30, 'nulla', 23, 8, '10/2/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval,18, 'nonummy', 3, 13, '12/11/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 72, 'ut blandit non interdum', 28, 59, '4/12/2022');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 72, 'suspendisse potenti nullam', 84, 57, '12/27/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval, 80, 'morbi', 86, 22, '12/1/2021');
insert into SecurityTypes (HoldingId, SecurityId, Qty	, CustomerId, CompanyId, AsOfDate) values (seq_users.nextval,, 81, 'vulputate justo in', 11, 60, '10/10/2021');


