CREATE TABLE DIM_CHARGE_CATEG_SQL_IN1542(
Charge_categ_Key	int	   identity(1,1) primary key         ,       
CHARGE_CATEG_ID	int	              NOT NULL  ,         
TENANT_ORG_ID	int               NOT NULL  ,       
CHARGE_CATEG	varchar(50)	      NOT NULL  ,       
CHARGE_CATEG_DESC	varchar(50)	  NOT NULL  ,       
TAX_IND	int	                      NOT NULL,       
VERSION INT
        ) ;	
		




CREATE TABLE DIM_CUST_SQL_IN1542(

cust_key	int    identity(1,1) primary key            ,
CUST_ID	int               NOT NULL     ,
TENANT_ORG_ID	int       NOT NULL     ,
CUST_TYPE_ID	int       NOT NULL     ,
NICKNAME	varchar(50)   NOT NULL     ,
SALUTE	varchar(50)       NOT NULL     ,
MIDDLE_NM	varchar(50)   NOT NULL     ,
CUST_TITLE	varchar(50)   NOT NULL     ,
SUFFIX	varchar(50)       NOT NULL     ,
WM_EMPLOYEE_ID	int       NOT NULL     ,
CRE_DT	date              NOT NULL     ,
CRE_USER	varchar(50)   NOT NULL     ,
UPD_TS	datetime          NOT NULL     ,
UPD_USER	varchar(50)   NOT NULL     ,
Start_Date	datetime      NOT NULL     ,
End_Date	datetime      NOT NULL     ,
SIGNUP_TS	datetime      NOT NULL     ,
REALM_ID	varchar(50)   NOT NULL     ,
							   
VALID_CUST_IND	varchar(50)    ,
DELTD_YN	varchar(50)   )    ; 
					
CREATE TABLE dim_CUST_ACCT_SQL_IN1542
(
cust_acct_key  int identity(1,1) primary key	NOT NULL	,	
ACCT_ID  bigint  NOT NULL			,
CUST_ID  int  NOT NULL			    ,
TENANT_ORG_ID  int  NOT NULL		,
ACCT_STS_ID  int  NOT NULL			,
ACCT_TYPE_ID  int  NOT NULL			,
EMAIL  varchar(250)  NOT NULL		,
VALID_CUST_IND  INT  NOT NULL		,
CRE_DT  date  NOT NULL			    ,
CRE_USER  varchar(250)  NOT NULL	,	
UPD_TS  datetime  NOT NULL			,
UPD_USER  varchar(250)  NOT NULL	,	
Start_Date  datetime  NOT NULL		,
End_Date  datetime  NOT NULL		,
DELTD_YN  char(1)  NOT NULL			
)

create table dim_cust_address_SQL_IN1542
(
cust_addr_key  int identity(1,1) primary key	NOT NULL			    ,	
ADDR_ID  float  NOT NULL				    ,
TENANT_ORG_ID  int  NOT NULL				,
DATA_SRC_ID  int  NOT NULL				    ,
VALID_TS  datetime  NOT NULL				,
VALID_STS  varchar  NOT NULL				,
CITY  nvarchar(255)  NOT NULL				,
MUNICIPALITY  nvarchar(255)  NOT NULL		,
TOWN  nvarchar(255)  NOT NULL				,
VILLAGE  nvarchar(255)  NOT NULL			,
COUNTY  nvarchar(255)  NOT NULL				,
DISTRICT  nvarchar(255)  NOT NULL			,
ZIP_CD  int  NOT NULL				        ,
POSTAL_CD  int  NOT NULL				    ,
ZIP_EXTN  int  NOT NULL				        ,
ADDR_TYPE  nvarchar(255)  NOT NULL			,
AREA  nvarchar(255)  NOT NULL				,
CNTRY_CD  nvarchar(255)  NOT NULL			,
STATE_PRVNCE_TYPE  nvarchar(255)  NOT NULL	,
OWNER_ID  int  NOT NULL				        ,
PARENT_ID  int  NOT NULL				    ,
DELTD_YN  char(1)  NOT NULL				    ,
Start_Date  datetime  NOT NULL				,
End_Date  datetime  NOT NULL				,
CRE_DT  date  NOT NULL				        ,
CRE_USER  nvarchar(255)  NOT NULL			,
UPD_TS  datetime  NOT NULL				    ,
UPD_USER  nvarchar(255)  NOT NULL	)


CREATE TABLE dim_cust_addr_zone_SQL_IN1542(

addr_zone_id_key  int identity(1,1) primary key	NOT NULL	,
ADDR_ZONE_ID  int  NOT NULL			,
TENANT_ORG_ID  int  NOT NULL		,
DATA_SRC_ID  int  NOT NULL			,
CITY  varchar(50)  NOT NULL			,
POSTAL_CD  varchar(50)  NOT NULL	,
STATE  varchar(50)  NOT NULL		,
DELTD_YN  varchar(50)  NOT NULL		,
CRE_USER  varchar(50)  NOT NULL		,
CRE_DT  date  NOT NULL			    ,
UPD_USER  varchar(50)  NOT NULL		,
UPD_TS  datetime  NOT NULL		)

create table
dim_cust_addr1_sql_IN1542(


cust_aadr1_key  int identity(1,1) primary key	NOT NULL		   ,	
ADDR_ID  bigint  NOT NULL				   ,
TENANT_ORG_ID  int  NOT NULL				,
DATA_SRC_ID  int  NOT NULL				   ,
VALID_TS  nvarchar(255)  NOT NULL			,
VALID_STS  int  NOT NULL				   ,
CITY  nvarchar(255)  NOT NULL				,
MUNICIPALITY  nvarchar(255)  NOT NULL		,
TOWN  nvarchar(255)  NOT NULL				,
VILLAGE  nvarchar(255)  NOT NULL			,
COUNTY  nvarchar(255)  NOT NULL				,
DISTRICT  nvarchar(255)  NOT NULL			,
ZIP_CD  int  NOT NULL				       ,
POSTAL_CD  nvarchar(255)  NOT NULL			,
ZIP_EXTN  nvarchar(255)  NOT NULL			,
ADDR_TYPE  nvarchar(255)  NOT NULL			,
AREA  nvarchar(255)  NOT NULL				,
CNTRY_CD  nvarchar(255)  NOT NULL			,
STATE_PRVNCE_TYPE  nvarchar(255)  NOT NULL	,	
OWNER_ID  int  NOT NULL				       ,
PARENT_ID  int  NOT NULL				   ,
DELTD_YN  nvarchar(255)  NOT NULL			,

CRE_DT  date  NOT NULL				       ,
CRE_USER  nvarchar(255)  NOT NULL			)


create table DIM_CUST_CNTCT_SQL_IN1542(
CUST_CNTCT_KEY  int identity(1,1) primary key	NOT NULL			,
CNTCT_ID  int  NOT NULL						,
TENANT_ORG_ID  int  NOT NULL				,
SRC_CNTCT_ID  varchar(50)  NOT NULL			,	
DATA_SRC_ID  int  NOT NULL					,
ACCT_ID  int  NOT NULL						,
ADDR_ID  int  NOT NULL						,
PHONE_ID  int  NOT NULL						,
EMAIL_ID  varchar(250)  NOT NULL			,	
ADDR_ZONE_ID  int  NOT NULL					,
DELTD_YN  char(1)  NOT NULL					,
CRE_DT  Date  NOT NULL						,
UPD_TS  nvarchar(255)  NOT NULL				,
cust_addr_zone_key  int  NOT NULL			,	
cust_phone_key  int  NOT NULL				,
Cust_email_key  int  NOT NULL				,
ciust_accnt_key  int  NOT NULL				

)

create table DIM_CUST_EMAIL_SQL_IN1542(

Cust_email_key  int identity(1,1) primary key	NOT NULL	,	
EMAIL_ID  bigint  NOT NULL									,
TENANT_ORG_ID  int  NOT NULL								,
CNTCT_TYPE_ID  int  NOT NULL								,
DATA_SRC_ID  int  NOT NULL									,
DELTD_YN  varchar  NOT NULL									,
CRE_DT  Date  NOT NULL										,
UPD_TS  Date  NOT NULL										)

CREATE TABLE DIM_CUST_PHONE_SQL_IN1542(
Cust_phone_key  int identity(1,1) primary key	NOT NULL,		
PHONE_ID  bigint  NOT NULL			                ,
TENANT_ORG_ID  int  NOT NULL						,
CNTCT_TYPE_ID  bigint  NOT NULL						,
SRC_PHONE_ID  varchar(50)  NOT NULL					,
DATA_SRC_ID  int  NOT NULL							,
AREA_CD  varchar(50)  NOT NULL						,
CNTRY_CD  varchar(50)  NOT NULL						,
EXTN  varchar(50)  NOT NULL							,
CRE_DT  Date  NOT NULL								,
DELTD_YN  varchar(50)  NOT NULL						,
UPD_TS  DateTime  NOT NULL							
			
			
			)

CREATE TABLE  Dim_FULFMT_TYPE_LKP_SQL_IN1542(
FULFMT_TYPE_KEY  int identity(1,1) primary key	NOT NULL,				
FULFMT_TYPE_ID  INT  NOT NULL			,		
FULFMT_TYPE_CD  VARCHAR(50)  NOT NULL		,			
FULFMT_TYPE_DESC  VARCHAR (50) NOT NULL		,			
CRE_DT  DATE  NOT NULL				,	
UPD_TS  Nvarchar(255)  NOT NULL	)				

-------------------------------------------------------------------------------
CREATE TABLE Dim_OFFR_SQL_IN1542(                 
OFFER_PK   VARCHAR(50)  NOT NULL			   ,
CATLG_ITEM_ID   bigint PRIMARY KEY NOT NULL 		   ,
SRC_ORG_CD   bigint  NOT NULL			   ,
TENANT_ORG_ID   bigint  NOT NULL		   ,
SRC_ITEM_KEY   bigint  NOT NULL			   ,
UPC   VARCHAR(50)  NOT NULL					   ,
WM_ITEM_NUM   int  NOT NULL				   ,
WM_UPC   VARCHAR(50)  NOT NULL				   ,
OFFR_NM   VARCHAR(50)  NOT NULL				   ,
OFFR_START_TS   Nvarchar(50)  NOT NULL	   ,
OFFR_START_DT   DATETIME  NOT NULL		   ,
OFFR_END_TS   DATETIME  NOT NULL		   ,
OFFR_TYPE_ID   VARCHAR(50) NOT NULL		   ,
COMM_PCT   DECIMAL(25,18)  NOT NULL			   ,
SLR_OFFR_ID   VARCHAR(50) NOT NULL			   ,
PRTNR_ID   VARCHAR(50)  NOT NULL			   ,
START_PRICE   DECIMAL(25,18)  NOT NULL			   ,
LAST_PRICE_UPD_TS   DATETIME  NOT NULL	   ,
CURR_PRICE   DECIMAL(25,18)  NOT NULL			   ,
CURR_SUGG_PRICE   DECIMAL(25,18)  NOT NULL		   ,
BASE_ITEM_PRICE   DECIMAL(25,18)  NOT NULL		   ,
BASE_SUGG_PRICE   DECIMAL (25,18) NOT NULL		   ,
UOM   VARCHAR(50)  NOT NULL					   ,
TAXABLE_IND   int  NOT NULL				   ,
GIFT_WRAP_IND   int  NOT NULL			   ,
SHIP_ALONE_IND   int  NOT NULL			   ,
FREE_RETURNS_IND   int  NOT NULL		   ,
SLR_UPC   VARCHAR(50)  NOT NULL				   ,
SHIPTOSTORE_IND   int  NOT NULL			   ,
PIP_IND   int  NOT NULL					   ,
PRE_ORDER_IND   int  NOT NULL			   ,
CRE_DT   DATE  NOT NULL					   ,
UPD_TS   DATETIME  NOT NULL				   ,
prod_key   int   NOT NULL				   ,
OFFR_KEY   	 int identity(1,1) NOT NULL	   ,
										   
		)	
	

CREATE TABLE Dim_ORDER_STS_MASTER_LKP_SQL_IN1542(
ORDER_STS_MASTER_LKP_KEY   int identity(1,1) primary key	NOT NULL,
ORDER_STS_MASTER_ID  bigint  NOT NULL			,	
ORDER_STS_MASTER_CD  VARCHAR (50) NOT NULL			,	
ORDER_STS_SHORT_DESC  VARCHAR (50) NOT NULL			,	
ORDER_STS_LONG_DESC  VARCHAR (50) NOT NULL			,	
CRE_TS  DATETIME  NOT NULL						,
UPD_TS  DATETIME  NOT NULL						,
		
)

CREATE TABLE DIM_ORG_BUSINESS_UNIT_SQL_IN1542(              
ORG_ID  varchar(50)  NOT NULL	                    ,       			
SRC_ORG_CD  varchar(50)  NOT NULL					,
ORG_TYPE_ID  INT  NOT NULL						,
ORG_NM  varchar(50)  NOT NULL						,
PARENT_ORG_ID  varchar(50)  NOT NULL				,
PARENT_ORG_NM  varchar(50)  NOT NULL				,
WM_RDC_NUM  varchar(50)  NOT NULL					,
WM_STORE_NUM  varchar(50)  NOT NULL					,
WM_DSTRBTR_NO  varchar(50)  NOT NULL				,
WH_IND  bigint  NOT NULL						,
DSV_IND  bigint  NOT NULL						,
ACTV_IND  bigint  NOT NULL						,
EFF_BEGIN_DT  DATE  NOT NULL					,
EFF_END_DT  DATE  NOT NULL						,
CRE_DT  DATE  NOT NULL							,
Is_Valid_Flag  varchar(50)  NOT NULL				,
UPD_TS  DATETIME  NOT NULL						,

ORG_BUSINESS_UNIT_KEY  	int identity(1,1) primary key	NOT NULL
											
)

CREATE TABLE 
Dim_ORG_TYPE_LKP_SQL_IN1542(
ORG_TYPE_ID  INT  NOT NULL				,
ORG_TYPE_CD  varchar  NOT NULL			,	
ORG_TYPE_DESC  VARCHAR  NOT NULL		,		
ORG_TYPE_NM  VARCHAR  NOT NULL			,	
PARENT_ORG_TYPE_NM  varchar  NOT NULL	,			
PARENT_ORG_TYPE_CD  VARCHAR  NOT NULL	,			
CRE_DT  DATE  NOT NULL					,
CRE_USER  VARCHAR  NOT NULL				,
ORG_TYPE_LKP_KEY  int identity(1,1) primary key	NOT NULL


)
CREATE TABLE
dim_prod_SQL_IN1542(
prod_key   int identity(1,1) primary key	NOT NULL	,		
CATLG_ITEM_ID  integer  NOT NULL						,
PRMRY_DSTRBTR_NM  varchar(20)  NOT NULL						,
PRMRY_VEND_NUM  integer  NOT NULL						,
SRC_IMS_CRE_TS  varchar(50)  NOT NULL						,
SRC_IMS_MODFD_TS  varchar(50)  NOT NULL						,
VEND_PACK_QTY  integer  NOT NULL						,
WHSE_PACK_QTY  integer  NOT NULL						,
CURR_PRICE_MODFD_TS  datetime  NOT NULL					,
AMT_ITEM_COST  decimal(19,6)  NOT NULL						,
AMT_BASE_ITEM_PRICE  decimal(19,6)  NOT NULL					,
AMT_BASE_SUGG_PRICE  decimal(19,6)  NOT NULL					,
AMT_SUGG_PRICE  decimal(19,6)  NOT NULL						,
MIN_ITEM_COST  decimal(19,6)  NOT NULL						,
ORIG_PRICE  decimal(19,6)  NOT NULL							,
ORIG_ITEM_PRICE  decimal(19,6)  NOT NULL						,
PROD_NM  varchar (50) NOT NULL								,
PROD_HT  decimal(19,6)  NOT NULL								,
PROD_WT  decimal(19,6)  NOT NULL								,
PROD_LEN  decimal(19,6)  NOT NULL								,
PROD_WDTH  decimal(19,6)  NOT NULL							,
CRE_DT  date  NOT NULL									,
CRE_USER  varchar(50)  NOT NULL				,
UPD_TS  datetime  NOT NULL				,
UPD_USER  varchar(50)  NOT NULL				
)

CREATE TABLE dim_rpt_hrchy_SQL_IN1542(

prod_rpt_key    int identity(1,1) primary key	NOT NULL,					
PROD_RPT_HRCHY_ASSOC_ID  integer  NOT NULL				,	
CATLG_ITEM_ID  integer  NOT NULL						,
RPT_HRCHY_ID  integer  NOT NULL							,
RH_SUB_CATEG_NM  integer  NOT NULL						,
CURR_IND  INT  NOT NULL									,
EFF_BEGIN_DT  date  NOT NULL							,
EFF_END_DT  date  NOT NULL								,
PRMRY_CATEG_PATH  varchar  NOT NULL						,
CHAR_PRMRY_CATEG_PATH  varchar  NOT NULL				,	
RH_SUB_CATEG_ID  integer  NOT NULL						,
PRMRY_SHELF_ID  integer  NOT NULL						,
RPT_HRCHY_KEY  INTEGER  NOT NULL						,
CRE_DT  date  NOT NULL									,
CRE_USER  varCHAR(50)  NOT NULL									,
UPD_TS  datetime  NOT NULL								,
UPD_USER  varchar(50)  NOT NULL			)				
	

CREATE TABLE dim_rpt_hrchy_SQL_IN1542(
rpt_HRCHY_key  int identity(1,1) primary key	NOT NULL,		
RPT_HRCHY_ID  FLOAT  NOT NULL							 ,
SRC_RPT_HRCHY_ID  FLOAT  NOT NULL						 ,
TENANT_ORG_ID  VARCHAR(255)  NOT NULL						 ,
RPT_HRCHY_PATH  varchar(200)  NOT NULL						 ,
DIV_ID  FLOAT  NOT NULL									 ,
DIV_NM  varchar(200)  NOT NULL								 ,
SUPER_DEPT_ID  FLOAT  NOT NULL							 ,
SUPER_DEPT_NM  varchar(200)  NOT NULL						 ,
DEPT_ID  FLOAT  NOT NULL								 ,
DEPT_NM  varchar(250)  NOT NULL								 ,
CATEG_NM  varchar(200)  NOT NULL								 ,
SUB_CATEG_ID  FLOAT  NOT NULL							 ,
SUB_CATEG_NM  varchar  NOT NULL							 ,
ITEM_CATEG_GROUPING_ID  varchar  NOT NULL				 ,
SRC_CRE_TS  nvarchar(255)  NOT NULL						 ,
SRC_MODFD_TS  nvarchar(255)  NOT NULL					 ,
SRC_HRCHY_MODFD_TS  datetime  NOT NULL					 ,
CATEG_MGR_NM  varchar(200)  NOT NULL							 ,
BUYER_NM  varchar(200)  NOT NULL								 ,
EFF_BEGIN_DT  date  NOT NULL							 ,
EFF_END_DT  date  NOT NULL								 ,
RPT_HRCHY_ID_PATH  varchar(200)  NOT NULL					 ,
CATEG_ID  FLOAT  NOT NULL								 ,
CONSUMABLE_IND  nvarchar(255)  NOT NULL					 ,
CURR_IND  FLOAT  NOT NULL								 ,
CRE_DT  date  NOT NULL									 ,
CRE_USER  nvarchar(255)  NOT NULL						 ,
UPD_TS  datetime  NOT NULL								 ,
UPD_USER  nvarchar(255)  NOT NULL		)

create table dim_RSN_LKP_sql_IN1542(
rsn_key   int identity(1,1) primary key	NOT NULL  ,
RSN_ID  integer  NOT NULL					  ,
TENANT_ORG_ID  integer  NOT NULL				,
DATA_SRC_ID  integer  NOT NULL				  ,
RSN_TYPE_ID  integer  NOT NULL				  ,
RSN_CD  integer  NOT NULL					  ,
SRC_RSN_ID  integer  NOT NULL				  ,
RSN_DESC  varchar(200)  NOT NULL				,
RSN_LONG_DESC  varchar(200)  NOT NULL			,	
CRE_TS  datetime  NOT NULL					  ,
CRE_USER  varchar(50)  NOT NULL				  ,
UPD_TS  datetime  NOT NULL					  ,
UPD_USER  varchar(50)  NOT NULL				  )
)

create table Dim_RSN_TYPE_LKP_sql(
RSN_TYPE_ID  INT  NOT NULL			,
RSN_TYPE_CD  varchar(50)  NOT NULL		,	
RSN_TYPE_DESC  varchar(200)  NOT NULL	,		
CRE_TS  datetime  NOT NULL			,
CRE_USER  varchar(50)  NOT NULL			,
RSN_TYPE_LKP_KEY  int identity(1,1) primary key	NOT NULL)


create table DIM_STS_LKP_sql_IN1542(
STS_LKP_KEY   int identity(1,1) primary key	 ,
STS_ID  INT  NULL				,
STS_MASTER_ID  INT   NULL		,	
TENANT_ORG_ID  INT  NULL		,	
DATA_SRC_ID  INT NULL			,
STS_CD  VARCHAR(50)  NULL			,
SRC_STS_ID  INT   NULL			,
STS_DESC  VARCHAR(50)  NULL			,
STS_LONG_DESC  VARCHAR(50)  NULL	,		
CRE_TS   VARCHAR(50)   NULL			,
UPD_TS   VARCHAR(50)   NULL	)



create table DIM_CUST_ACCT_DETAILS_SQL_IN1542
(
CUST_ACCT_DETAILS_KEY  INT identity(1,1) primary key,
CUST_ID  int  NOT NULL											,
TENANT_ORG_ID  int  NOT NULL									,
CUST_TYPE_ID  int  NOT NULL										,
NICKNAME  varchar(50)  NOT NULL									,
SALUTE  varchar(50)  NOT NULL									,
MIDDLE_NM  varchar(50)  NOT NULL								,
CUST_TITLE  varchar(50)  NOT NULL								,
SUFFIX  varchar(50)  NOT NULL									,
WM_EMPLOYEE_ID  int  NOT NULL									,
CRE_DT  date  NOT NULL											,
CRE_USER  varchar(50)  NOT NULL									,
UPD_TS  datetime  NOT NULL										,
UPD_USER  varchar(50)  NOT NULL									,
SIGNUP_TS  datetime  NOT NULL									,
REALM_ID  varchar(50)  NOT NULL									,
VALID_CUST_IND  varchar(50)  NOT NULL							,
DELTD_YN  varchar(50)  NOT NULL									,
ACCT_ID  bigint  NOT NULL										,
CUST_ID  int  NOT NULL											,
TENANT_ORG_ID  int  NOT NULL									,
ACCT_STS_ID  int  NOT NULL										,
ACCT_TYPE_ID  int  NOT NULL										,
EMAIL  varchar(250)  NOT NULL									,
VALID_CUST_IND  INT  NOT NULL									,
CRE_DT  date  NOT NULL											,
CRE_USER  varchar(250)  NOT NULL								,
UPD_TS  datetime  NOT NULL										,
UPD_USER  varchar(250)  NOT NULL								,
Start_Date  datetime  NOT NULL									,
End_Date  datetime  NOT NULL									,
DELTD_YN  char(1)  NOT NULL							);

													