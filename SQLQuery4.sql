



--1 DIM_CHARGE_CATEG_SQL
CREATE TABLE DIM_CHARGE_CATEG_SQL_IN1542(
Charge_categ_Key	int	   identity(1,1) primary key         ,       
CHARGE_CATEG_ID	int	              NOT NULL  ,         
TENANT_ORG_ID	int               NOT NULL  ,       
CHARGE_CATEG	varchar(50)	      NOT NULL  ,       
CHARGE_CATEG_DESC	varchar(50)	  NOT NULL  ,       
TAX_IND	int	                      NOT NULL,       
VERSION INT
        ) ;	
		
SELECT * FROM DIM_CHARGE_CATEG_SQL_IN1542
 INSERT INTO DIM_CHARGE_CATEG_SQL_IN1542(
 CHARGE_CATEG_ID,TENANT_ORG_ID,CHARGE_CATEG,CHARGE_CATEG_DESC,TAX_IND,VERSION)

 SELECT 
 DISTINCT
 ISNULL(CONVERT(INT,LTRIM(RTRIM(CHARGE_CATEG_ID))),101) AS CHARGE_CATEG_ID ,
 ISNULL(CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))),101)
AS TENANT_ORG_ID,
CASE
when LEN(LTRIM(RTRIM(CHARGE_CATEG)))> 5 then LTRIM(RTRIM(CHARGE_CATEG))
else upper(ltrim(rtrim(charge_categ))) END AS CHARGE_CATEG,
 ltrim(rtrim(charge_categ_desc))  AS CHARGE_CATEG_DESC,
ISNULL(CONVERT(INT,TAX_IND),101) ,1 AS VERSION
FROM [BCMPWMT].[CHARGE_CATEG_LKP]


SELECT * FROM DIM_CHARGE_CATEG_SQL_IN1542

--TESTING----
----row count-------------
select count(*) from DIM_CHARGE_CATEG_SQL_IN1542 ---42

select 
	count(*)
from 
	(SELECT 
		ISNULL(CONVERT(INT,LTRIM(RTRIM(CHARGE_CATEG_ID))),101) AS CHARGE_CATEG_ID ,
		ISNULL(CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))),101) AS TENANT_ORG_ID,
		CASE
			when LEN(LTRIM(RTRIM(CHARGE_CATEG)))> 5 then LTRIM(RTRIM(CHARGE_CATEG))
			else upper(ltrim(rtrim(charge_categ)))
			END AS CHARGE_CATEG,
		ltrim(rtrim(charge_categ_desc))  AS CHARGE_CATEG_DESC,
		ISNULL(CONVERT(INT,TAX_IND),101) as tax,
		1 AS VERSION
	FROM [BCMPWMT].[CHARGE_CATEG_LKP])kkk


	----------------------------------------------











--42
---row count group by ---------------------42
SELECT * FROM 
[BCMPWMT].[CHARGE_CATEG_LKP]
select TENANT_ORG_ID	,count(*) from DIM_CHARGE_CATEG_SQL_in1542 group by TENANT_ORG_ID
select TENANT_ORG_ID	,count(*) 
from 
	(SELECT 
		ISNULL(CONVERT(INT,LTRIM(RTRIM(CHARGE_CATEG_ID))),101) AS CHARGE_CATEG_ID ,
		ISNULL(CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))),101) AS TENANT_ORG_ID,
		CASE
			when LEN(LTRIM(RTRIM(CHARGE_CATEG)))> 5 then LTRIM(RTRIM(CHARGE_CATEG))
			else upper(ltrim(rtrim(charge_categ)))
			END AS CHARGE_CATEG,
		ltrim(rtrim(charge_categ_desc))  AS CHARGE_CATEG_DESC,
		ISNULL(CONVERT(INT,TAX_IND),101) as tax,
		1 AS VERSION
	FROM [BCMPWMT].[CHARGE_CATEG_LKP])kkk




group by TENANT_ORG_ID


---------------------------------------

---------------random record check---- 
select CHARGE_CATEG_ID,charge_categ_desc from DIM_CHARGE_CATEG_SQL_in1542 where charge_categ='vas'
select CHARGE_CATEG_ID,charge_categ_desc   from 

	(SELECT 
		ISNULL(CONVERT(INT,LTRIM(RTRIM(CHARGE_CATEG_ID))),101) AS CHARGE_CATEG_ID ,
		ISNULL(CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))),101) AS TENANT_ORG_ID,
		CASE
			when LEN(LTRIM(RTRIM(CHARGE_CATEG)))> 5 then LTRIM(RTRIM(CHARGE_CATEG))
			else upper(ltrim(rtrim(charge_categ)))
			END AS CHARGE_CATEG,
		ltrim(rtrim(charge_categ_desc))  AS CHARGE_CATEG_DESC,
		ISNULL(CONVERT(INT,TAX_IND),101) as tax,
		1 AS VERSION
	FROM [BCMPWMT].[CHARGE_CATEG_LKP])kkk

	select * from [BCMPWMT].[CHARGE_CATEG_LKP]



where charge_categ='vas'

-------------duplicate check---------------- 0
select CHARGE_CATEG_ID,count(*) 

from DIM_CHARGE_CATEG_SQL_in1542
group by CHARGE_CATEG_ID
having count(*)>1
-------------column level check----------------
select count(*)
from
DIM_CHARGE_CATEG_SQL_IN1542  t left join 

	(SELECT 
		ISNULL(CONVERT(INT,LTRIM(RTRIM(CHARGE_CATEG_ID))),101) AS CHARGE_CATEG_ID ,
		ISNULL(CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))),101) AS TENANT_ORG_ID,
		CASE
			when LEN(LTRIM(RTRIM(CHARGE_CATEG)))> 5 then LTRIM(RTRIM(CHARGE_CATEG))
			else upper(ltrim(rtrim(charge_categ)))
			END AS CHARGE_CATEG,
		ltrim(rtrim(charge_categ_desc))  AS CHARGE_CATEG_DESC,
		ISNULL(CONVERT(INT,TAX_IND),101) as tax,
		1 AS VERSION
	FROM [BCMPWMT].[CHARGE_CATEG_LKP])s
on t.CHARGE_CATEG_ID=s.charge_categ_id
where s.charge_categ_id is null and(

s.CHARGE_CATEG_ID  <>  t.CHARGE_CATEG_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.CHARGE_CATEG  <>  t.CHARGE_CATEG or
s.CHARGE_CATEG_DESC  <>  t.CHARGE_CATEG_DESC 
)





--2 DIM_CUST_SQL
drop table DIM_CUST_SQL_in1542
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
START_DATE  DATE,
END_DATE DATE,
SIGNUP_TS	datetime      NOT NULL     ,
REALM_ID	varchar(50)   NOT NULL     ,
							   
VALID_CUST_IND	varchar(50) NOT NULL    ,
DELTD_YN	varchar(50)   NOT NULL)    ; 

INSERT INTO DIM_CUST_SQL_in1542(CUST_ID,TENANT_ORG_ID,CUST_TYPE_ID,
NICKNAME,SALUTE,MIDDLE_NM,CUST_TITLE,SUFFIX,WM_EMPLOYEE_ID,
CRE_DT,CRE_USER,UPD_TS,UPD_USER,start_date,end_date,
SIGNUP_TS,REALM_ID,	VALID_CUST_IND,DELTD_YN)

SELECT 
IIF(cust_id LIKE 'NULL' OR cust_id IS NULL ,101,(cast(ltrim(rtrim(cust_id)) as int))) AS CUST_ID,
IIF(TENANT_ORG_ID LIKE 'NULL' OR TENANT_ORG_ID IS NULL,101,(cast(ltrim(rtrim(TENANT_ORG_ID)) as int))) AS TENANT_ORG_ID,
IIF(CUST_TYPE_ID LIKE 'NULL' OR CUST_TYPE_ID IS NULL,101,(cast(ltrim(rtrim(CUST_TYPE_ID)) as int))) AS CUST_TYPE_ID,
iif(nickname like'NULL' OR nickname IS NULL ,'N/A',nickname) NICKNAME,
IIF(salute like'NULL' OR salute  IS NULL,'N/A',SUBSTRING(ltrim(rtrim(salute)),1,4) ),
IIF(ltrim(rtrim(middle_nm)) LIKE 'NULL','N/A',middle_nm),
iif(cust_title like 'null' OR CUST_TITLE IS NULL ,'N/A',(REPLACE(ltrim(rtrim(cust_title)),'#',' ')))cust_title,
IIF(suffix LIKE 'NULL' OR suffix IS NULL ,'N/A',SUBSTRING(ltrim(rtrim(suffix)),2,1))suffix, 

IIF(wm_employee_id LIKE 'NULL' OR wm_employee_id IS NULL ,101,(cast(ltrim(rtrim(wm_employee_id)) as int))) AS wm_employee_id,
IIF(cre_dt LIKE 'NULL' OR cre_dt IS NULL ,'01-01-1990',(cast(ltrim(rtrim(cre_dt)) as DATE))) AS cre_dt,
IIF(CRE_user LIKE 'NULL' OR CRE_user IS NULL ,'N/A',ltrim(rtrim(CRE_user)))CRE_user,
FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts,
IIF(UPD_USER LIKE 'NULL' OR UPD_USER IS NULL ,'N/A',ltrim(rtrim(UPD_USER))) AS UPD_USER, 
GETDATE() AS START_DATE,NULL AS END_DATE,
format(IIF(signup_ts LIKE 'NULL' OR signup_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(signup_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS signup_ts,

IIF(realm_id LIKE 'NULL' OR realm_id IS NULL ,'N/A',ltrim(rtrim(realm_id)))realm_id,
IIF(valid_cust_ind LIKE 'NULL' OR valid_cust_ind IS NULL ,'N/A',ltrim(rtrim(valid_cust_ind)))valid_cust_ind,
IIF(DELTD_YN LIKE 'NULL' OR DELTD_YN IS NULL ,'N/A',ltrim(rtrim(DELTD_YN)))DELTD_YN 
FROM
 [BCMPWMT].[CUST]

 select * from DIM_CUST_SQL_in1542
 select 
 FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts from  [BCMPWMT].[CUST]
 ltrim(rtrim(valid_cust_ind)) 
 SELECT 
 upd_ts,FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS  upd_ts
 FROM  [BCMPWMT].[CUST]







 -------------testing----------------
 -------row count-------------
 select count(*) from DIM_CUST_SQL_in1542
 select count(*) from(
 SELECT 
IIF(cust_id LIKE 'NULL' OR cust_id IS NULL ,101,(cast(ltrim(rtrim(cust_id)) as int))) AS CUST_ID,
IIF(TENANT_ORG_ID LIKE 'NULL' OR TENANT_ORG_ID IS NULL,101,(cast(ltrim(rtrim(TENANT_ORG_ID)) as int))) AS TENANT_ORG_ID,
IIF(CUST_TYPE_ID LIKE 'NULL' OR CUST_TYPE_ID IS NULL,101,(cast(ltrim(rtrim(CUST_TYPE_ID)) as int))) AS CUST_TYPE_ID,
iif(nickname like'NULL' OR nickname IS NULL ,'N/A',nickname) NICKNAME,
IIF(salute like'NULL' OR salute  IS NULL,'N/A',SUBSTRING(ltrim(rtrim(salute)),1,4) ),
IIF(ltrim(rtrim(middle_nm)) LIKE 'NULL','N/A',middle_nm),
iif(cust_title like 'null' OR CUST_TITLE IS NULL ,'N/A',(REPLACE(ltrim(rtrim(cust_title)),'#',' ')))cust_title,
IIF(suffix LIKE 'NULL' OR suffix IS NULL ,'N/A',SUBSTRING(ltrim(rtrim(suffix)),2,1))suffix, 

IIF(wm_employee_id LIKE 'NULL' OR wm_employee_id IS NULL ,101,(cast(ltrim(rtrim(wm_employee_id)) as int))) AS wm_employee_id,
IIF(cre_dt LIKE 'NULL' OR cre_dt IS NULL ,'01-01-1990',(cast(ltrim(rtrim(cre_dt)) as DATE))) AS cre_dt,
IIF(CRE_user LIKE 'NULL' OR CRE_user IS NULL ,'N/A',ltrim(rtrim(CRE_user)))CRE_user,
FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts,
IIF(UPD_USER LIKE 'NULL' OR UPD_USER IS NULL ,'N/A',ltrim(rtrim(UPD_USER))) AS UPD_USER, 
GETDATE() AS START_DATE,NULL AS END_DATE,
format(IIF(signup_ts LIKE 'NULL' OR signup_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(signup_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS signup_ts,

IIF(realm_id LIKE 'NULL' OR realm_id IS NULL ,'N/A',ltrim(rtrim(realm_id)))as realm_id,
IIF(valid_cust_ind LIKE 'NULL' OR valid_cust_ind IS NULL ,'N/A',ltrim(rtrim(valid_cust_ind))) as valid_cust_ind,
IIF(DELTD_YN LIKE 'NULL' OR DELTD_YN IS NULL ,'N/A',ltrim(rtrim(DELTD_YN))) as DELTD_YN 
FROM
 [BCMPWMT].[CUST]) 



 ----------row_count_groupby---------------
  select SALUTE,count(*) from DIM_CUST_SQL_in1542 group by SALUTE

  SELECT SALUTE,COUNT(*) FROM(
  SELECT 
IIF(cust_id LIKE 'NULL' OR cust_id IS NULL ,101,(cast(ltrim(rtrim(cust_id)) as int))) AS CUST_ID,
IIF(TENANT_ORG_ID LIKE 'NULL' OR TENANT_ORG_ID IS NULL,101,(cast(ltrim(rtrim(TENANT_ORG_ID)) as int))) AS TENANT_ORG_ID,
IIF(CUST_TYPE_ID LIKE 'NULL' OR CUST_TYPE_ID IS NULL,101,(cast(ltrim(rtrim(CUST_TYPE_ID)) as int))) AS CUST_TYPE_ID,
iif(nickname like'NULL' OR nickname IS NULL ,'N/A',nickname) NICKNAME,
IIF(salute like'NULL' OR salute  IS NULL,'N/A',SUBSTRING(ltrim(rtrim(salute)),1,4) ) SALUTE,
IIF(ltrim(rtrim(middle_nm)) LIKE 'NULL','N/A',middle_nm) MIDDLE_NM,
iif(cust_title like 'null' OR CUST_TITLE IS NULL ,'N/A',(REPLACE(ltrim(rtrim(cust_title)),'#',' ')))cust_title,
IIF(suffix LIKE 'NULL' OR suffix IS NULL ,'N/A',SUBSTRING(ltrim(rtrim(suffix)),2,1))suffix, 

IIF(wm_employee_id LIKE 'NULL' OR wm_employee_id IS NULL ,101,(cast(ltrim(rtrim(wm_employee_id)) as int))) AS wm_employee_id,
IIF(cre_dt LIKE 'NULL' OR cre_dt IS NULL ,'01-01-1990',(cast(ltrim(rtrim(cre_dt)) as DATE))) AS cre_dt,
IIF(CRE_user LIKE 'NULL' OR CRE_user IS NULL ,'N/A',ltrim(rtrim(CRE_user)))CRE_user,
FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts,
IIF(UPD_USER LIKE 'NULL' OR UPD_USER IS NULL ,'N/A',ltrim(rtrim(UPD_USER))) AS UPD_USER, 
GETDATE() AS START_DATE,NULL AS END_DATE,
format(IIF(signup_ts LIKE 'NULL' OR signup_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(signup_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS signup_ts,

IIF(realm_id LIKE 'NULL' OR realm_id IS NULL ,'N/A',ltrim(rtrim(realm_id)))realm_id,
IIF(valid_cust_ind LIKE 'NULL' OR valid_cust_ind IS NULL ,'N/A',ltrim(rtrim(valid_cust_ind)))valid_cust_ind,
IIF(DELTD_YN LIKE 'NULL' OR DELTD_YN IS NULL ,'N/A',ltrim(rtrim(DELTD_YN)))DELTD_YN 
FROM
 [BCMPWMT].[CUST]) SK
GROUP BY SALUTE

 SELECT * FROM [BCMPWMT].[CUST]
 ---DUPLICATE________
  select cust_id,count(*) from DIM_CUST_SQL_in1542 group by cust_id HAVING COUNT(*)>1
  ------RANDOM RECORD CHECK---------
    select salute,wm_employee_id from DIM_CUST_SQL_in1542 WHERE CUST_ID=1987728795

  SELECT salute,wm_employee_id FROM(
  SELECT 
IIF(cust_id LIKE 'NULL' OR cust_id IS NULL ,101,(cast(ltrim(rtrim(cust_id)) as int))) AS CUST_ID,
IIF(TENANT_ORG_ID LIKE 'NULL' OR TENANT_ORG_ID IS NULL,101,(cast(ltrim(rtrim(TENANT_ORG_ID)) as int))) AS TENANT_ORG_ID,
IIF(CUST_TYPE_ID LIKE 'NULL' OR CUST_TYPE_ID IS NULL,101,(cast(ltrim(rtrim(CUST_TYPE_ID)) as int))) AS CUST_TYPE_ID,
iif(nickname like'NULL' OR nickname IS NULL ,'N/A',nickname) NICKNAME,
IIF(salute like'NULL' OR salute  IS NULL,'N/A',SUBSTRING(ltrim(rtrim(salute)),1,4) ) SALUTE,
IIF(ltrim(rtrim(middle_nm)) LIKE 'NULL','N/A',middle_nm) MIDDLE_NM,
iif(cust_title like 'null' OR CUST_TITLE IS NULL ,'N/A',(REPLACE(ltrim(rtrim(cust_title)),'#',' ')))cust_title,
IIF(suffix LIKE 'NULL' OR suffix IS NULL ,'N/A',SUBSTRING(ltrim(rtrim(suffix)),2,1))suffix, 

IIF(wm_employee_id LIKE 'NULL' OR wm_employee_id IS NULL ,101,(cast(ltrim(rtrim(wm_employee_id)) as int))) AS wm_employee_id,
IIF(cre_dt LIKE 'NULL' OR cre_dt IS NULL ,'01-01-1990',(cast(ltrim(rtrim(cre_dt)) as DATE))) AS cre_dt,
IIF(CRE_user LIKE 'NULL' OR CRE_user IS NULL ,'N/A',ltrim(rtrim(CRE_user)))CRE_user,
FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts,
IIF(UPD_USER LIKE 'NULL' OR UPD_USER IS NULL ,'N/A',ltrim(rtrim(UPD_USER))) AS UPD_USER, 
GETDATE() AS START_DATE,NULL AS END_DATE,
format(IIF(signup_ts LIKE 'NULL' OR signup_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(signup_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS signup_ts,

IIF(realm_id LIKE 'NULL' OR realm_id IS NULL ,'N/A',ltrim(rtrim(realm_id)))realm_id,
IIF(valid_cust_ind LIKE 'NULL' OR valid_cust_ind IS NULL ,'N/A',ltrim(rtrim(valid_cust_ind)))valid_cust_ind,
IIF(DELTD_YN LIKE 'NULL' OR DELTD_YN IS NULL ,'N/A',ltrim(rtrim(DELTD_YN)))DELTD_YN 
FROM
 [BCMPWMT].[CUST]) SK
 WHERE CUST_ID=1987728795

 ----------COLUMN LEVEL CHECK----------------
 select * from DIM_CUST_SQL_in1542 T LEFT JOIN(


  SELECT 
IIF(cust_id LIKE 'NULL' OR cust_id IS NULL ,101,(cast(ltrim(rtrim(cust_id)) as int))) AS CUST_ID,
IIF(TENANT_ORG_ID LIKE 'NULL' OR TENANT_ORG_ID IS NULL,101,(cast(ltrim(rtrim(TENANT_ORG_ID)) as int))) AS TENANT_ORG_ID,
IIF(CUST_TYPE_ID LIKE 'NULL' OR CUST_TYPE_ID IS NULL,101,(cast(ltrim(rtrim(CUST_TYPE_ID)) as int))) AS CUST_TYPE_ID,
iif(nickname like'NULL' OR nickname IS NULL ,'N/A',nickname) NICKNAME,
IIF(salute like'NULL' OR salute  IS NULL,'N/A',SUBSTRING(ltrim(rtrim(salute)),1,4) ) SALUTE,
IIF(ltrim(rtrim(middle_nm)) LIKE 'NULL','N/A',middle_nm) MIDDLE_NM,
iif(cust_title like 'null' OR CUST_TITLE IS NULL ,'N/A',(REPLACE(ltrim(rtrim(cust_title)),'#',' ')))cust_title,
IIF(suffix LIKE 'NULL' OR suffix IS NULL ,'N/A',SUBSTRING(ltrim(rtrim(suffix)),2,1))suffix, 

IIF(wm_employee_id LIKE 'NULL' OR wm_employee_id IS NULL ,101,(cast(ltrim(rtrim(wm_employee_id)) as int))) AS wm_employee_id,
IIF(cre_dt LIKE 'NULL' OR cre_dt IS NULL ,'01-01-1990',(cast(ltrim(rtrim(cre_dt)) as DATE))) AS cre_dt,
IIF(CRE_user LIKE 'NULL' OR CRE_user IS NULL ,'N/A',ltrim(rtrim(CRE_user)))CRE_user,
FORMAT(IIF(upd_ts LIKE 'NULL' OR upd_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(upd_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS upd_ts,
IIF(UPD_USER LIKE 'NULL' OR UPD_USER IS NULL ,'N/A',ltrim(rtrim(UPD_USER))) AS UPD_USER, 
GETDATE() AS START_DATE,NULL AS END_DATE,
format(IIF(signup_ts LIKE 'NULL' OR signup_ts IS NULL ,'01-01-1900',(cast(ltrim(rtrim(signup_ts)) as DATETIME))),'MM-dd-yyyy HH:mm:ss') AS signup_ts,

IIF(realm_id LIKE 'NULL' OR realm_id IS NULL ,'N/A',ltrim(rtrim(realm_id)))realm_id,
IIF(valid_cust_ind LIKE 'NULL' OR valid_cust_ind IS NULL ,'N/A',ltrim(rtrim(valid_cust_ind)))valid_cust_ind,
IIF(DELTD_YN LIKE 'NULL' OR DELTD_YN IS NULL ,'N/A',ltrim(rtrim(DELTD_YN)))DELTD_YN 
FROM
 [BCMPWMT].[CUST]) T

ON T.cust_id=S.cust_id

WHERE S.CUST_ID IS NOT NULL
AND ( 
s.CUST_ID  <>  t.CUST_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.CUST_TYPE_ID  <>  t.CUST_TYPE_ID or
s.NICKNAME  <>  t.NICKNAME or
s.SALUTE  <>  t.SALUTE or
s.MIDDLE_NM  <>  t.MIDDLE_NM or
s.CUST_TITLE  <>  t.CUST_TITLE or
s.SUFFIX  <>  t.SUFFIX or
s.WM_EMPLOYEE_ID  <>  t.WM_EMPLOYEE_ID or
s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER or

s.SIGNUP_TS  <>  t.SIGNUP_TS or
s.REALM_ID  <>  t.REALM_ID or

s.VALID_CUST_IND  <>  t.VALID_CUST_IND )






)


 --------------------3---------------------------------------
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
End_Date  datetime NULL		,
DELTD_YN  char(1)  NOT NULL			
)


INSERT INTO dim_CUST_ACCT_SQL_IN1542


select 
IIF(ACCT_ID    IS NULL OR   ACCT_ID is null,101, cast(ltrim(rtrim(acct_id))as bigint)) as ACCT_ID                          ,
IIF(CUST_ID    IS NULL OR   CUST_ID is null,101,cast(ltrim(rtrim(cust_id))as int))as CUST_ID								 ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(ACCT_STS_ID    IS NULL OR   ACCT_STS_ID is null,101,cast(ltrim(rtrim(acct_sts_id))as int))as ACCT_STS_ID				 ,
IIF(ACCT_TYPE_ID    IS NULL OR   ACCT_TYPE_ID is null,101,cast(ltrim(rtrim(acct_type_id))as int))as ACCT_TYPE_ID			 ,
IIF(EMAIL    IS NULL OR   EMAIL is null,'N/A', ltrim(rtrim(email)) )as EMAIL				 ,
IIF(VALID_CUST_IND    IS NULL OR   VALID_CUST_IND is null,101,cast(ltrim(rtrim(valid_cust_ind))as int))as VALID_CUST_IND	 ,
																	
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
GETDATE() AS START_DATE,
NULL AS END_DATE	,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char(1))) as delt_dt
																
from 
[BCMPWMT].[CUST_ACCT]
----ROW_COUNT---------4975
SELECT COUNT(*) FROM dim_CUST_ACCT_SQL_IN1542
SELECT COUNT(*) FROM 
(select 
IIF(ACCT_ID    IS NULL OR   ACCT_ID is null,101, cast(ltrim(rtrim(acct_id))as bigint)) as ACCT_ID                          ,
IIF(CUST_ID    IS NULL OR   CUST_ID is null,101,cast(ltrim(rtrim(cust_id))as int))as CUST_ID								 ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(ACCT_STS_ID    IS NULL OR   ACCT_STS_ID is null,101,cast(ltrim(rtrim(acct_sts_id))as int))as ACCT_STS_ID				 ,
IIF(ACCT_TYPE_ID    IS NULL OR   ACCT_TYPE_ID is null,101,cast(ltrim(rtrim(acct_type_id))as int))as ACCT_TYPE_ID			 ,
IIF(EMAIL    IS NULL OR   EMAIL is null,'N/A',IIF( ltrim(rtrim(email)) LIKE '%@%',ltrim(rtrim(email)),'N/A' )) as EMAIL				 ,
IIF(VALID_CUST_IND    IS NULL OR   VALID_CUST_IND is null,101,cast(ltrim(rtrim(valid_cust_ind))as int))as VALID_CUST_IND	 ,
																	
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
GETDATE() AS START_DATE,
NULL AS END_DATE	
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char(1))) as delt_dt
																
from 
[BCMPWMT].[CUST_ACCT])HJ
----------ROW_COUNT_GROUPBY----------
SELECT * FROM [BCMPWMT].[CUST_ACCT]
SELECT CRE_USER,COUNT(*) FROM dim_CUST_ACCT_SQL_IN1542 GROUP BY CRE_USER
SELECT CRE_USER,COUNT(*) FROM  
(select 
IIF(ACCT_ID    IS NULL OR   ACCT_ID is null,101, cast(ltrim(rtrim(acct_id))as bigint)) as ACCT_ID                          ,
IIF(CUST_ID    IS NULL OR   CUST_ID is null,101,cast(ltrim(rtrim(cust_id))as int))as CUST_ID								 ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(ACCT_STS_ID    IS NULL OR   ACCT_STS_ID is null,101,cast(ltrim(rtrim(acct_sts_id))as int))as ACCT_STS_ID				 ,
IIF(ACCT_TYPE_ID    IS NULL OR   ACCT_TYPE_ID is null,101,cast(ltrim(rtrim(acct_type_id))as int))as ACCT_TYPE_ID			 ,
IIF(EMAIL    IS NULL OR   EMAIL is null,'N/A', ltrim(rtrim(email)) )as EMAIL				 ,
IIF(VALID_CUST_IND    IS NULL OR   VALID_CUST_IND is null,101,cast(ltrim(rtrim(valid_cust_ind))as int))as VALID_CUST_IND	 ,
																	
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
GETDATE() AS START_DATE,
NULL AS END_DATE	
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char(1))) as delt_dt
																
from 
[BCMPWMT].[CUST_ACCT])HJ
GROUP BY CRE_USER
---------------RANDOM_CHECK------------
SELECT EMAIL,UPD_TS   FROM dim_CUST_ACCT_SQL_IN1542 WHERE CUST_ID=68832271
SELECT EMAIL,UPD_TS   FROM 
(select 
IIF(ACCT_ID    IS NULL OR   ACCT_ID is null,101, cast(ltrim(rtrim(acct_id))as bigint)) as ACCT_ID                          ,
IIF(CUST_ID    IS NULL OR   CUST_ID is null,101,cast(ltrim(rtrim(cust_id))as int))as CUST_ID								 ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(ACCT_STS_ID    IS NULL OR   ACCT_STS_ID is null,101,cast(ltrim(rtrim(acct_sts_id))as int))as ACCT_STS_ID				 ,
IIF(ACCT_TYPE_ID    IS NULL OR   ACCT_TYPE_ID is null,101,cast(ltrim(rtrim(acct_type_id))as int))as ACCT_TYPE_ID			 ,
IIF(EMAIL    IS NULL OR   EMAIL is null,'N/A', ltrim(rtrim(email)) )as EMAIL				 ,
IIF(VALID_CUST_IND    IS NULL OR   VALID_CUST_IND is null,101,cast(ltrim(rtrim(valid_cust_ind))as int))as VALID_CUST_IND	 ,
																	
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
GETDATE() AS START_DATE,
NULL AS END_DATE	
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char(1))) as delt_dt
																
from 
[BCMPWMT].[CUST_ACCT])HJ

WHERE CUST_ID=68832271



--------DISTINCT CHECK -------------

SELECT ACCT_ID ,COUNT(*) 
FROM dim_CUST_ACCT_SQL_IN1542 
GROUP BY ACCT_ID 
HAVING COUNT(*)>1
-------------------COLUMN LEVEL CHECK--------------


SELECT * FROM 
dim_CUST_ACCT_SQL_IN1542 T LEFT JOIN 
(select 
IIF(ACCT_ID    IS NULL OR   ACCT_ID is null,101, cast(ltrim(rtrim(acct_id))as bigint)) as ACCT_ID                          ,
IIF(CUST_ID    IS NULL OR   CUST_ID is null,101,cast(ltrim(rtrim(cust_id))as int))as CUST_ID								 ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(ACCT_STS_ID    IS NULL OR   ACCT_STS_ID is null,101,cast(ltrim(rtrim(acct_sts_id))as int))as ACCT_STS_ID				 ,
IIF(ACCT_TYPE_ID    IS NULL OR   ACCT_TYPE_ID is null,101,cast(ltrim(rtrim(acct_type_id))as int))as ACCT_TYPE_ID			 ,
IIF(EMAIL    IS NULL OR   EMAIL is null,'N/A', ltrim(rtrim(email)) )as EMAIL				 ,
IIF(VALID_CUST_IND    IS NULL OR   VALID_CUST_IND is null,101,cast(ltrim(rtrim(valid_cust_ind))as int))as VALID_CUST_IND	 ,
																	
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
GETDATE() AS START_DATE,
NULL AS END_DATE	
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char(1))) as delt_dt
																
from 
[BCMPWMT].[CUST_ACCT])S
ON T.ACCT_ID=S.ACCT_ID
WHERE T.ACCT_ID IS NOT NULL AND(
s.ACCT_ID  <>  t.ACCT_ID or
s.CUST_ID  <>  t.CUST_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.ACCT_STS_ID  <>  t.ACCT_STS_ID or
s.ACCT_TYPE_ID  <>  t.ACCT_TYPE_ID or
s.EMAIL  <>  t.EMAIL or
s.VALID_CUST_IND  <>  t.VALID_CUST_IND or

s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER 
)


-----------------------4--------------------------------------------

/****** Object:  Table [BCMPWMT].[CUST_ADDR]    Script Date: 05-09-2022 19:28:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [BCMPWMT].[CUST_ADDR](
	[F1] [float] NULL,
	[ADDR_ID] [float] NULL,
	[TENANT_ORG_ID] [float] NULL,
	[SRC_ADDR_ID] [float] NULL,
	[DATA_SRC_ID] [float] NULL,
	[VALID_TS] [nvarchar](255) NULL,
	[VALID_STS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[MUNICIPALITY] [nvarchar](255) NULL,
	[TOWN] [nvarchar](255) NULL,
	[VILLAGE] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[DISTRICT] [nvarchar](255) NULL,
	[ZIP_CD] [float] NULL,
	[POSTAL_CD] [nvarchar](255) NULL,
	[ZIP_EXTN] [nvarchar](255) NULL,
	[ADDR_TYPE] [nvarchar](255) NULL,
	[AREA] [nvarchar](255) NULL,
	[CNTRY_CD] [nvarchar](255) NULL,
	[STATE_PRVNCE_TYPE] [nvarchar](255) NULL,
	[OWNER_ID] [nvarchar](255) NULL,
	[PARENT_ID] [nvarchar](255) NULL,
	[DELTD_YN] [nvarchar](255) NULL,
	[SRC_CRE_TS] [nvarchar](255) NULL,
	[SRC_MODFD_TS] [nvarchar](255) NULL,
	[CRE_DT] [datetime] NULL,
	[CRE_USER] [nvarchar](255) NULL,
	[UPD_TS] [nvarchar](255) NULL,
	[UPD_USER] [nvarchar](255) NULL
) ON [PRIMARY]
GO


create table dim_cust_address_SQL_IN1542
(
cust_addr_key  int identity(1,1) primary key	NOT NULL			    ,	
ADDR_ID  float NOT NULL				    ,
TENANT_ORG_ID  int  NOT NULL				,
DATA_SRC_ID  int  NOT NULL				    ,
VALID_TS  datetime  NOT NULL				,
VALID_STS  varchar(200)  NOT NULL				,
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
End_Date  datetime   NULL				,
CRE_DT  date  NOT NULL				        ,
CRE_USER  nvarchar(255)  NOT NULL			,
UPD_TS  datetime  NOT NULL				    ,
UPD_USER  nvarchar(255)  NOT NULL	)

truncate table dim_cust_address_SQL_IN1542 
select zip_cd from dim_cust_address_SQL_IN1542 
SELECT 
*
from
dim_cust_address_SQL_IN1542 

INSERT INTO dim_cust_address_SQL_IN1542 
SELECT 
IIF(Addr_ID is null,101.00, addr_id)as Addr_ID
,IIF(TENANT_ORG_ID    IS NULL,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID	
,IIF(DATA_SRC_ID    IS NULL,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID			
																
,IIF(VALID_TS  is null or valid_ts like '?','01-01-1900',cast(ltrim(rtrim(valid_ts))as datetime))as VALID_TS		
,IIF(VALID_STS  is null or valid_sts like '?', 'N/A',ltrim(rtrim(valid_sts)))as VALID_STS							
,IIF(CITY    IS NULL ,'N/A',ltrim(rtrim(city)))as CITY										
,IIF(MUNICIPALITY   is null or MUNICIPALITY like '?','N/A',ltrim(rtrim(municipality)))as MUNICIPALITY					
,IIF(TOWN  is null or town like '?','N/A',ltrim(rtrim(town)))as TOWN											
,IIF(VILLAGE is null or village like '?','N/A',ltrim(rtrim(village)))as VILLAGE									
,IIF(COUNTY is null or county like '?','N/A',ltrim(rtrim(county)))as COUNTY										
,IIF(DISTRICT is null or district like '?','N/A',ltrim(rtrim(distRict)))as DISTRICT							
,IIF(ZIP_CD    IS NULL OR    zip_cd like '%[a-z+-]%' ,101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD		
,IIF(POSTAL_CD    is null or postal_cd like '?',101,cast(ltrim(rtrim(postal_cd))as int))as POSTAL_CD				
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN like '?',101,cast(ltrim(rtrim(zip_extn))as int))as ZIP_EXTN
,IIF(ADDR_TYPE   is null or addr_type like '?','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE							
,IIF(AREA    is null or area like '?','N/A',ltrim(rtrim(area)))as AREA											
,IIF(CNTRY_CD  LIKE 'null' or cntry_cd is null or cntry_cd like '?','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD							
,IIF(STATE_PRVNCE_TYPE LIKE 'null' or state_prvnce_type like '?','N/A',ltrim(rtrim(state_prvnCe_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID  is null or owner_id like '?',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID						
,IIF(PARENT_ID    is null or parent_id like '?',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID				
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char))as DELTD_YN	
,GETDATE() AS START_DATE
,NULL AS END_DATE													
,IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT	
,IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER				
,IIF(UPD_TS is null or upd_ts like '?','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS					
,IIF(UPD_USER is null or upd_user like '?','N/A',ltrim(rtrim(upd_user)))as UPD_USER									
FROM
[BCMPWMT].[CUST_ADDR]

--------------row count------------5016
select count(*) from  dim_cust_address_SQL_IN1542 
select count(*) from ( 
SELECT 
IIF(Addr_ID is null,101.00, addr_id)as Addr_ID
,IIF(TENANT_ORG_ID    IS NULL,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID	
,IIF(DATA_SRC_ID    IS NULL,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID			
,IIF(VALID_TS  is null or valid_ts like '?','01-01-1900',cast(ltrim(rtrim(valid_ts))as datetime))as VALID_TS		
,IIF(VALID_STS  is null or valid_sts like '?', 'N/A',ltrim(rtrim(valid_sts)))as VALID_STS							
,IIF(CITY    IS NULL ,'N/A',ltrim(rtrim(city)))as CITY										
,IIF(MUNICIPALITY   is null or MUNICIPALITY like '?','N/A',ltrim(rtrim(municipality)))as MUNICIPALITY					
,IIF(TOWN  is null or town like '?','N/A',ltrim(rtrim(town)))as TOWN											
,IIF(VILLAGE is null or village like '?','N/A',ltrim(rtrim(village)))as VILLAGE									
,IIF(COUNTY is null or county like '?','N/A',ltrim(rtrim(county)))as COUNTY										
,IIF(DISTRICT is null or district like '?','N/A',ltrim(rtrim(distRict)))as DISTRICT							
,IIF(ZIP_CD    IS NULL OR    zip_cd like '%[a-z+-]%' ,101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD		
,IIF(POSTAL_CD    is null or postal_cd like '?',101,cast(ltrim(rtrim(postal_cd))as int))as POSTAL_CD				
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN like '?',101,cast(ltrim(rtrim(zip_extn))as int))as ZIP_EXTN
,IIF(ADDR_TYPE   is null or addr_type like '?','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE							
,IIF(AREA    is null or area like '?','N/A',ltrim(rtrim(area)))as AREA											
,IIF(CNTRY_CD  LIKE 'null' or cntry_cd is null or cntry_cd like '?','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD							
,IIF(STATE_PRVNCE_TYPE LIKE 'null' or state_prvnce_type like '?','N/A',ltrim(rtrim(state_prvnCe_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID  is null or owner_id like '?',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID						
,IIF(PARENT_ID    is null or parent_id like '?',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID				
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char))as DELTD_YN	
,GETDATE() AS START_DATE
,NULL AS END_DATE													
,IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT	
,IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER				
,IIF(UPD_TS is null or upd_ts like '?','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS					
,IIF(UPD_USER is null or upd_user like '?','N/A',ltrim(rtrim(upd_user)))as UPD_USER									
FROM
[BCMPWMT].[CUST_ADDR]

)s
select * from [BCMPWMT].[CUST_ADDR]
---------------row count group by-----------------

select CNTRY_CD,count(*) from  dim_cust_address_SQL_IN1542 group by CNTRY_CD
select CNTRY_CD,count(*) from ( 
SELECT 
IIF(Addr_ID is null,101.00, cast(addr_id))as Addr_ID
,IIF(TENANT_ORG_ID    IS NULL,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID	
,IIF(DATA_SRC_ID    IS NULL,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID			
,IIF(VALID_TS  is null or valid_ts like '?','01-01-1900',cast(ltrim(rtrim(valid_ts))as datetime))as VALID_TS		
,IIF(VALID_STS  is null or valid_sts like '?', 'N/A',ltrim(rtrim(valid_sts)))as VALID_STS							
,IIF(CITY    IS NULL ,'N/A',ltrim(rtrim(city)))as CITY										
,IIF(MUNICIPALITY   is null or MUNICIPALITY like '?','N/A',ltrim(rtrim(municipality)))as MUNICIPALITY					
,IIF(TOWN  is null or town like '?','N/A',ltrim(rtrim(town)))as TOWN											
,IIF(VILLAGE is null or village like '?','N/A',ltrim(rtrim(village)))as VILLAGE									
,IIF(COUNTY is null or county like '?','N/A',ltrim(rtrim(county)))as COUNTY										
,IIF(DISTRICT is null or district like '?','N/A',ltrim(rtrim(distRict)))as DISTRICT							
,IIF(ZIP_CD    IS NULL OR    zip_cd like '%[a-z+-]%' ,101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD		
,IIF(POSTAL_CD    is null or postal_cd like '?',101,cast(ltrim(rtrim(postal_cd))as int))as POSTAL_CD				
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN like '?',101,cast(ltrim(rtrim(zip_extn))as int))as ZIP_EXTN
,IIF(ADDR_TYPE   is null or addr_type like '?','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE							
,IIF(AREA    is null or area like '?','N/A',ltrim(rtrim(area)))as AREA											
,IIF(CNTRY_CD  LIKE 'null' or cntry_cd is null or cntry_cd like '?','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD							
,IIF(STATE_PRVNCE_TYPE LIKE 'null' or state_prvnce_type like '?','N/A',ltrim(rtrim(state_prvnCe_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID  is null or owner_id like '?',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID						
,IIF(PARENT_ID    is null or parent_id like '?',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID				
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char))as DELTD_YN	
,GETDATE() AS START_DATE
,NULL AS END_DATE													
,IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT	
,IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER				
,IIF(UPD_TS is null or upd_ts like '?','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS					
,IIF(UPD_USER is null or upd_user like '?','N/A',ltrim(rtrim(upd_user)))as UPD_USER									
FROM
[BCMPWMT].[CUST_ADDR]

)s 
group by CNTRY_CD
--------------duplicate check-------------------
select Addr_ID,count(*) from  dim_cust_address_SQL_IN1542 group by Addr_ID   having count(*)>1

-----------random record check----------------------------------

select CNTRY_CD,city from dim_cust_address_SQL_IN1542 where  city='aiken'
select CNTRY_CD,city  from
(SELECT 
IIF(Addr_ID is null,101.00, addr_id)as Addr_ID
,IIF(TENANT_ORG_ID    IS NULL,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID	
,IIF(DATA_SRC_ID    IS NULL,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID			
,IIF(VALID_TS  is null or valid_ts like '?','01-01-1900',cast(ltrim(rtrim(valid_ts))as datetime))as VALID_TS		
,IIF(VALID_STS  is null or valid_sts like '?', 'N/A',ltrim(rtrim(valid_sts)))as VALID_STS							
,IIF(CITY    IS NULL ,'N/A',ltrim(rtrim(city)))as CITY										
,IIF(MUNICIPALITY   is null or MUNICIPALITY like '?','N/A',ltrim(rtrim(municipality)))as MUNICIPALITY					
,IIF(TOWN  is null or town like '?','N/A',ltrim(rtrim(town)))as TOWN											
,IIF(VILLAGE is null or village like '?','N/A',ltrim(rtrim(village)))as VILLAGE									
,IIF(COUNTY is null or county like '?','N/A',ltrim(rtrim(county)))as COUNTY										
,IIF(DISTRICT is null or district like '?','N/A',ltrim(rtrim(distRict)))as DISTRICT							
,IIF(ZIP_CD    IS NULL OR    zip_cd like '%[a-z+-]%' ,101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD		
,IIF(POSTAL_CD    is null or postal_cd like '?',101,cast(ltrim(rtrim(postal_cd))as int))as POSTAL_CD				
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN like '?',101,cast(ltrim(rtrim(zip_extn))as int))as ZIP_EXTN
,IIF(ADDR_TYPE   is null or addr_type like '?','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE							
,IIF(AREA    is null or area like '?','N/A',ltrim(rtrim(area)))as AREA											
,IIF(CNTRY_CD  LIKE 'null' or cntry_cd is null or cntry_cd like '?','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD							
,IIF(STATE_PRVNCE_TYPE LIKE 'null' or state_prvnce_type like '?','N/A',ltrim(rtrim(state_prvnCe_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID  is null or owner_id like '?',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID						
,IIF(PARENT_ID    is null or parent_id like '?',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID				
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char))as DELTD_YN	
,GETDATE() AS START_DATE
,NULL AS END_DATE													
,IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT	
,IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER				
,IIF(UPD_TS is null or upd_ts like '?','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS					
,IIF(UPD_USER is null or upd_user like '?','N/A',ltrim(rtrim(upd_user)))as UPD_USER									
FROM
[BCMPWMT].[CUST_ADDR]
)s
where  city='aiken'


-----------------------column level check-----------------

select count(*) from dim_cust_address_SQL_IN1542 t
left join
(SELECT 
IIF(Addr_ID is null,101.00, addr_id)as Addr_ID
,IIF(TENANT_ORG_ID    IS NULL,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID	
,IIF(DATA_SRC_ID    IS NULL,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID			
,IIF(VALID_TS  is null or valid_ts like '?','01-01-1900',cast(ltrim(rtrim(valid_ts))as datetime))as VALID_TS		
,IIF(VALID_STS  is null or valid_sts like '?', 'N/A',ltrim(rtrim(valid_sts)))as VALID_STS							
,IIF(CITY    IS NULL ,'N/A',ltrim(rtrim(city)))as CITY										
,IIF(MUNICIPALITY   is null or MUNICIPALITY like '?','N/A',ltrim(rtrim(municipality)))as MUNICIPALITY					
,IIF(TOWN  is null or town like '?','N/A',ltrim(rtrim(town)))as TOWN											
,IIF(VILLAGE is null or village like '?','N/A',ltrim(rtrim(village)))as VILLAGE									
,IIF(COUNTY is null or county like '?','N/A',ltrim(rtrim(county)))as COUNTY										
,IIF(DISTRICT is null or district like '?','N/A',ltrim(rtrim(distRict)))as DISTRICT							
,IIF(ZIP_CD    IS NULL OR    zip_cd like '%[a-z+-]%' ,101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD		
,IIF(POSTAL_CD    is null or postal_cd like '?',101,cast(ltrim(rtrim(postal_cd))as int))as POSTAL_CD				
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN like '?',101,cast(ltrim(rtrim(zip_extn))as int))as ZIP_EXTN
,IIF(ADDR_TYPE   is null or addr_type like '?','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE							
,IIF(AREA    is null or area like '?','N/A',ltrim(rtrim(area)))as AREA											
,IIF(CNTRY_CD  LIKE 'null' or cntry_cd is null or cntry_cd like '?','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD							
,IIF(STATE_PRVNCE_TYPE LIKE 'null' or state_prvnce_type like '?','N/A',ltrim(rtrim(state_prvnCe_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID  is null or owner_id like '?',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID						
,IIF(PARENT_ID    is null or parent_id like '?',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID				
,IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A' ,cast(ltrim(rtrim(deltd_yn))as char))as DELTD_YN	
,GETDATE() AS START_DATE
,NULL AS END_DATE													
,IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT	
,IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER				
,IIF(UPD_TS is null or upd_ts like '?','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS					
,IIF(UPD_USER is null or upd_user like '?','N/A',ltrim(rtrim(upd_user)))as UPD_USER									
FROM
[BCMPWMT].[CUST_ADDR]
)s
on s. addr_id =t.addr_id
where  s.addr_id is not null and (
s.ADDR_ID  <>  t.ADDR_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or

s.VALID_TS  <>  t.VALID_TS or
s.VALID_STS  <>  t.VALID_STS or
s.CITY  <>  t.CITY or
s.MUNICIPALITY  <>  t.MUNICIPALITY or
s.TOWN  <>  t.TOWN or
s.VILLAGE  <>  t.VILLAGE or
s.COUNTY  <>  t.COUNTY or
s.DISTRICT  <>  t.DISTRICT or
s.ZIP_CD  <>  t.ZIP_CD or
s.POSTAL_CD  <>  t.POSTAL_CD or
s.ZIP_EXTN  <>  t.ZIP_EXTN or
s.ADDR_TYPE  <>  t.ADDR_TYPE or
s.AREA  <>  t.AREA or
s.CNTRY_CD  <>  t.CNTRY_CD or
s.STATE_PRVNCE_TYPE  <>  t.STATE_PRVNCE_TYPE or
s.OWNER_ID  <>  t.OWNER_ID or
s.PARENT_ID  <>  t.PARENT_ID or
s.DELTD_YN  <>  t.DELTD_YN or

s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER )


---------------------------------------------------------------------------

=IF(E16="int",101,IF(E16="varchar(250)","'N/A'",IF(E16="date","'01-01-19000'",IF(E16="datetime","'01-01-1900'",IF(E16="char","'N/A'",IF(E16="float",101,IF(E16="varchar","'N/A'",IF(E16="bigint",101,IF(E16="integer",101,"")))))))))




SELECT * FROM 
[BCMPWMT].[CUST_ADDR]
--------------------------------------5--------------------------------------------------------
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
INSERT INTO dim_cust_addr_zone_SQL_IN1542
SELECT
IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID is null,101,cast(ltrim(rtrim(addr_zone_id))as int))as ADDR_ZONE_ID          ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID is null,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID				 ,
IIF(CITY    IS NULL OR   CITY is null,'N/A',ltrim(rtrim(city)))as CITY													 ,
IIF(POSTAL_CD    IS NULL OR   POSTAL_CD is null,'N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD								 ,
IIF(STATE    IS NULL OR   STATE is null,'N/A',ltrim(rtrim(state)))as STATE												 ,
																				 
IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A',cast(ltrim(rtrim(deltd_yn))as varchar))as DELTD_YN					 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 
FROM [BCMPWMT].[CUST_ADDR_ZONE]


------ROW_CHECK---------------30293
SELECT COUNT(*) FROM dim_cust_addr_zone_SQL_IN1542

	SELECT COUNT(*) FROM 
	(SELECT
IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID is null,101,cast(ltrim(rtrim(addr_zone_id))as int))as ADDR_ZONE_ID          ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID is null,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID				 ,
IIF(CITY    IS NULL OR   CITY is null,'N/A',ltrim(rtrim(city)))as CITY													 ,
IIF(POSTAL_CD    IS NULL OR   POSTAL_CD is null,'N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD								 ,
IIF(STATE    IS NULL OR   STATE is null,'N/A',ltrim(rtrim(state)))as STATE												 ,
																				 
IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A',cast(ltrim(rtrim(deltd_yn))as varchar))as DELTD_YN					 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 
FROM [BCMPWMT].[CUST_ADDR_ZONE])S
		-----ROW_COUNT_GROUP_BY--------
		
SELECT TENANT_ORG_ID,COUNT(*) FROM dim_cust_addr_zone_SQL_IN1542 GROUP BY TENANT_ORG_ID

	SELECT TENANT_ORG_ID ,COUNT(*) FROM 
	(SELECT
IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID is null,101,cast(ltrim(rtrim(addr_zone_id))as int))as ADDR_ZONE_ID          ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID is null,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID				 ,
IIF(CITY    IS NULL OR   CITY is null,'N/A',ltrim(rtrim(city)))as CITY													 ,
IIF(POSTAL_CD    IS NULL OR   POSTAL_CD is null,'N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD								 ,
IIF(STATE    IS NULL OR   STATE is null,'N/A',ltrim(rtrim(state)))as STATE												 ,
																				 
IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A',cast(ltrim(rtrim(deltd_yn))as varchar))as DELTD_YN					 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 
FROM [BCMPWMT].[CUST_ADDR_ZONE])S
GROUP BY TENANT_ORG_ID

SELECT * FROM [BCMPWMT].[CUST_ADDR_ZONE]
-----------------RANDOM_CHECK_---------------------

SELECT ADDR_ZONE_ID ,CRE_USER  FROM dim_cust_addr_zone_SQL_IN1542 WHERE ADDR_ZONE_ID=82278121

	SELECT ADDR_ZONE_ID ,CRE_USER   FROM 
	(SELECT
IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID is null,101,cast(ltrim(rtrim(addr_zone_id))as int))as ADDR_ZONE_ID          ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID is null,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID				 ,
IIF(CITY    IS NULL OR   CITY is null,'N/A',ltrim(rtrim(city)))as CITY													 ,
IIF(POSTAL_CD    IS NULL OR   POSTAL_CD is null,'N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD								 ,
IIF(STATE    IS NULL OR   STATE is null,'N/A',ltrim(rtrim(state)))as STATE												 ,
																				 
IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A',cast(ltrim(rtrim(deltd_yn))as varchar))as DELTD_YN					 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 
FROM [BCMPWMT].[CUST_ADDR_ZONE])S
WHERE ADDR_ZONE_ID=82278121
-----------DUPLICATE_CHECK_-------
SELECT ADDR_ZONE_ID ,COUNT(*) FROM dim_cust_addr_zone_SQL_IN1542 GROUP BY ADDR_ZONE_ID  HAVING COUNT(*)>1
-------------COLUMN LEVEL CHECK----------------------
SELECT * FROM dim_cust_addr_zone_SQL_IN1542 T
LEFT JOIN

	(SELECT
IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID is null,101,cast(ltrim(rtrim(addr_zone_id))as int))as ADDR_ZONE_ID          ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID is null,101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID		 ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID is null,101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID				 ,
IIF(CITY    IS NULL OR   CITY is null,'N/A',ltrim(rtrim(city)))as CITY													 ,
IIF(POSTAL_CD    IS NULL OR   POSTAL_CD is null,'N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD								 ,
IIF(STATE    IS NULL OR   STATE is null,'N/A',ltrim(rtrim(state)))as STATE												 ,
																				 
IIF(DELTD_YN    IS NULL OR   DELTD_YN is null,'N/A',cast(ltrim(rtrim(deltd_yn))as varchar))as DELTD_YN					 ,
IIF(CRE_USER    IS NULL OR   CRE_USER is null,'N/A',ltrim(rtrim(cre_user)))as CRE_USER									 ,
IIF(CRE_DT    IS NULL OR   CRE_DT is null,'01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT						 ,
IIF(UPD_USER    IS NULL OR   UPD_USER is null,'N/A',ltrim(rtrim(upd_user)))as UPD_USER									 ,
IIF(UPD_TS    IS NULL OR   UPD_TS is null,'01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS					 
FROM [BCMPWMT].[CUST_ADDR_ZONE] )s
ON T.ADDR_ZONE_ID=S.ADDR_ZONE_ID
WHERE S.ADDR_ZONE_ID is not null AND (
s.ADDR_ZONE_ID  <>  t.ADDR_ZONE_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.CITY  <>  t.CITY or
s.POSTAL_CD  <>  t.POSTAL_CD or
s.STATE  <>  t.STATE or

s.DELTD_YN  <>  t.DELTD_YN or
s.CRE_USER  <>  t.CRE_USER or
s.CRE_DT  <>  t.CRE_DT or
s.UPD_USER  <>  t.UPD_USER or
s.UPD_TS  <>  t.UPD_TS )
----------------------------------------------------------------------------
------------------------------------------6----------------------------------------------------

create table dim_cust_addr1_sql_IN1542(
cust_aadr1_key  int identity(1,1) primary keY,	
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



insert into dim_cust_addr1_sql_IN1542
select 

IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(addr_id))as bigint))as ADDR_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID

,IIF(VALID_TS    IS NULL OR   VALID_TS='null'or valid_ts like '?','N/A',format(convert(date,VALID_TS ),'dd-MMM-yyyy') )as VALID_TS
,IIF(VALID_STS    IS NULL OR   VALID_STS='null' or valid_sts like '?',101,cast(ltrim(rtrim(valid_sts))as int))as VALID_STS
,IIF(CITY    IS NULL OR   CITY='null','N/A',ltrim(rtrim(city)))as CITY
,IIF(MUNICIPALITY    IS NULL OR   MUNICIPALITY='null' or MUNICIPALITY like '?' or (len(MUNICIPALITY)>2 and len(MUNICIPALITY)<8 ),'N/A',( ltrim(rtrim(municipality))))as MUNICIPALITY
,IIF(TOWN    IS NULL OR   TOWN='null' or TOWN like '?','N/A',ltrim(rtrim(town)))as TOWN
,IIF(VILLAGE    IS NULL OR   VILLAGE='null'or  VILLAGE like '?','N/A',ltrim(rtrim(village)))as VILLAGE
,IIF(COUNTY    IS NULL OR   COUNTY='null' or county like '?','N/A',ltrim(rtrim(county)))as COUNTY
,IIF(DISTRICT    IS NULL OR   DISTRICT='null' or district like '?','N/A',ltrim(rtrim(district)))as DISTRICT
,IIF(ZIP_CD    IS NULL OR   ZIP_CD='null',101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD
,IIF(POSTAL_CD    IS NULL OR   POSTAL_CD='null' or postal_cd like '?','N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN='null' or zip_extn like '?','N/A',ltrim(rtrim(zip_extn)))as ZIP_EXTN
,IIF(ADDR_TYPE    IS NULL OR   ADDR_TYPE='null','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE
,IIF(AREA    IS NULL OR   AREA='null' or area like '?','N/A',ltrim(rtrim(area)))as AREA
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD
,IIF(STATE_PRVNCE_TYPE    IS NULL OR   STATE_PRVNCE_TYPE='null' or state_prvnce_type='?','N/A',ltrim(rtrim(state_prvnce_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID    IS NULL or owner_id = '?'  OR   OWNER_ID='null',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID
,IIF(parent_id like '?' or PARENT_ID    IS NULL OR   PARENT_ID='null',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',ltrim(rtrim(deltd_yn)))as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A',ltrim(rtrim(cre_user)))as CRE_USER

from [BCMPWMT].[CUST_ADDR1]





-----row count--------------------5217
select count(*) from dim_cust_addr1_sql_IN1542

select count(*) from(
select 

IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(addr_id))as bigint))as ADDR_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID

,IIF(VALID_TS    IS NULL OR   VALID_TS='null'or valid_ts like '?','N/A',format(convert(date,VALID_TS ),'dd-MMM-yyyy') )as VALID_TS
,IIF(VALID_STS    IS NULL OR   VALID_STS='null' or valid_sts like '?',101,cast(ltrim(rtrim(valid_sts))as int))as VALID_STS
,IIF(CITY    IS NULL OR   CITY='null','N/A',ltrim(rtrim(city)))as CITY
,IIF(MUNICIPALITY    IS NULL OR   MUNICIPALITY='null' or MUNICIPALITY like '?' or (len(MUNICIPALITY)>2 and len(MUNICIPALITY)<8 ),'N/A',( ltrim(rtrim(municipality))))as MUNICIPALITY
,IIF(TOWN    IS NULL OR   TOWN='null' or TOWN like '?','N/A',ltrim(rtrim(town)))as TOWN
,IIF(VILLAGE    IS NULL OR   VILLAGE='null'or  VILLAGE like '?','N/A',ltrim(rtrim(village)))as VILLAGE
,IIF(COUNTY    IS NULL OR   COUNTY='null' or county like '?','N/A',ltrim(rtrim(county)))as COUNTY
,IIF(DISTRICT    IS NULL OR   DISTRICT='null' or district like '?','N/A',ltrim(rtrim(district)))as DISTRICT
,IIF(ZIP_CD    IS NULL OR   ZIP_CD='null',101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD
,IIF(POSTAL_CD    IS NULL OR   POSTAL_CD='null' or postal_cd like '?','N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN='null' or zip_extn like '?','N/A',ltrim(rtrim(zip_extn)))as ZIP_EXTN
,IIF(ADDR_TYPE    IS NULL OR   ADDR_TYPE='null','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE
,IIF(AREA    IS NULL OR   AREA='null' or area like '?','N/A',ltrim(rtrim(area)))as AREA
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD
,IIF(STATE_PRVNCE_TYPE    IS NULL OR   STATE_PRVNCE_TYPE='null' or state_prvnce_type='?','N/A',ltrim(rtrim(state_prvnce_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID    IS NULL or owner_id = '?'  OR   OWNER_ID='null',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID
,IIF(parent_id like '?' or PARENT_ID    IS NULL OR   PARENT_ID='null',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',ltrim(rtrim(deltd_yn)))as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A',ltrim(rtrim(cre_user)))as CRE_USER

from [BCMPWMT].[CUST_ADDR1])s
----------------------------row count group by -------------------------
select CNTRY_CD  ,count(*) from dim_cust_addr1_sql_IN1542 group by CNTRY_CD 


select CNTRY_CD , count(*) from(
select 

IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(addr_id))as bigint))as ADDR_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID

,IIF(VALID_TS    IS NULL OR   VALID_TS='null'or valid_ts like '?','N/A',format(convert(date,VALID_TS ),'dd-MMM-yyyy') )as VALID_TS
,IIF(VALID_STS    IS NULL OR   VALID_STS='null' or valid_sts like '?',101,cast(ltrim(rtrim(valid_sts))as int))as VALID_STS
,IIF(CITY    IS NULL OR   CITY='null','N/A',ltrim(rtrim(city)))as CITY
,IIF(MUNICIPALITY    IS NULL OR   MUNICIPALITY='null' or MUNICIPALITY like '?' or (len(MUNICIPALITY)>2 and len(MUNICIPALITY)<8 ),'N/A',( ltrim(rtrim(municipality))))as MUNICIPALITY
,IIF(TOWN    IS NULL OR   TOWN='null' or TOWN like '?','N/A',ltrim(rtrim(town)))as TOWN
,IIF(VILLAGE    IS NULL OR   VILLAGE='null'or  VILLAGE like '?','N/A',ltrim(rtrim(village)))as VILLAGE
,IIF(COUNTY    IS NULL OR   COUNTY='null' or county like '?','N/A',ltrim(rtrim(county)))as COUNTY
,IIF(DISTRICT    IS NULL OR   DISTRICT='null' or district like '?','N/A',ltrim(rtrim(district)))as DISTRICT
,IIF(ZIP_CD    IS NULL OR   ZIP_CD='null',101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD
,IIF(POSTAL_CD    IS NULL OR   POSTAL_CD='null' or postal_cd like '?','N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN='null' or zip_extn like '?','N/A',ltrim(rtrim(zip_extn)))as ZIP_EXTN
,IIF(ADDR_TYPE    IS NULL OR   ADDR_TYPE='null','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE
,IIF(AREA    IS NULL OR   AREA='null' or area like '?','N/A',ltrim(rtrim(area)))as AREA
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD
,IIF(STATE_PRVNCE_TYPE    IS NULL OR   STATE_PRVNCE_TYPE='null' or state_prvnce_type='?','N/A',ltrim(rtrim(state_prvnce_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID    IS NULL or owner_id = '?'  OR   OWNER_ID='null',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID
,IIF(parent_id like '?' or PARENT_ID    IS NULL OR   PARENT_ID='null',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',ltrim(rtrim(deltd_yn)))as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A',ltrim(rtrim(cre_user)))as CRE_USER

from [BCMPWMT].[CUST_ADDR1])s  group by CNTRY_CD 

--------------------------duplicate------------------

select ADDR_ID    ,count(*) from dim_cust_addr1_sql_IN1542 group by ADDR_ID   having count(*)>1

----------------random record check--------------


select CNTRY_CD  , city from dim_cust_addr1_sql_IN1542 where city='NORTH WALES'


select CNTRY_CD  , city  from(
select 

IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(addr_id))as bigint))as ADDR_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID

,IIF(VALID_TS    IS NULL OR   VALID_TS='null'or valid_ts like '?','N/A',format(convert(date,VALID_TS ),'dd-MMM-yyyy') )as VALID_TS
,IIF(VALID_STS    IS NULL OR   VALID_STS='null' or valid_sts like '?',101,cast(ltrim(rtrim(valid_sts))as int))as VALID_STS
,IIF(CITY    IS NULL OR   CITY='null','N/A',ltrim(rtrim(city)))as CITY
,IIF(MUNICIPALITY    IS NULL OR   MUNICIPALITY='null' or MUNICIPALITY like '?' or (len(MUNICIPALITY)>2 and len(MUNICIPALITY)<8 ),'N/A',( ltrim(rtrim(municipality))))as MUNICIPALITY
,IIF(TOWN    IS NULL OR   TOWN='null' or TOWN like '?','N/A',ltrim(rtrim(town)))as TOWN
,IIF(VILLAGE    IS NULL OR   VILLAGE='null'or  VILLAGE like '?','N/A',ltrim(rtrim(village)))as VILLAGE
,IIF(COUNTY    IS NULL OR   COUNTY='null' or county like '?','N/A',ltrim(rtrim(county)))as COUNTY
,IIF(DISTRICT    IS NULL OR   DISTRICT='null' or district like '?','N/A',ltrim(rtrim(district)))as DISTRICT
,IIF(ZIP_CD    IS NULL OR   ZIP_CD='null',101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD
,IIF(POSTAL_CD    IS NULL OR   POSTAL_CD='null' or postal_cd like '?','N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN='null' or zip_extn like '?','N/A',ltrim(rtrim(zip_extn)))as ZIP_EXTN
,IIF(ADDR_TYPE    IS NULL OR   ADDR_TYPE='null','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE
,IIF(AREA    IS NULL OR   AREA='null' or area like '?','N/A',ltrim(rtrim(area)))as AREA
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD
,IIF(STATE_PRVNCE_TYPE    IS NULL OR   STATE_PRVNCE_TYPE='null' or state_prvnce_type='?','N/A',ltrim(rtrim(state_prvnce_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID    IS NULL or owner_id = '?'  OR   OWNER_ID='null',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID
,IIF(parent_id like '?' or PARENT_ID    IS NULL OR   PARENT_ID='null',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',ltrim(rtrim(deltd_yn)))as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A',ltrim(rtrim(cre_user)))as CRE_USER

from [BCMPWMT].[CUST_ADDR1])s where  city='NORTH WALES'


------------------column level check------------------
select count(*) from dim_cust_addr1_sql_IN1542 t left join(
select 
IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(addr_id))as bigint))as ADDR_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(tenant_org_id))as int))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(data_src_id))as int))as DATA_SRC_ID

,IIF(VALID_TS    IS NULL OR   VALID_TS='null'or valid_ts like '?','N/A',format(convert(date,VALID_TS ),'dd-MMM-yyyy') )as VALID_TS
,IIF(VALID_STS    IS NULL OR   VALID_STS='null' or valid_sts like '?',101,cast(ltrim(rtrim(valid_sts))as int))as VALID_STS
,IIF(CITY    IS NULL OR   CITY='null','N/A',ltrim(rtrim(city)))as CITY
,IIF(MUNICIPALITY    IS NULL OR   MUNICIPALITY='null' or MUNICIPALITY like '?' or (len(MUNICIPALITY)>2 and len(MUNICIPALITY)<8 ),'N/A',( ltrim(rtrim(municipality))))as MUNICIPALITY
,IIF(TOWN    IS NULL OR   TOWN='null' or TOWN like '?','N/A',ltrim(rtrim(town)))as TOWN
,IIF(VILLAGE    IS NULL OR   VILLAGE='null'or  VILLAGE like '?','N/A',ltrim(rtrim(village)))as VILLAGE
,IIF(COUNTY    IS NULL OR   COUNTY='null' or county like '?','N/A',ltrim(rtrim(county)))as COUNTY
,IIF(DISTRICT    IS NULL OR   DISTRICT='null' or district like '?','N/A',ltrim(rtrim(district)))as DISTRICT
,IIF(ZIP_CD    IS NULL OR   ZIP_CD='null',101,cast(ltrim(rtrim(zip_cd))as int))as ZIP_CD
,IIF(POSTAL_CD    IS NULL OR   POSTAL_CD='null' or postal_cd like '?','N/A',ltrim(rtrim(postal_cd)))as POSTAL_CD
,IIF(ZIP_EXTN    IS NULL OR   ZIP_EXTN='null' or zip_extn like '?','N/A',ltrim(rtrim(zip_extn)))as ZIP_EXTN
,IIF(ADDR_TYPE    IS NULL OR   ADDR_TYPE='null','N/A',ltrim(rtrim(addr_type)))as ADDR_TYPE
,IIF(AREA    IS NULL OR   AREA='null' or area like '?','N/A',ltrim(rtrim(area)))as AREA
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(cntry_cd)))as CNTRY_CD
,IIF(STATE_PRVNCE_TYPE    IS NULL OR   STATE_PRVNCE_TYPE='null' or state_prvnce_type='?','N/A',ltrim(rtrim(state_prvnce_type)))as STATE_PRVNCE_TYPE
,IIF(OWNER_ID    IS NULL or owner_id = '?'  OR   OWNER_ID='null',101,cast(ltrim(rtrim(owner_id))as int))as OWNER_ID
,IIF(parent_id like '?' or PARENT_ID    IS NULL OR   PARENT_ID='null',101,cast(ltrim(rtrim(parent_id))as int))as PARENT_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',ltrim(rtrim(deltd_yn)))as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A',ltrim(rtrim(cre_user)))as CRE_USER

from [BCMPWMT].[CUST_ADDR1])s  
on t.ADDR_ID  =s.ADDR_ID 
where s.ADDR_ID is not null and (
s.ADDR_ID  <>  t.ADDR_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.VALID_TS  <>  t.VALID_TS or
s.VALID_STS  <>  t.VALID_STS or
s.CITY  <>  t.CITY or
s.MUNICIPALITY  <>  t.MUNICIPALITY or
s.TOWN  <>  t.TOWN or
s.VILLAGE  <>  t.VILLAGE or
s.COUNTY  <>  t.COUNTY or
s.DISTRICT  <>  t.DISTRICT or
s.ZIP_CD  <>  t.ZIP_CD or
s.POSTAL_CD  <>  t.POSTAL_CD or
s.ZIP_EXTN  <>  t.ZIP_EXTN or
s.ADDR_TYPE  <>  t.ADDR_TYPE or
s.AREA  <>  t.AREA or
s.CNTRY_CD  <>  t.CNTRY_CD or
s.STATE_PRVNCE_TYPE  <>  t.STATE_PRVNCE_TYPE or
s.OWNER_ID  <>  t.OWNER_ID or
s.PARENT_ID  <>  t.PARENT_ID or
s.DELTD_YN  <>  t.DELTD_YN or
s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER 
)


select *
from [BCMPWMT].[CUST_ADDR1]



-----------------------------


select 

VALID_TS 

from [BCMPWMT].[CUST_ADDR1]







---------7---------------------
SELECT * FROM [BCMPWMT].[CUST_CNTCT]

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
)
		

----------------------------------9-----EMAIL------------------------------
SELECT * FROM [BCMPWMT].[CUST_EMAIL]

create table DIM_CUST_EMAIL_SQL_IN1542(

Cust_email_key  int identity(1,1) primary key	NOT NULL	,	
EMAIL_ID  bigint  NOT NULL									,
TENANT_ORG_ID  int  NOT NULL								,
CNTCT_TYPE_ID  int  NOT NULL								,
DATA_SRC_ID  int  NOT NULL									,
DELTD_YN  varchar  NOT NULL									,
CRE_DT  Date  NOT NULL										,
UPD_TS  Date  NOT NULL										)



INSERT INTO DIM_CUST_EMAIL_SQL_IN1542
SELECT 

IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null',101,cast(ltrim(rtrim(EMAIL_ID)) as bigint))as EMAIL_ID                   ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID  ,
IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID  ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  ,
IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as varchar) )as DELTD_YN					  ,
																											
IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date))as CRE_DT					  ,
IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Date))as UPD_TS					  

FROM [BCMPWMT].[CUST_EMAIL]

------------------ROW COUNT------------19574
SELECT COUNT(*) FROM DIM_CUST_EMAIL_SQL_IN1542
SELECT COUNT(*) FROM ( SELECT 

IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null',101,cast(ltrim(rtrim(EMAIL_ID)) as bigint))as EMAIL_ID                   ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID  ,
IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID  ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  ,
IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as varchar) )as DELTD_YN					  ,
																											
IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date))as CRE_DT					  ,
IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Date))as UPD_TS					  

FROM [BCMPWMT].[CUST_EMAIL])S

---------------------ROW COUNT GROUP BY ------------

SELECT CNTCT_TYPE_ID,COUNT(*) FROM DIM_CUST_EMAIL_SQL_IN1542 GROUP BY CNTCT_TYPE_ID
SELECT CNTCT_TYPE_ID,COUNT(*) FROM ( SELECT 

IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null',101,cast(ltrim(rtrim(EMAIL_ID)) as bigint))as EMAIL_ID                   ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID  ,
IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID  ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  ,
IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as varchar) )as DELTD_YN					  ,
																											
IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date))as CRE_DT					  ,
IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Date))as UPD_TS					  

FROM [BCMPWMT].[CUST_EMAIL])S GROUP BY CNTCT_TYPE_ID


---------------------RANDOM CHECK-------------

SELECT EMAIL_ID ,DATA_SRC_ID   FROM DIM_CUST_EMAIL_SQL_IN1542 WHERE EMAIL_ID=26504421
SELECT EMAIL_ID ,DATA_SRC_ID FROM ( SELECT 

IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null',101,cast(ltrim(rtrim(EMAIL_ID)) as bigint))as EMAIL_ID                   ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID  ,
IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID  ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  ,
IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as varchar) )as DELTD_YN					  ,
																											
IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date))as CRE_DT					  ,
IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Date))as UPD_TS					  

FROM [BCMPWMT].[CUST_EMAIL])S

 WHERE EMAIL_ID=26504421
 ---------------------DISTINCT CHECK--------------------

 SELECT EMAIL_ID,COUNT(*) FROM DIM_CUST_EMAIL_SQL_IN1542 GROUP BY EMAIL_ID HAVING COUNT(*)>1

 ----------------COLUMN LEVEL CHECK------------


 SELECT * FROM DIM_CUST_EMAIL_SQL_IN1542  T 
 LEFT JOIN ( SELECT 

IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null',101,cast(ltrim(rtrim(EMAIL_ID)) as bigint))as EMAIL_ID                   ,
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID  ,
IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID  ,
IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  ,
IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as varchar) )as DELTD_YN					  ,
																											
IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date))as CRE_DT					  ,
IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Date))as UPD_TS					  

FROM [BCMPWMT].[CUST_EMAIL])S
ON s.EMAIL_ID = t.EMAIL_ID 
WHERE 
S.EMAIL_ID IS NOT NULL AND (
s.EMAIL_ID  <>  t.EMAIL_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.CNTCT_TYPE_ID  <>  t.CNTCT_TYPE_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.DELTD_YN  <>  t.DELTD_YN or
s.CRE_DT  <>  t.CRE_DT or
s.UPD_TS  <>  t.UPD_TS )

--------------------------------------------PHONE 10---------------------
SELECT * FROM [BCMPWMT].[CUST_PHONE]

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
UPD_TS  DateTime  NOT NULL							)

INSERT INTO DIM_CUST_PHONE_SQL_IN1542 
SELECT 

IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,CONVERT(BIGINT,(ltrim(rtrim(PHONE_ID)))))as PHONE_ID ,                       
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID   
,IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID   
,IIF(SRC_PHONE_ID    IS NULL OR   SRC_PHONE_ID='null','N/A',ltrim(rtrim(Src_phone_id) ))as SRC_PHONE_ID				   
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  
,IIF(AREA_CD    IS NULL OR   AREA_CD='null',101,cast(ltrim(rtrim(AREA_CD))as int))as AREA_CD						   
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(CNTRY_CD)))as CNTRY_CD								
,IIF(EXTN    IS NULL OR   EXTN='null','N/A',ltrim(rtrim(EXTN)))as EXTN											


,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT			
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN		
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Datetime))as UPD_TS			


FROM [BCMPWMT].[CUST_PHONE]
---------ROW COUNT------------------195234
SELECT COUNT(*) FROM  DIM_CUST_PHONE_SQL_IN1542 
SELECT COUNT(*) FROM (SELECT 

IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,CONVERT(BIGINT,(ltrim(rtrim(PHONE_ID)))))as PHONE_ID ,                       
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID   
,IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID   
,IIF(SRC_PHONE_ID    IS NULL OR   SRC_PHONE_ID='null','N/A',ltrim(rtrim(Src_phone_id) ))as SRC_PHONE_ID				   
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  
,IIF(AREA_CD    IS NULL OR   AREA_CD='null',101,cast(ltrim(rtrim(AREA_CD))as int))as AREA_CD						   
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(CNTRY_CD)))as CNTRY_CD								
,IIF(EXTN    IS NULL OR   EXTN='null','N/A',ltrim(rtrim(EXTN)))as EXTN											


,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT			
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN		
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Datetime))as UPD_TS			


FROM [BCMPWMT].[CUST_PHONE]
)S

------------------------ROW COUNT GROUP BY--------------
SELECT TENANT_ORG_ID  ,COUNT(*) FROM  DIM_CUST_PHONE_SQL_IN1542  GROUP BY TENANT_ORG_ID 
SELECT TENANT_ORG_ID  ,COUNT(*) FROM (SELECT 

IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,CONVERT(BIGINT,(ltrim(rtrim(PHONE_ID)))))as PHONE_ID ,                       
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID   
,IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID   
,IIF(SRC_PHONE_ID    IS NULL OR   SRC_PHONE_ID='null','N/A',ltrim(rtrim(Src_phone_id) ))as SRC_PHONE_ID				   
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  
,IIF(AREA_CD    IS NULL OR   AREA_CD='null',101,cast(ltrim(rtrim(AREA_CD))as int))as AREA_CD						   
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(CNTRY_CD)))as CNTRY_CD								
,IIF(EXTN    IS NULL OR   EXTN='null','N/A',ltrim(rtrim(EXTN)))as EXTN											


,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT			
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN		
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Datetime))as UPD_TS			


FROM [BCMPWMT].[CUST_PHONE]
)S GROUP BY TENANT_ORG_ID 

--------------------DUPLICATE CHECK ------
SELECT PHONE_ID ,COUNT(*) FROM  DIM_CUST_PHONE_SQL_IN1542  GROUP BY PHONE_ID HAVING COUNT(*)>1
------------------RANDOM CHECK --------------

SELECT DATA_SRC_ID,AREA_CD  FROM  DIM_CUST_PHONE_SQL_IN1542 WHERE PHONE_ID =30271103
SELECT DATA_SRC_ID,AREA_CD   FROM (SELECT 

IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,CONVERT(BIGINT,(ltrim(rtrim(PHONE_ID)))))as PHONE_ID ,                       
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID   
,IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID   
,IIF(SRC_PHONE_ID    IS NULL OR   SRC_PHONE_ID='null','N/A',ltrim(rtrim(Src_phone_id) ))as SRC_PHONE_ID				   
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  
,IIF(AREA_CD    IS NULL OR   AREA_CD='null',101,cast(ltrim(rtrim(AREA_CD))as int))as AREA_CD						   
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(CNTRY_CD)))as CNTRY_CD								
,IIF(EXTN    IS NULL OR   EXTN='null','N/A',ltrim(rtrim(EXTN)))as EXTN											


,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT			
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN		
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Datetime))as UPD_TS			


FROM [BCMPWMT].[CUST_PHONE]
)S
WHERE  PHONE_ID =30271103
---------------------COLUMN LEVEL CHECK----------------
SELECT * FROM  DIM_CUST_PHONE_SQL_IN1542 T LEFT JOIN (SELECT 

IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,CONVERT(BIGINT,(ltrim(rtrim(PHONE_ID)))))as PHONE_ID ,                       
IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_Org_id)) as int))as TENANT_ORG_ID   
,IIF(CNTCT_TYPE_ID    IS NULL OR   CNTCT_TYPE_ID='null',101,cast(ltrim(rtrim(cntct_type_id)) as int))as CNTCT_TYPE_ID   
,IIF(SRC_PHONE_ID    IS NULL OR   SRC_PHONE_ID='null','N/A',ltrim(rtrim(Src_phone_id) ))as SRC_PHONE_ID				   
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID		  
,IIF(AREA_CD    IS NULL OR   AREA_CD='null',101,cast(ltrim(rtrim(AREA_CD))as int))as AREA_CD						   
,IIF(CNTRY_CD    IS NULL OR   CNTRY_CD='null','N/A',ltrim(rtrim(CNTRY_CD)))as CNTRY_CD								
,IIF(EXTN    IS NULL OR   EXTN='null','N/A',ltrim(rtrim(EXTN)))as EXTN											
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT			
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A',cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN		
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(Upd_ts))as Datetime))as UPD_TS			
FROM [BCMPWMT].[CUST_PHONE]
)S ON T. PHONE_ID =S.PHONE_ID 
WHERE T.PHONE_ID IS NOT NULL AND(
s.PHONE_ID  <>  t.PHONE_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.CNTCT_TYPE_ID  <>  t.CNTCT_TYPE_ID or
s.SRC_PHONE_ID  <>  t.SRC_PHONE_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.AREA_CD  <>  t.AREA_CD or
s.CNTRY_CD  <>  t.CNTRY_CD or
s.EXTN  <>  t.EXTN or
s.CRE_DT  <>  t.CRE_DT or
s.DELTD_YN  <>  t.DELTD_YN or
s.UPD_TS  <>  t.UPD_TS 
)
-------------------------------------11-[BCMPWMT].[FULFMT_TYPE_LKP]-----------------------------------------------
SELECT * FROM [BCMPWMT].[FULFMT_TYPE_LKP]

CREATE TABLE  Dim_FULFMT_TYPE_LKP_SQL_IN1542(
FULFMT_TYPE_KEY  int identity(1,1) 	NOT NULL,				
FULFMT_TYPE_ID  INT PRIMARY	KEY	,		
FULFMT_TYPE_CD  VARCHAR(50)  NOT NULL		,			
FULFMT_TYPE_DESC  VARCHAR (50) NOT NULL		,			
CRE_DT  DATE  NOT NULL				,	
UPD_TS  Nvarchar(255)  NOT NULL	)		



INSERT INTO Dim_FULFMT_TYPE_LKP_SQL_IN1542 


SELECT 
distinct
IIF(FULFMT_TYPE_ID    IS NULL OR   FULFMT_TYPE_ID='null',101,cast(ltrim(rtrim(FULFMT_TYPE_ID)) AS INT))as FULFMT_TYPE_ID
,IIF(FULFMT_TYPE_CD    IS NULL OR   FULFMT_TYPE_CD='null','N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_CD))AS VARCHAR(50)))as FULFMT_TYPE_CD
,IIF(FULFMT_TYPE_DESC    IS NULL OR   FULFMT_TYPE_DESC='null', 'N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_DESC))AS VARCHAR(50)))as FULFMT_TYPE_DESC
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT
,FORMAT(IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS   ))AS DATE)),'MMddyyyy')as UPD_TS
FROM [BCMPWMT].[FULFMT_TYPE_LKP]

--------------row count-----10
select count(*) from Dim_FULFMT_TYPE_LKP_SQL_IN1542 
select count(*) from (  
SELECT 
distinct
IIF(FULFMT_TYPE_ID    IS NULL OR   FULFMT_TYPE_ID='null',101,cast(ltrim(rtrim(FULFMT_TYPE_ID)) AS INT))as FULFMT_TYPE_ID
,IIF(FULFMT_TYPE_CD    IS NULL OR   FULFMT_TYPE_CD='null','N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_CD))AS VARCHAR(50)))as FULFMT_TYPE_CD
,IIF(FULFMT_TYPE_DESC    IS NULL OR   FULFMT_TYPE_DESC='null', 'N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_DESC))AS VARCHAR(50)))as FULFMT_TYPE_DESC
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT
,FORMAT(IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS   ))AS DATE)),'MMddyyyy')as UPD_TS
FROM [BCMPWMT].[FULFMT_TYPE_LKP]
)s
----------row count grou by -------------
select FULFMT_TYPE_DESC ,count(*) from Dim_FULFMT_TYPE_LKP_SQL_IN1542  group by FULFMT_TYPE_DESC 
select FULFMT_TYPE_DESC ,count(*) from (  
SELECT 
distinct
IIF(FULFMT_TYPE_ID    IS NULL OR   FULFMT_TYPE_ID='null',101,cast(ltrim(rtrim(FULFMT_TYPE_ID)) AS INT))as FULFMT_TYPE_ID
,IIF(FULFMT_TYPE_CD    IS NULL OR   FULFMT_TYPE_CD='null','N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_CD))AS VARCHAR(50)))as FULFMT_TYPE_CD
,IIF(FULFMT_TYPE_DESC    IS NULL OR   FULFMT_TYPE_DESC='null', 'N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_DESC))AS VARCHAR(50)))as FULFMT_TYPE_DESC
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT
,FORMAT(IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS   ))AS DATE)),'MMddyyyy')as UPD_TS
FROM [BCMPWMT].[FULFMT_TYPE_LKP])s group by FULFMT_TYPE_DESC 

--------------------------distinct count--------------
select FULFMT_TYPE_DESC ,count(*) from Dim_FULFMT_TYPE_LKP_SQL_IN1542  group by FULFMT_TYPE_DESC 
having count(*)>1
-------------------------random check-----------------------

select FULFMT_TYPE_ID,FULFMT_TYPE_DESC   from Dim_FULFMT_TYPE_LKP_SQL_IN1542  where fulfmt_type_id=8
select FULFMT_TYPE_ID,FULFMT_TYPE_DESC  from (  
SELECT 
distinct
IIF(FULFMT_TYPE_ID    IS NULL OR   FULFMT_TYPE_ID='null',101,cast(ltrim(rtrim(FULFMT_TYPE_ID)) AS INT))as FULFMT_TYPE_ID
,IIF(FULFMT_TYPE_CD    IS NULL OR   FULFMT_TYPE_CD='null','N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_CD))AS VARCHAR(50)))as FULFMT_TYPE_CD
,IIF(FULFMT_TYPE_DESC    IS NULL OR   FULFMT_TYPE_DESC='null', 'N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_DESC))AS VARCHAR(50)))as FULFMT_TYPE_DESC
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT
,FORMAT(IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS   ))AS DATE)),'MMddyyyy')as UPD_TS
FROM [BCMPWMT].[FULFMT_TYPE_LKP])s 
where fulfmt_type_id=8
---------------------column level check----------------
select COUNT(*) from Dim_FULFMT_TYPE_LKP_SQL_IN1542  t
left join(
SELECT 
distinct
IIF(FULFMT_TYPE_ID    IS NULL OR   FULFMT_TYPE_ID='null',101,cast(ltrim(rtrim(FULFMT_TYPE_ID)) AS INT))as FULFMT_TYPE_ID
,IIF(FULFMT_TYPE_CD    IS NULL OR   FULFMT_TYPE_CD='null','N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_CD))AS VARCHAR(50)))as FULFMT_TYPE_CD
,IIF(FULFMT_TYPE_DESC    IS NULL OR   FULFMT_TYPE_DESC='null', 'N/A',CAST(LTRIM(RTRIM(FULFMT_TYPE_DESC))AS VARCHAR(50)))as FULFMT_TYPE_DESC
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT
,FORMAT(IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS   ))AS DATE)),'MMddyyyy')as UPD_TS
FROM [BCMPWMT].[FULFMT_TYPE_LKP])s 
on s.FULFMT_TYPE_ID= t.FULFMT_TYPE_ID
where 
 t.FULFMT_TYPE_ID is not null and (
s.FULFMT_TYPE_ID  <>  t.FULFMT_TYPE_ID or
s.FULFMT_TYPE_CD  <>  t.FULFMT_TYPE_CD or
s.FULFMT_TYPE_DESC  <>  t.FULFMT_TYPE_DESC or
s.CRE_DT  <>  t.CRE_DT or
s.UPD_TS  <>  t.UPD_TS)
-------------------------------------------------------12 offer -----------------

CREATE TABLE Dim_OFFR_SQL_IN1542(  
OFFR_KEY   	 int identity(1,1) NOT NULL	   ,
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
prod_key   int   NOT NULL				

										   
		)	
----------------------------------13 Dim_ORDER_STS_MASTER_LKP_SQL_IN1542----------------------
select * from [BCMPWMT].[ORDER_STS_MASTER_LKP]

CREATE TABLE Dim_ORDER_STS_MASTER_LKP_SQL_IN1542(
ORDER_STS_MASTER_LKP_KEY   int identity(1,1)	NOT NULL,
ORDER_STS_MASTER_ID  bigint   primary key		,	
ORDER_STS_MASTER_CD  VARCHAR (50) NOT NULL			,	
ORDER_STS_SHORT_DESC  VARCHAR (50) NOT NULL			,	
ORDER_STS_LONG_DESC  VARCHAR (50) NOT NULL			,	
CRE_TS  DATETIME  NOT NULL						,
UPD_TS  DATETIME  NOT NULL						,
		
)

insert into   Dim_ORDER_STS_MASTER_LKP_SQL_IN1542

select 
IIF(ORDER_STS_MASTER_ID    IS NULL OR   ORDER_STS_MASTER_ID='null',101,cast(ltrim(rtrim(ORDER_STS_MASTER_ID ))AS bigint))as ORDER_STS_MASTER_ID
,IIF(ORDER_STS_MASTER_CD    IS NULL OR   ORDER_STS_MASTER_CD='null','N/A' ,LTRIM(RTRIM(ORDER_STS_MASTER_CD)))as ORDER_STS_MASTER_CD
,IIF(ORDER_STS_SHORT_DESC    IS NULL OR   ORDER_STS_SHORT_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_SHORT_DESC)))as ORDER_STS_SHORT_DESC
,IIF(ORDER_STS_LONG_DESC    IS NULL OR   ORDER_STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_LONG_DESC)))as ORDER_STS_LONG_DESC

,IIF(CRE_TS    IS NULL OR   CRE_TS='null' ,'01-01-1900',cast(substring(ltrim(rtrim(cre_ts)),1,charindex(' p',cre_ts))as datetime))as CRE_TS

,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(ltrim(rtrim(upd_ts)),1,charindex(' p',upd_ts))as datetime))as UPD_TS
FROM [BCMPWMT].[ORDER_STS_MASTER_LKP]


---------ROW COUNT----------662
SELECT COUNT(*) FROM  Dim_ORDER_STS_MASTER_LKP_SQL_IN1542
SELECT COUNT(*) FROM 
(
select 
IIF(ORDER_STS_MASTER_ID    IS NULL OR   ORDER_STS_MASTER_ID='null',101,cast(ltrim(rtrim(ORDER_STS_MASTER_ID ))AS bigint))as ORDER_STS_MASTER_ID
,IIF(ORDER_STS_MASTER_CD    IS NULL OR   ORDER_STS_MASTER_CD='null','N/A' ,LTRIM(RTRIM(ORDER_STS_MASTER_CD)))as ORDER_STS_MASTER_CD
,IIF(ORDER_STS_SHORT_DESC    IS NULL OR   ORDER_STS_SHORT_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_SHORT_DESC)))as ORDER_STS_SHORT_DESC
,IIF(ORDER_STS_LONG_DESC    IS NULL OR   ORDER_STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_LONG_DESC)))as ORDER_STS_LONG_DESC

,IIF(CRE_TS    IS NULL OR   CRE_TS='null' ,'01-01-1900',cast(substring(ltrim(rtrim(cre_ts)),1,charindex(' p',cre_ts))as datetime))as CRE_TS

,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(ltrim(rtrim(upd_ts)),1,charindex(' p',upd_ts))as datetime))as UPD_TS
FROM [BCMPWMT].[ORDER_STS_MASTER_LKP]


)S


-----------------------row count check group by-----------------
select * from  [BCMPWMT].[ORDER_STS_MASTER_LKP]

SELECT CRE_TS ,COUNT(*) FROM  Dim_ORDER_STS_MASTER_LKP_SQL_IN1542 group by CRE_TS 
SELECT CRE_TS, COUNT(*) FROM 
(
select 
IIF(ORDER_STS_MASTER_ID    IS NULL OR   ORDER_STS_MASTER_ID='null',101,cast(ltrim(rtrim(ORDER_STS_MASTER_ID ))AS bigint))as ORDER_STS_MASTER_ID
,IIF(ORDER_STS_MASTER_CD    IS NULL OR   ORDER_STS_MASTER_CD='null','N/A' ,LTRIM(RTRIM(ORDER_STS_MASTER_CD)))as ORDER_STS_MASTER_CD
,IIF(ORDER_STS_SHORT_DESC    IS NULL OR   ORDER_STS_SHORT_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_SHORT_DESC)))as ORDER_STS_SHORT_DESC
,IIF(ORDER_STS_LONG_DESC    IS NULL OR   ORDER_STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_LONG_DESC)))as ORDER_STS_LONG_DESC

,IIF(CRE_TS    IS NULL OR   CRE_TS='null' ,'01-01-1900',cast(substring(ltrim(rtrim(cre_ts)),1,charindex(' p',cre_ts))as datetime))as CRE_TS

,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(ltrim(rtrim(upd_ts)),1,charindex(' p',upd_ts))as datetime))as UPD_TS
FROM [BCMPWMT].[ORDER_STS_MASTER_LKP]


)S group by CRE_TS 

--------duplicate check---------
SELECT ORDER_STS_MASTER_ID,COUNT(*) FROM  Dim_ORDER_STS_MASTER_LKP_SQL_IN1542 group by ORDER_STS_MASTER_ID
having count(*) >1
-------------random row check----------


SELECT ORDER_STS_MASTER_ID,ORDER_STS_LONG_DESC FROM  Dim_ORDER_STS_MASTER_LKP_SQL_IN1542 where ORDER_STS_MASTER_ID=471
SELECT ORDER_STS_MASTER_ID,ORDER_STS_LONG_DESC FROM 
(
select 
IIF(ORDER_STS_MASTER_ID    IS NULL OR   ORDER_STS_MASTER_ID='null',101,cast(ltrim(rtrim(ORDER_STS_MASTER_ID ))AS bigint))as ORDER_STS_MASTER_ID
,IIF(ORDER_STS_MASTER_CD    IS NULL OR   ORDER_STS_MASTER_CD='null','N/A' ,LTRIM(RTRIM(ORDER_STS_MASTER_CD)))as ORDER_STS_MASTER_CD
,IIF(ORDER_STS_SHORT_DESC    IS NULL OR   ORDER_STS_SHORT_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_SHORT_DESC)))as ORDER_STS_SHORT_DESC
,IIF(ORDER_STS_LONG_DESC    IS NULL OR   ORDER_STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_LONG_DESC)))as ORDER_STS_LONG_DESC

,IIF(CRE_TS    IS NULL OR   CRE_TS='null' ,'01-01-1900',cast(substring(ltrim(rtrim(cre_ts)),1,charindex(' p',cre_ts))as datetime))as CRE_TS

,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(ltrim(rtrim(upd_ts)),1,charindex(' p',upd_ts))as datetime))as UPD_TS
FROM [BCMPWMT].[ORDER_STS_MASTER_LKP]


)S where ORDER_STS_MASTER_ID=471
--------------------column level check up--------------

SELECT count(*) FROM  Dim_ORDER_STS_MASTER_LKP_SQL_IN1542 t left join
(
select 
IIF(ORDER_STS_MASTER_ID    IS NULL OR   ORDER_STS_MASTER_ID='null',101,cast(ltrim(rtrim(ORDER_STS_MASTER_ID ))AS bigint))as ORDER_STS_MASTER_ID
,IIF(ORDER_STS_MASTER_CD    IS NULL OR   ORDER_STS_MASTER_CD='null','N/A' ,LTRIM(RTRIM(ORDER_STS_MASTER_CD)))as ORDER_STS_MASTER_CD
,IIF(ORDER_STS_SHORT_DESC    IS NULL OR   ORDER_STS_SHORT_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_SHORT_DESC)))as ORDER_STS_SHORT_DESC
,IIF(ORDER_STS_LONG_DESC    IS NULL OR   ORDER_STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(ORDER_STS_LONG_DESC)))as ORDER_STS_LONG_DESC

,IIF(CRE_TS    IS NULL OR   CRE_TS='null' ,'01-01-1900',cast(substring(ltrim(rtrim(cre_ts)),1,charindex(' p',cre_ts))as datetime))as CRE_TS

,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(ltrim(rtrim(upd_ts)),1,charindex(' p',upd_ts))as datetime))as UPD_TS
FROM [BCMPWMT].[ORDER_STS_MASTER_LKP]


)S on t.ORDER_STS_MASTER_ID =s.ORDER_STS_MASTER_ID  
where s.ORDER_STS_MASTER_ID   is not null
and(
s.ORDER_STS_MASTER_ID  <>  t.ORDER_STS_MASTER_ID or
s.ORDER_STS_MASTER_CD  <>  t.ORDER_STS_MASTER_CD or
s.ORDER_STS_SHORT_DESC  <>  t.ORDER_STS_SHORT_DESC or
s.ORDER_STS_LONG_DESC  <>  t.ORDER_STS_LONG_DESC or

s.CRE_TS  <>  t.CRE_TS or

s.UPD_TS  <>  t.UPD_TS )


------------------------------------------dim_rpt_hrchy----------------------

drop table dim_rpt_hrchy_SQL_IN1542

CREATE TABLE dim_rpt_hrchy_SQL_IN1542(                  
rpt_HRCHY_key  int identity(1,1) primary key	NOT NULL
,RPT_HRCHY_ID  FLOAT  NOT NULL							
,SRC_RPT_HRCHY_ID  FLOAT  NOT NULL						
,TENANT_ORG_ID  VARCHAR(255)  NOT NULL					
,RPT_HRCHY_PATH  varchar(200)  NOT NULL					
,DIV_ID  FLOAT  NOT NULL									
,DIV_NM  varchar(200)  NOT NULL							
,SUPER_DEPT_ID  FLOAT  NOT NULL							
,SUPER_DEPT_NM  varchar(200)  NOT NULL					
,DEPT_ID  FLOAT  NOT NULL								
,DEPT_NM  varchar(250)  NOT NULL							
,CATEG_NM  varchar(200)  NOT NULL						
,SUB_CATEG_ID  FLOAT  NOT NULL							
,SUB_CATEG_NM  varchar(200)  NOT NULL							
,ITEM_CATEG_GROUPING_ID  varchar(200)  NOT NULL				
,SRC_CRE_TS  nvarchar(255)  NOT NULL						
,SRC_MODFD_TS  nvarchar(255)  NOT NULL					
,SRC_HRCHY_MODFD_TS  datetime  NOT NULL					
,CATEG_MGR_NM  varchar(200)  NOT NULL					
,BUYER_NM  varchar(200)  NOT NULL						
,EFF_BEGIN_DT  date  NOT NULL							
,EFF_END_DT  date  NOT NULL								
,RPT_HRCHY_ID_PATH  varchar(200)  NOT NULL				
,CATEG_ID  FLOAT  NOT NULL								
,CONSUMABLE_IND  nvarchar(255)  NOT NULL					
,CURR_IND  FLOAT  NOT NULL								
,CRE_DT  date  NOT NULL									
,CRE_USER  nvarchar(255)  NOT NULL						
,UPD_TS  datetime  NOT NULL								
,UPD_USER  nvarchar(255)  NOT NULL		)

drop table 
insert into dim_rpt_hrchy_SQL_IN1542 
select 
IIF(RPT_HRCHY_ID    IS NULL ,101.00 ,cast(RPT_HRCHY_ID as FLOAT))as RPT_HRCHY_ID
,IIF(SRC_RPT_HRCHY_ID    IS NULL ,101.00 ,cast(src_rpt_hrchy_id as FLOAT))as SRC_RPT_HRCHY_ID
,IIF(TENANT_ORG_ID    IS NULL ,'N/A' ,LTRIM(RTRIM((tenant_org_id))))as TENANT_ORG_ID
,IIF(RPT_HRCHY_PATH    IS NULL OR   RPT_HRCHY_PATH='?','N/A' ,cast(ltrim(rtrim(RPT_HRCHY_PATH)) as varchar))as RPT_HRCHY_PATH
,IIF(DIV_ID    IS NULL ,101.00 ,cast(div_id as FLOAT))as DIV_ID
,IIF(DIV_NM    IS NULL OR   DIV_NM='null','N/A' ,cast(ltrim(rtrim(div_nm)) as varchar))as DIV_NM
,IIF(SUPER_DEPT_ID    IS NULL , 'N/A',cast(super_dept_id as int))as SUPER_DEPT_ID
,IIF(SUPER_DEPT_NM    IS NULL OR   SUPER_DEPT_NM='null','N/A' ,cast(ltrim(rtrim(super_dept_nm)) as varchar))as SUPER_DEPT_NM
,IIF(DEPT_ID    IS NULL ,'N/A' ,cast(dept_id as int))as DEPT_ID
,IIF(DEPT_NM    IS NULL OR   DEPT_NM='null','N/A' ,cast(ltrim(rtrim(dept_NM)) as varchar))as DEPT_NM
,IIF(CATEG_NM    IS NULL OR   CATEG_NM='null','N/A' ,cast(ltrim(rtrim(categ_nm)) as varchar))as CATEG_NM
,IIF(SUB_CATEG_ID    IS NULL ,101 ,cast(sub_categ_id as int))as SUB_CATEG_ID
,IIF(SUB_CATEG_NM    IS NULL OR   SUB_CATEG_NM='null','N/A' ,cast(ltrim(rtrim(sub_categ_nm)) as varchar))as SUB_CATEG_NM
,IIF(ITEM_CATEG_GROUPING_ID    IS NULL OR   ITEM_CATEG_GROUPING_ID='null','N/A' ,cast(ltrim(rtrim(item_categ_grouping_id)) as varchar))as ITEM_CATEG_GROUPING_ID
,SRC_CRE_TS as SRC_CRE_TS
,SRC_MODFD_TS as SRC_MODFD_TS
,cast(substring(SRC_HRCHY_MODFD_TS,1,charindex('.',SRC_HRCHY_MODFD_TS)-1)as datetime) as SRC_HRCHY_MODFD_TS
,IIF(CATEG_MGR_NM    IS NULL OR   CATEG_MGR_NM='null','N/A' ,cast(ltrim(rtrim(categ_mgr_nm)) as varchar))as CATEG_MGR_NM
,IIF(BUYER_NM    IS NULL OR   BUYER_NM='null', 'N/A',cast(ltrim(rtrim(buyer_nm)) as varchar))as BUYER_NM
,IIF(EFF_BEGIN_DT    IS NULL or EFF_BEGIN_DT like '%[0-9]%','01-01-1900',cast(eff_begin_dt as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='?','01-01-1900',cast(eff_end_dt as date))as EFF_END_DT
,IIF(RPT_HRCHY_ID_PATH is null or RPT_HRCHY_ID_PATH ='?'   ,'N/A' ,cast(ltrim(rtrim(rpt_hrchy_id_path)) as varchar))as RPT_HRCHY_ID_PATH

,IIF(CATEG_ID    IS NULL ,101.00 ,cast(categ_id as float))as CATEG_ID
,IIF(CONSUMABLE_IND like '[01? ]' ,101,cast(ltrim(rtrim(consumable_ind))as INT))as CONSUMABLE_IND
,IIF(CURR_IND   like'[01?]',101.00 ,cast(ltrim(rtrim(CURR_IND))as FLOAT))as CURR_IND
,IIF(CRE_DT IS NULL   or  CRE_DT like '%[0-9]%','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS
,upd_user as upd_user
from 
[BCMPWMT].[RPT_HRCHY]

-------row count-------------
select count(*) from dim_rpt_hrchy_SQL_IN1542 
select count(*) from (
select 
IIF(RPT_HRCHY_ID    IS NULL ,101.00 ,cast(RPT_HRCHY_ID as FLOAT))as RPT_HRCHY_ID
,IIF(SRC_RPT_HRCHY_ID    IS NULL ,101.00 ,cast(src_rpt_hrchy_id as FLOAT))as SRC_RPT_HRCHY_ID
,IIF(TENANT_ORG_ID    IS NULL ,'N/A' ,LTRIM(RTRIM((tenant_org_id))))as TENANT_ORG_ID
,IIF(RPT_HRCHY_PATH    IS NULL OR   RPT_HRCHY_PATH='?','N/A' ,cast(ltrim(rtrim(RPT_HRCHY_PATH)) as varchar))as RPT_HRCHY_PATH
,IIF(DIV_ID    IS NULL ,101.00 ,cast(div_id as FLOAT))as DIV_ID
,IIF(DIV_NM    IS NULL OR   DIV_NM='null','N/A' ,cast(ltrim(rtrim(div_nm)) as varchar))as DIV_NM
,IIF(SUPER_DEPT_ID    IS NULL , 'N/A',cast(super_dept_id as int))as SUPER_DEPT_ID
,IIF(SUPER_DEPT_NM    IS NULL OR   SUPER_DEPT_NM='null','N/A' ,cast(ltrim(rtrim(super_dept_nm)) as varchar))as SUPER_DEPT_NM
,IIF(DEPT_ID    IS NULL ,'N/A' ,cast(dept_id as int))as DEPT_ID
,IIF(DEPT_NM    IS NULL OR   DEPT_NM='null','N/A' ,cast(ltrim(rtrim(dept_NM)) as varchar))as DEPT_NM
,IIF(CATEG_NM    IS NULL OR   CATEG_NM='null','N/A' ,cast(ltrim(rtrim(categ_nm)) as varchar))as CATEG_NM
,IIF(SUB_CATEG_ID    IS NULL ,101 ,cast(sub_categ_id as int))as SUB_CATEG_ID
,IIF(SUB_CATEG_NM    IS NULL OR   SUB_CATEG_NM='null','N/A' ,cast(ltrim(rtrim(sub_categ_nm)) as varchar))as SUB_CATEG_NM
,IIF(ITEM_CATEG_GROUPING_ID    IS NULL OR   ITEM_CATEG_GROUPING_ID='null','N/A' ,cast(ltrim(rtrim(item_categ_grouping_id)) as varchar))as ITEM_CATEG_GROUPING_ID
,SRC_CRE_TS as SRC_CRE_TS
,SRC_MODFD_TS as SRC_MODFD_TS
,cast(substring(SRC_HRCHY_MODFD_TS,1,charindex('.',SRC_HRCHY_MODFD_TS)-1)as datetime) as SRC_HRCHY_MODFD_TS
,IIF(CATEG_MGR_NM    IS NULL OR   CATEG_MGR_NM='null','N/A' ,cast(ltrim(rtrim(categ_mgr_nm)) as varchar))as CATEG_MGR_NM
,IIF(BUYER_NM    IS NULL OR   BUYER_NM='null', 'N/A',cast(ltrim(rtrim(buyer_nm)) as varchar))as BUYER_NM
,IIF(EFF_BEGIN_DT    IS NULL or EFF_BEGIN_DT like '%[0-9]%','01-01-1900',cast(eff_begin_dt as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='?','01-01-1900',cast(eff_end_dt as date))as EFF_END_DT
,IIF(RPT_HRCHY_ID_PATH is null or RPT_HRCHY_ID_PATH ='?'   ,'N/A' ,cast(ltrim(rtrim(rpt_hrchy_id_path)) as varchar))as RPT_HRCHY_ID_PATH

,IIF(CATEG_ID    IS NULL ,101.00 ,cast(categ_id as float))as CATEG_ID
,IIF(CONSUMABLE_IND like '[01? ]' ,101,cast(ltrim(rtrim(consumable_ind))as INT))as CONSUMABLE_IND
,IIF(CURR_IND   like'[01?]',101.00 ,cast(ltrim(rtrim(CURR_IND))as FLOAT))as CURR_IND
,IIF(CRE_DT IS NULL   or  CRE_DT like '%[0-9]%','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS
,upd_user as upd_user
from 
[BCMPWMT].[RPT_HRCHY])s
-------------------row count group by ---------------------
select * from 
[BCMPWMT].[RPT_HRCHY]
select * from dim_rpt_hrchy_SQL_IN1542
select DIV_NM ,count(*) from dim_rpt_hrchy_SQL_IN1542  group by DIV_NM 
select DIV_NM ,count(*) from (
select 
IIF(RPT_HRCHY_ID    IS NULL ,101.00 ,cast(RPT_HRCHY_ID as FLOAT))as RPT_HRCHY_ID
,IIF(SRC_RPT_HRCHY_ID    IS NULL ,101.00 ,cast(src_rpt_hrchy_id as FLOAT))as SRC_RPT_HRCHY_ID
,IIF(TENANT_ORG_ID    IS NULL ,'N/A' ,LTRIM(RTRIM((tenant_org_id))))as TENANT_ORG_ID
,IIF(RPT_HRCHY_PATH    IS NULL OR   RPT_HRCHY_PATH='?','N/A' ,cast(ltrim(rtrim(RPT_HRCHY_PATH)) as varchar))as RPT_HRCHY_PATH
,IIF(DIV_ID    IS NULL ,101.00 ,cast(div_id as FLOAT))as DIV_ID
,IIF(DIV_NM    IS NULL OR   DIV_NM='null','N/A' ,cast(ltrim(rtrim(div_nm)) as varchar))as DIV_NM
,IIF(SUPER_DEPT_ID    IS NULL , 'N/A',cast(super_dept_id as int))as SUPER_DEPT_ID
,IIF(SUPER_DEPT_NM    IS NULL OR   SUPER_DEPT_NM='null','N/A' ,cast(ltrim(rtrim(super_dept_nm)) as varchar))as SUPER_DEPT_NM
,IIF(DEPT_ID    IS NULL ,'N/A' ,cast(dept_id as int))as DEPT_ID
,IIF(DEPT_NM    IS NULL OR   DEPT_NM='null','N/A' ,cast(ltrim(rtrim(dept_NM)) as varchar))as DEPT_NM
,IIF(CATEG_NM    IS NULL OR   CATEG_NM='null','N/A' ,cast(ltrim(rtrim(categ_nm)) as varchar))as CATEG_NM
,IIF(SUB_CATEG_ID    IS NULL ,101 ,cast(sub_categ_id as int))as SUB_CATEG_ID
,IIF(SUB_CATEG_NM    IS NULL OR   SUB_CATEG_NM='null','N/A' ,cast(ltrim(rtrim(sub_categ_nm)) as varchar))as SUB_CATEG_NM
,IIF(ITEM_CATEG_GROUPING_ID    IS NULL OR   ITEM_CATEG_GROUPING_ID='null','N/A' ,cast(ltrim(rtrim(item_categ_grouping_id)) as varchar))as ITEM_CATEG_GROUPING_ID
,SRC_CRE_TS as SRC_CRE_TS
,SRC_MODFD_TS as SRC_MODFD_TS
,cast(substring(SRC_HRCHY_MODFD_TS,1,charindex('.',SRC_HRCHY_MODFD_TS)-1)as datetime) as SRC_HRCHY_MODFD_TS
,IIF(CATEG_MGR_NM    IS NULL OR   CATEG_MGR_NM='null','N/A' ,cast(ltrim(rtrim(categ_mgr_nm)) as varchar))as CATEG_MGR_NM
,IIF(BUYER_NM    IS NULL OR   BUYER_NM='null', 'N/A',cast(ltrim(rtrim(buyer_nm)) as varchar))as BUYER_NM
,IIF(EFF_BEGIN_DT    IS NULL or EFF_BEGIN_DT like '%[0-9]%','01-01-1900',cast(eff_begin_dt as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='?','01-01-1900',cast(eff_end_dt as date))as EFF_END_DT
,IIF(RPT_HRCHY_ID_PATH is null or RPT_HRCHY_ID_PATH ='?'   ,'N/A' ,cast(ltrim(rtrim(rpt_hrchy_id_path)) as varchar))as RPT_HRCHY_ID_PATH

,IIF(CATEG_ID    IS NULL ,101.00 ,cast(categ_id as float))as CATEG_ID
,IIF(CONSUMABLE_IND like '[01? ]' ,101,cast(ltrim(rtrim(consumable_ind))as INT))as CONSUMABLE_IND
,IIF(CURR_IND   like'[01?]',101.00 ,cast(ltrim(rtrim(CURR_IND))as FLOAT))as CURR_IND
,IIF(CRE_DT IS NULL   or  CRE_DT like '%[0-9]%','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS
,upd_user as upd_user
from 
[BCMPWMT].[RPT_HRCHY])s
group by DIV_NM 
--------------------distinct----------------

select RPT_HRCHY_ID,count(*) from dim_rpt_hrchy_SQL_IN1542  group by RPT_HRCHY_ID having count(*)>1


------random record check-----------



select DIV_NM ,RPT_HRCHY_ID  from dim_rpt_hrchy_SQL_IN1542  where RPT_HRCHY_ID=23388
select DIV_NM ,RPT_HRCHY_ID from (
select 
IIF(RPT_HRCHY_ID    IS NULL ,101.00 ,cast(RPT_HRCHY_ID as FLOAT))as RPT_HRCHY_ID
,IIF(SRC_RPT_HRCHY_ID    IS NULL ,101.00 ,cast(src_rpt_hrchy_id as FLOAT))as SRC_RPT_HRCHY_ID
,IIF(TENANT_ORG_ID    IS NULL ,'N/A' ,LTRIM(RTRIM((tenant_org_id))))as TENANT_ORG_ID
,IIF(RPT_HRCHY_PATH    IS NULL OR   RPT_HRCHY_PATH='?','N/A' ,cast(ltrim(rtrim(RPT_HRCHY_PATH)) as varchar))as RPT_HRCHY_PATH
,IIF(DIV_ID    IS NULL ,101.00 ,cast(div_id as FLOAT))as DIV_ID
,IIF(DIV_NM    IS NULL OR   DIV_NM='null','N/A' ,cast(ltrim(rtrim(div_nm)) as varchar))as DIV_NM
,IIF(SUPER_DEPT_ID    IS NULL , 'N/A',cast(super_dept_id as int))as SUPER_DEPT_ID
,IIF(SUPER_DEPT_NM    IS NULL OR   SUPER_DEPT_NM='null','N/A' ,cast(ltrim(rtrim(super_dept_nm)) as varchar))as SUPER_DEPT_NM
,IIF(DEPT_ID    IS NULL ,'N/A' ,cast(dept_id as int))as DEPT_ID
,IIF(DEPT_NM    IS NULL OR   DEPT_NM='null','N/A' ,cast(ltrim(rtrim(dept_NM)) as varchar))as DEPT_NM
,IIF(CATEG_NM    IS NULL OR   CATEG_NM='null','N/A' ,cast(ltrim(rtrim(categ_nm)) as varchar))as CATEG_NM
,IIF(SUB_CATEG_ID    IS NULL ,101 ,cast(sub_categ_id as int))as SUB_CATEG_ID
,IIF(SUB_CATEG_NM    IS NULL OR   SUB_CATEG_NM='null','N/A' ,cast(ltrim(rtrim(sub_categ_nm)) as varchar))as SUB_CATEG_NM
,IIF(ITEM_CATEG_GROUPING_ID    IS NULL OR   ITEM_CATEG_GROUPING_ID='null','N/A' ,cast(ltrim(rtrim(item_categ_grouping_id)) as varchar))as ITEM_CATEG_GROUPING_ID
,SRC_CRE_TS as SRC_CRE_TS
,SRC_MODFD_TS as SRC_MODFD_TS
,cast(substring(SRC_HRCHY_MODFD_TS,1,charindex('.',SRC_HRCHY_MODFD_TS)-1)as datetime) as SRC_HRCHY_MODFD_TS
,IIF(CATEG_MGR_NM    IS NULL OR   CATEG_MGR_NM='null','N/A' ,cast(ltrim(rtrim(categ_mgr_nm)) as varchar))as CATEG_MGR_NM
,IIF(BUYER_NM    IS NULL OR   BUYER_NM='null', 'N/A',cast(ltrim(rtrim(buyer_nm)) as varchar))as BUYER_NM
,IIF(EFF_BEGIN_DT    IS NULL or EFF_BEGIN_DT like '%[0-9]%','01-01-1900',cast(eff_begin_dt as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='?','01-01-1900',cast(eff_end_dt as date))as EFF_END_DT
,IIF(RPT_HRCHY_ID_PATH is null or RPT_HRCHY_ID_PATH ='?'   ,'N/A' ,cast(ltrim(rtrim(rpt_hrchy_id_path)) as varchar))as RPT_HRCHY_ID_PATH

,IIF(CATEG_ID    IS NULL ,101.00 ,cast(categ_id as float))as CATEG_ID
,IIF(CONSUMABLE_IND like '[01? ]' ,101,cast(ltrim(rtrim(consumable_ind))as INT))as CONSUMABLE_IND
,IIF(CURR_IND   like'[01?]',101.00 ,cast(ltrim(rtrim(CURR_IND))as FLOAT))as CURR_IND
,IIF(CRE_DT IS NULL   or  CRE_DT like '%[0-9]%','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS
,upd_user as upd_user
from 
[BCMPWMT].[RPT_HRCHY])s
 where RPT_HRCHY_ID=23388

 ----------------column level check------------
 select count(*)  from dim_rpt_hrchy_SQL_IN1542  t left join(

select 
IIF(RPT_HRCHY_ID    IS NULL ,101.00 ,cast(RPT_HRCHY_ID as FLOAT))as RPT_HRCHY_ID
,IIF(SRC_RPT_HRCHY_ID    IS NULL ,101.00 ,cast(src_rpt_hrchy_id as FLOAT))as SRC_RPT_HRCHY_ID
,IIF(TENANT_ORG_ID    IS NULL ,'N/A' ,LTRIM(RTRIM((tenant_org_id))))as TENANT_ORG_ID
,IIF(RPT_HRCHY_PATH    IS NULL OR   RPT_HRCHY_PATH='?','N/A' ,cast(ltrim(rtrim(RPT_HRCHY_PATH)) as varchar))as RPT_HRCHY_PATH
,IIF(DIV_ID    IS NULL ,101.00 ,cast(div_id as FLOAT))as DIV_ID
,IIF(DIV_NM    IS NULL OR   DIV_NM='null','N/A' ,cast(ltrim(rtrim(div_nm)) as varchar))as DIV_NM
,IIF(SUPER_DEPT_ID    IS NULL , 'N/A',cast(super_dept_id as int))as SUPER_DEPT_ID
,IIF(SUPER_DEPT_NM    IS NULL OR   SUPER_DEPT_NM='null','N/A' ,cast(ltrim(rtrim(super_dept_nm)) as varchar))as SUPER_DEPT_NM
,IIF(DEPT_ID    IS NULL ,'N/A' ,cast(dept_id as int))as DEPT_ID
,IIF(DEPT_NM    IS NULL OR   DEPT_NM='null','N/A' ,cast(ltrim(rtrim(dept_NM)) as varchar))as DEPT_NM
,IIF(CATEG_NM    IS NULL OR   CATEG_NM='null','N/A' ,cast(ltrim(rtrim(categ_nm)) as varchar))as CATEG_NM
,IIF(SUB_CATEG_ID    IS NULL ,101 ,cast(sub_categ_id as int))as SUB_CATEG_ID
,IIF(SUB_CATEG_NM    IS NULL OR   SUB_CATEG_NM='null','N/A' ,cast(ltrim(rtrim(sub_categ_nm)) as varchar))as SUB_CATEG_NM
,IIF(ITEM_CATEG_GROUPING_ID    IS NULL OR   ITEM_CATEG_GROUPING_ID='null','N/A' ,cast(ltrim(rtrim(item_categ_grouping_id)) as varchar))as ITEM_CATEG_GROUPING_ID
,SRC_CRE_TS as SRC_CRE_TS
,SRC_MODFD_TS as SRC_MODFD_TS
,cast(substring(SRC_HRCHY_MODFD_TS,1,charindex('.',SRC_HRCHY_MODFD_TS)-1)as datetime) as SRC_HRCHY_MODFD_TS
,IIF(CATEG_MGR_NM    IS NULL OR   CATEG_MGR_NM='null','N/A' ,cast(ltrim(rtrim(categ_mgr_nm)) as varchar))as CATEG_MGR_NM
,IIF(BUYER_NM    IS NULL OR   BUYER_NM='null', 'N/A',cast(ltrim(rtrim(buyer_nm)) as varchar))as BUYER_NM
,IIF(EFF_BEGIN_DT    IS NULL or EFF_BEGIN_DT like '%[0-9]%','01-01-1900',cast(eff_begin_dt as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='?','01-01-1900',cast(eff_end_dt as date))as EFF_END_DT
,IIF(RPT_HRCHY_ID_PATH is null or RPT_HRCHY_ID_PATH ='?'   ,'N/A' ,cast(ltrim(rtrim(rpt_hrchy_id_path)) as varchar))as RPT_HRCHY_ID_PATH

,IIF(CATEG_ID    IS NULL ,101.00 ,cast(categ_id as float))as CATEG_ID
,IIF(CONSUMABLE_IND like '[01? ]' ,101,cast(ltrim(rtrim(consumable_ind))as INT))as CONSUMABLE_IND
,IIF(CURR_IND   like'[01?]',101.00 ,cast(ltrim(rtrim(CURR_IND))as FLOAT))as CURR_IND
,IIF(CRE_DT IS NULL   or  CRE_DT like '%[0-9]%','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(substring(UPD_TS,1,charindex('.',UPD_TS)-1)as datetime))as UPD_TS
,upd_user as upd_user
from 
[BCMPWMT].[RPT_HRCHY])s
on t.RPT_HRCHY_ID=s.RPT_HRCHY_ID
where s.RPT_HRCHY_ID is not null and (



 s.RPT_HRCHY_ID  <>  t.RPT_HRCHY_ID or
s.SRC_RPT_HRCHY_ID  <>  t.SRC_RPT_HRCHY_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.RPT_HRCHY_PATH  <>  t.RPT_HRCHY_PATH or
s.DIV_ID  <>  t.DIV_ID or
s.DIV_NM  <>  t.DIV_NM or
s.SUPER_DEPT_ID  <>  t.SUPER_DEPT_ID or
s.SUPER_DEPT_NM  <>  t.SUPER_DEPT_NM or
s.DEPT_ID  <>  t.DEPT_ID or
s.DEPT_NM  <>  t.DEPT_NM or
s.CATEG_NM  <>  t.CATEG_NM or
s.SUB_CATEG_ID  <>  t.SUB_CATEG_ID or
s.SUB_CATEG_NM  <>  t.SUB_CATEG_NM or
s.ITEM_CATEG_GROUPING_ID  <>  t.ITEM_CATEG_GROUPING_ID or
s.SRC_CRE_TS  <>  t.SRC_CRE_TS or
s.SRC_MODFD_TS  <>  t.SRC_MODFD_TS or
s.SRC_HRCHY_MODFD_TS  <>  t.SRC_HRCHY_MODFD_TS or
s.CATEG_MGR_NM  <>  t.CATEG_MGR_NM or
s.BUYER_NM  <>  t.BUYER_NM or
s.EFF_BEGIN_DT  <>  t.EFF_BEGIN_DT or
s.EFF_END_DT  <>  t.EFF_END_DT or
s.RPT_HRCHY_ID_PATH  <>  t.RPT_HRCHY_ID_PATH or
s.CATEG_ID  <>  t.CATEG_ID or
s.CONSUMABLE_IND  <>  t.CONSUMABLE_IND or
s.CURR_IND  <>  t.CURR_IND or
s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER )
----------------------------------------------------------------------------




-----------------------------14 DIM_ORG_BU


SINESS_UNIT_SQL_IN1542----------------
select * from [BCMPWMT].[ORG_BUSINESS_UNIT]
DROP TABLE DIM_ORG_BUSINESS_UNIT_SQL_IN1542

CREATE TABLE DIM_ORG_BUSINESS_UNIT_SQL_IN1542(              
ORG_ID  varchar(50)  NOT NULL	                    ,       			
SRC_ORG_CD  varchar(50)  NOT NULL					,
ORG_TYPE_ID  INT  NOT NULL						,
ORG_NM  varchar(150)  NOT NULL						,
PARENT_ORG_ID  varchar(50)  NOT NULL				,
PARENT_ORG_NM  varchar(250)  NOT NULL				,
WM_RDC_NUM  varchar(50)  NOT NULL					,
WM_STORE_NUM  varchar(50)  NOT NULL					,
WM_DSTRBTR_NO  varchar(50)  NOT NULL				,
WH_IND  bigint  NOT NULL						,
DSV_IND  bigint  NOT NULL						,
ACTV_IND  bigint  NOT NULL						,
EFF_BEGIN_DT  DATE  NOT NULL					,
EFF_END_DT  DATE  NOT NULL						,
CRE_DT  DATE  NOT NULL							,
Is_Valid_Flag  varchar(50)  NOT NULl,
UPD_TS  DATETIME  NOT null,

ORG_BUSINESS_UNIT_KEY  	int identity(1,1) 	NOT NULL
											
)

insert into DIM_ORG_BUSINESS_UNIT_SQL_IN1542 
select 
IIF(ORG_ID    IS NULL OR   ORG_ID='null','N/A' ,LTRIM(RTRIM(ORG_ID)))as ORG_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null','N/A' ,LTRIM(RTRIM(SRC_ORG_CD)))as SRC_ORG_CD
,IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,cast(ltrim(rtrim(ORG_TYPE_ID ))AS INT))as ORG_TYPE_ID
,IIF(ORG_NM    IS NULL OR   ORG_NM='null','N/A' ,LTRIM(RTRIM(ORG_NM)))as ORG_NM
,IIF(PARENT_ORG_ID    IS NULL OR   PARENT_ORG_ID='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_ID)))as PARENT_ORG_ID
,IIF(PARENT_ORG_NM    IS NULL OR   PARENT_ORG_NM='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_NM)))as PARENT_ORG_NM
,IIF(WM_RDC_NUM    IS NULL OR   WM_RDC_NUM='null','N/A' ,LTRIM(RTRIM(WM_RDC_NUM)))as WM_RDC_NUM
,IIF(WM_STORE_NUM    IS NULL OR   WM_STORE_NUM='null','N/A' ,LTRIM(RTRIM(WM_STORE_NUM)))as WM_STORE_NUM
,IIF(WM_DSTRBTR_NO    IS NULL OR   WM_DSTRBTR_NO='null', 'N/A',LTRIM(RTRIM(WM_DSTRBTR_NO)))as WM_DSTRBTR_NO
,IIF(WH_IND    IS NULL OR   WH_IND='null',101,cast(ltrim(rtrim(wh_ind))AS bigint))as WH_IND
,IIF(DSV_IND    IS NULL OR   DSV_IND='null',101,cast(ltrim(rtrim(dsv_ind))AS bigint))as DSV_IND
,IIF(ACTV_IND    IS NULL OR   ACTV_IND='null',101,cast(ltrim(rtrim(actv_ind))AS bigint))as ACTV_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_BEGIN_DT))))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_END_DT))))as EFF_END_DT
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,1 AS Is_Valid_Flag
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(UPD_TS))))as UPD_TS

from [BCMPWMT].[ORG_BUSINESS_UNIT]

-------------------ROW COUNT--------------40430
SELECT COUNT(*)  FROM DIM_ORG_BUSINESS_UNIT_SQL_IN1542 
SELECT COUNT(*) FROM 
(select 
IIF(ORG_ID    IS NULL OR   ORG_ID='null','N/A' ,LTRIM(RTRIM(ORG_ID)))as ORG_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null','N/A' ,LTRIM(RTRIM(SRC_ORG_CD)))as SRC_ORG_CD
,IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,cast(ltrim(rtrim(ORG_TYPE_ID ))AS INT))as ORG_TYPE_ID
,IIF(ORG_NM    IS NULL OR   ORG_NM='null','N/A' ,LTRIM(RTRIM(ORG_NM)))as ORG_NM
,IIF(PARENT_ORG_ID    IS NULL OR   PARENT_ORG_ID='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_ID)))as PARENT_ORG_ID
,IIF(PARENT_ORG_NM    IS NULL OR   PARENT_ORG_NM='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_NM)))as PARENT_ORG_NM
,IIF(WM_RDC_NUM    IS NULL OR   WM_RDC_NUM='null','N/A' ,LTRIM(RTRIM(WM_RDC_NUM)))as WM_RDC_NUM
,IIF(WM_STORE_NUM    IS NULL OR   WM_STORE_NUM='null','N/A' ,LTRIM(RTRIM(WM_STORE_NUM)))as WM_STORE_NUM
,IIF(WM_DSTRBTR_NO    IS NULL OR   WM_DSTRBTR_NO='null', 'N/A',LTRIM(RTRIM(WM_DSTRBTR_NO)))as WM_DSTRBTR_NO
,IIF(WH_IND    IS NULL OR   WH_IND='null',101,cast(ltrim(rtrim(wh_ind))AS bigint))as WH_IND
,IIF(DSV_IND    IS NULL OR   DSV_IND='null',101,cast(ltrim(rtrim(dsv_ind))AS bigint))as DSV_IND
,IIF(ACTV_IND    IS NULL OR   ACTV_IND='null',101,cast(ltrim(rtrim(actv_ind))AS bigint))as ACTV_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_BEGIN_DT))))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_END_DT))))as EFF_END_DT
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,1 AS Is_Valid_Flag
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(UPD_TS))))as UPD_TS

from [BCMPWMT].[ORG_BUSINESS_UNIT]
)T


------------------ROW COUNT GROUP BY ---------------------
SELECT ORG_TYPE_ID,COUNT(*)  FROM DIM_ORG_BUSINESS_UNIT_SQL_IN1542 GROUP BY ORG_TYPE_ID
SELECT ORG_TYPE_ID,COUNT(*) FROM 
(select 
IIF(ORG_ID    IS NULL OR   ORG_ID='null','N/A' ,LTRIM(RTRIM(ORG_ID)))as ORG_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null','N/A' ,LTRIM(RTRIM(SRC_ORG_CD)))as SRC_ORG_CD
,IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,cast(ltrim(rtrim(ORG_TYPE_ID ))AS INT))as ORG_TYPE_ID
,IIF(ORG_NM    IS NULL OR   ORG_NM='null','N/A' ,LTRIM(RTRIM(ORG_NM)))as ORG_NM
,IIF(PARENT_ORG_ID    IS NULL OR   PARENT_ORG_ID='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_ID)))as PARENT_ORG_ID
,IIF(PARENT_ORG_NM    IS NULL OR   PARENT_ORG_NM='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_NM)))as PARENT_ORG_NM
,IIF(WM_RDC_NUM    IS NULL OR   WM_RDC_NUM='null','N/A' ,LTRIM(RTRIM(WM_RDC_NUM)))as WM_RDC_NUM
,IIF(WM_STORE_NUM    IS NULL OR   WM_STORE_NUM='null','N/A' ,LTRIM(RTRIM(WM_STORE_NUM)))as WM_STORE_NUM
,IIF(WM_DSTRBTR_NO    IS NULL OR   WM_DSTRBTR_NO='null', 'N/A',LTRIM(RTRIM(WM_DSTRBTR_NO)))as WM_DSTRBTR_NO
,IIF(WH_IND    IS NULL OR   WH_IND='null',101,cast(ltrim(rtrim(wh_ind))AS bigint))as WH_IND
,IIF(DSV_IND    IS NULL OR   DSV_IND='null',101,cast(ltrim(rtrim(dsv_ind))AS bigint))as DSV_IND
,IIF(ACTV_IND    IS NULL OR   ACTV_IND='null',101,cast(ltrim(rtrim(actv_ind))AS bigint))as ACTV_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_BEGIN_DT))))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_END_DT))))as EFF_END_DT
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,1 AS Is_Valid_Flag
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(UPD_TS))))as UPD_TS

from [BCMPWMT].[ORG_BUSINESS_UNIT]
)T GROUP BY ORG_TYPE_ID
----------------------DISTINCT CHECK------------------

SELECT ORG_ID ,COUNT(*)  FROM DIM_ORG_BUSINESS_UNIT_SQL_IN1542 GROUP BY ORG_ID  HAVING COUNT(*)>1
-------------------------RANDOM RECORD CHECK------------------
SELECT * FROM 
[BCMPWMT].[ORG_BUSINESS_UNIT] 
SELECT ORG_TYPE_ID ,PARENT_ORG_NM FROM DIM_ORG_BUSINESS_UNIT_SQL_IN1542 WHERE SRC_ORG_CD='66776'
SELECT ORG_TYPE_ID ,PARENT_ORG_NM FROM 
(select 
IIF(ORG_ID    IS NULL OR   ORG_ID='null','N/A' ,LTRIM(RTRIM(ORG_ID)))as ORG_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null','N/A' ,LTRIM(RTRIM(SRC_ORG_CD)))as SRC_ORG_CD
,IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,cast(ltrim(rtrim(ORG_TYPE_ID ))AS INT))as ORG_TYPE_ID
,IIF(ORG_NM    IS NULL OR   ORG_NM='null','N/A' ,LTRIM(RTRIM(ORG_NM)))as ORG_NM
,IIF(PARENT_ORG_ID    IS NULL OR   PARENT_ORG_ID='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_ID)))as PARENT_ORG_ID
,IIF(PARENT_ORG_NM    IS NULL OR   PARENT_ORG_NM='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_NM)))as PARENT_ORG_NM
,IIF(WM_RDC_NUM    IS NULL OR   WM_RDC_NUM='null','N/A' ,LTRIM(RTRIM(WM_RDC_NUM)))as WM_RDC_NUM
,IIF(WM_STORE_NUM    IS NULL OR   WM_STORE_NUM='null','N/A' ,LTRIM(RTRIM(WM_STORE_NUM)))as WM_STORE_NUM
,IIF(WM_DSTRBTR_NO    IS NULL OR   WM_DSTRBTR_NO='null', 'N/A',LTRIM(RTRIM(WM_DSTRBTR_NO)))as WM_DSTRBTR_NO
,IIF(WH_IND    IS NULL OR   WH_IND='null',101,cast(ltrim(rtrim(wh_ind))AS bigint))as WH_IND
,IIF(DSV_IND    IS NULL OR   DSV_IND='null',101,cast(ltrim(rtrim(dsv_ind))AS bigint))as DSV_IND
,IIF(ACTV_IND    IS NULL OR   ACTV_IND='null',101,cast(ltrim(rtrim(actv_ind))AS bigint))as ACTV_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_BEGIN_DT))))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_END_DT))))as EFF_END_DT
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,1 AS Is_Valid_Flag
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(UPD_TS))))as UPD_TS

from [BCMPWMT].[ORG_BUSINESS_UNIT]
)T WHERE SRC_ORG_CD='66776'

------------------------------COLUMN LEVEL CHECK------------------

SELECT * FROM 
[BCMPWMT].[ORG_BUSINESS_UNIT] 

SELECT COUNT(*) FROM DIM_ORG_BUSINESS_UNIT_SQL_IN1542 T
LEFT JOIN

(select 
IIF(ORG_ID    IS NULL OR   ORG_ID='null','N/A' ,LTRIM(RTRIM(ORG_ID)))as ORG_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null','N/A' ,LTRIM(RTRIM(SRC_ORG_CD)))as SRC_ORG_CD
,IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,cast(ltrim(rtrim(ORG_TYPE_ID ))AS INT))as ORG_TYPE_ID
,IIF(ORG_NM    IS NULL OR   ORG_NM='null','N/A' ,LTRIM(RTRIM(ORG_NM)))as ORG_NM
,IIF(PARENT_ORG_ID    IS NULL OR   PARENT_ORG_ID='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_ID)))as PARENT_ORG_ID
,IIF(PARENT_ORG_NM    IS NULL OR   PARENT_ORG_NM='null', 'N/A',LTRIM(RTRIM(PARENT_ORG_NM)))as PARENT_ORG_NM
,IIF(WM_RDC_NUM    IS NULL OR   WM_RDC_NUM='null','N/A' ,LTRIM(RTRIM(WM_RDC_NUM)))as WM_RDC_NUM
,IIF(WM_STORE_NUM    IS NULL OR   WM_STORE_NUM='null','N/A' ,LTRIM(RTRIM(WM_STORE_NUM)))as WM_STORE_NUM
,IIF(WM_DSTRBTR_NO    IS NULL OR   WM_DSTRBTR_NO='null', 'N/A',LTRIM(RTRIM(WM_DSTRBTR_NO)))as WM_DSTRBTR_NO
,IIF(WH_IND    IS NULL OR   WH_IND='null',101,cast(ltrim(rtrim(wh_ind))AS bigint))as WH_IND
,IIF(DSV_IND    IS NULL OR   DSV_IND='null',101,cast(ltrim(rtrim(dsv_ind))AS bigint))as DSV_IND
,IIF(ACTV_IND    IS NULL OR   ACTV_IND='null',101,cast(ltrim(rtrim(actv_ind))AS bigint))as ACTV_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_BEGIN_DT))))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(EFF_END_DT))))as EFF_END_DT
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,1 AS Is_Valid_Flag
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(UPD_TS))))as UPD_TS

from [BCMPWMT].[ORG_BUSINESS_UNIT]
)S
ON S.ORG_ID  = T. ORG_ID 
WHERE T.ORG_ID IS NOT NULL AND (
s.SRC_ORG_CD  <>  t.SRC_ORG_CD or
s.ORG_TYPE_ID  <>  t.ORG_TYPE_ID or
s.ORG_NM  <>  t.ORG_NM or
s.PARENT_ORG_ID  <>  t.PARENT_ORG_ID or
s.PARENT_ORG_NM  <>  t.PARENT_ORG_NM or
s.WM_RDC_NUM  <>  t.WM_RDC_NUM or
s.WM_STORE_NUM  <>  t.WM_STORE_NUM or
s.WM_DSTRBTR_NO  <>  t.WM_DSTRBTR_NO or
s.WH_IND  <>  t.WH_IND or
s.DSV_IND  <>  t.DSV_IND or
s.ACTV_IND  <>  t.ACTV_IND or
s.EFF_BEGIN_DT  <>  t.EFF_BEGIN_DT or
s.EFF_END_DT  <>  t.EFF_END_DT or
s.CRE_DT  <>  t.CRE_DT or

s.UPD_TS  <>  t.UPD_TS 


)
--------------------------15-------------------------


CREATE TABLE 
Dim_ORG_TYPE_LKP_SQL_IN1542(
ORG_TYPE_ID  INT  NOT NULL				,
ORG_TYPE_CD  VARCHAR(50) NOT NULL			,	
ORG_TYPE_DESC  VARCHAR(50)  NOT NULL		,		
ORG_TYPE_NM  VARCHAR(50)  NOT NULL			,	
PARENT_ORG_TYPE_NM  VARCHAR(50)  NOT NULL	,			
PARENT_ORG_TYPE_CD  VARCHAR(50)  NOT NULL	,			
CRE_DT  DATE  NOT NULL					,
CRE_USER  VARCHAR(50)  NOT NULL				,
ORG_TYPE_LKP_KEY  int identity(1,1) primary key	NOT NULL,
P1 VARCHAR(250) NULL,
P2 VARCHAR(250) NULL
)

SELECT * FROM [BCMPWMT].[ORG_TYPE_LKP]

INSERT INTO Dim_ORG_TYPE_LKP_SQL_IN1542
SELECT
IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,CONVERT(INT,LTRIM(RTRIM(ORG_TYPE_ID))))as ORG_TYPE_ID
,IIF(ORG_TYPE_CD    IS NULL OR   ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_CD)))as ORG_TYPE_CD
,IIF(ORG_TYPE_DESC    IS NULL OR   ORG_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_DESC)))as ORG_TYPE_DESC
,IIF(ORG_TYPE_NM    IS NULL OR   ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_NM)))as ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_NM    IS NULL OR   PARENT_ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_NM)))as PARENT_ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_CD    IS NULL OR   PARENT_ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_CD)))as PARENT_ORG_TYPE_CD
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
,NULL AS P1,NULL AS P2
FROM [BCMPWMT].[ORG_TYPE_LKP]


---------ROW COUNT------------10--
SELECT COUNT(*) FROM Dim_ORG_TYPE_LKP_SQL_IN1542
SELECT COUNT(*) FROM 
(
SELECT
IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,CONVERT(INT,LTRIM(RTRIM(ORG_TYPE_ID))))as ORG_TYPE_ID
,IIF(ORG_TYPE_CD    IS NULL OR   ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_CD)))as ORG_TYPE_CD
,IIF(ORG_TYPE_DESC    IS NULL OR   ORG_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_DESC)))as ORG_TYPE_DESC
,IIF(ORG_TYPE_NM    IS NULL OR   ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_NM)))as ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_NM    IS NULL OR   PARENT_ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_NM)))as PARENT_ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_CD    IS NULL OR   PARENT_ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_CD)))as PARENT_ORG_TYPE_CD
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER,NULL AS P1,NULL AS P2
FROM [BCMPWMT].[ORG_TYPE_LKP]
)S

------------ROW COUNT GROUP BY -------------
SELECT * FROM 
[BCMPWMT].[ORG_TYPE_LKP]

SELECT ORG_TYPE_ID,COUNT(*) FROM Dim_ORG_TYPE_LKP_SQL_IN1542 GROUP BY ORG_TYPE_ID
SELECT ORG_TYPE_ID,COUNT(*) FROM 
(
SELECT
IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,CONVERT(INT,LTRIM(RTRIM(ORG_TYPE_ID))))as ORG_TYPE_ID
,IIF(ORG_TYPE_CD    IS NULL OR   ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_CD)))as ORG_TYPE_CD
,IIF(ORG_TYPE_DESC    IS NULL OR   ORG_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_DESC)))as ORG_TYPE_DESC
,IIF(ORG_TYPE_NM    IS NULL OR   ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_NM)))as ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_NM    IS NULL OR   PARENT_ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_NM)))as PARENT_ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_CD    IS NULL OR   PARENT_ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_CD)))as PARENT_ORG_TYPE_CD
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER,NULL AS P1,NULL AS P2
FROM [BCMPWMT].[ORG_TYPE_LKP]
)S
GROUP BY ORG_TYPE_ID
------------------------------DUPLICATE---------
SELECT ORG_TYPE_ID,COUNT(*) FROM Dim_ORG_TYPE_LKP_SQL_IN1542 GROUP BY ORG_TYPE_ID HAVING COUNT(*) >1
----------------------------RANDOM CHECK------------------
SELECT ORG_TYPE_DESC ,PARENT_ORG_TYPE_NM   FROM Dim_ORG_TYPE_LKP_SQL_IN1542 WHERE ORG_TYPE_CD='ENT'
SELECT ORG_TYPE_DESC ,PARENT_ORG_TYPE_NM FROM 
(
SELECT
IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,CONVERT(INT,LTRIM(RTRIM(ORG_TYPE_ID))))as ORG_TYPE_ID
,IIF(ORG_TYPE_CD    IS NULL OR   ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_CD)))as ORG_TYPE_CD
,IIF(ORG_TYPE_DESC    IS NULL OR   ORG_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_DESC)))as ORG_TYPE_DESC
,IIF(ORG_TYPE_NM    IS NULL OR   ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_NM)))as ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_NM    IS NULL OR   PARENT_ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_NM)))as PARENT_ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_CD    IS NULL OR   PARENT_ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_CD)))as PARENT_ORG_TYPE_CD
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER,NULL AS P1,NULL AS P2
FROM [BCMPWMT].[ORG_TYPE_LKP]
)S WHERE ORG_TYPE_CD='ENT'
----------------------------COLUMN LEVEL CHECK-----------------


SELECT * FROM Dim_ORG_TYPE_LKP_SQL_IN1542 T
LEFT JOIN
(
SELECT
IIF(ORG_TYPE_ID    IS NULL OR   ORG_TYPE_ID='null',101,CONVERT(INT,LTRIM(RTRIM(ORG_TYPE_ID))))as ORG_TYPE_ID
,IIF(ORG_TYPE_CD    IS NULL OR   ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_CD)))as ORG_TYPE_CD
,IIF(ORG_TYPE_DESC    IS NULL OR   ORG_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_DESC)))as ORG_TYPE_DESC
,IIF(ORG_TYPE_NM    IS NULL OR   ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(ORG_TYPE_NM)))as ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_NM    IS NULL OR   PARENT_ORG_TYPE_NM='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_NM)))as PARENT_ORG_TYPE_NM
,IIF(PARENT_ORG_TYPE_CD    IS NULL OR   PARENT_ORG_TYPE_CD='null','N/A' ,LTRIM(RTRIM(PARENT_ORG_TYPE_CD)))as PARENT_ORG_TYPE_CD
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',CONVERT(DATE,LTRIM(RTRIM(CRE_DT))))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER,NULL AS P1,NULL AS P2
FROM [BCMPWMT].[ORG_TYPE_LKP]
)S
ON S.ORG_TYPE_ID  =T.ORG_TYPE_ID 
WHERE T.ORG_TYPE_ID  IS NOT NULL AND(

s.ORG_TYPE_ID  <>  t.ORG_TYPE_ID or
s.ORG_TYPE_CD  <>  t.ORG_TYPE_CD or
s.ORG_TYPE_DESC  <>  t.ORG_TYPE_DESC or
s.ORG_TYPE_NM  <>  t.ORG_TYPE_NM or
s.PARENT_ORG_TYPE_NM  <>  t.PARENT_ORG_TYPE_NM or
s.PARENT_ORG_TYPE_CD  <>  t.PARENT_ORG_TYPE_CD or
s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER )
-----------------------------------16-------------------------------------------

SELECT * FROM [BCMPWMT].[PROD]

CREATE TABLE
dim_prod_SQL_IN1542(
prod_key   int identity(1,1) primary key	NOT NULL	,		
CATLG_ITEM_ID  integer  NOT NULL						,
PRMRY_DSTRBTR_NM  varchar(200)  NOT NULL						,
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
PROD_NM  varchar (200) NOT NULL								,
PROD_HT  decimal(19,6)  NOT NULL								,
PROD_WT  decimal(19,6)  NOT NULL								,
PROD_LEN  decimal(19,6)  NOT NULL								,
PROD_WDTH  decimal(19,6)  NOT NULL							,
CRE_DT  date  NOT NULL									,
CRE_USER  varchar(50)  NOT NULL				,
UPD_TS  datetime  NOT NULL				,
UPD_USER  varchar(50)  NOT NULL				
)
DROP TABLE dim_prod_SQL_IN1542

SELECT * FROM [BCMPWMT].[PROD]

INSERT INTO dim_prod_SQL_IN1542 

SELECT 
IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null', 101,cast(ltrim(rtrim(CATLG_ITEM_ID)) as int))as CATLG_ITEM_ID
,IIF(PRMRY_DSTRBTR_NM    IS NULL OR   PRMRY_DSTRBTR_NM='null','N/A' ,ltrim(rtrim(PRMRY_DSTRBTR_NM)))as PRMRY_DSTRBTR_NM
,IIF(PRMRY_VEND_NUM    IS NULL OR   PRMRY_VEND_NUM='null',101 ,CAST(ltrim(rtrim(PRMRY_VEND_NUM))AS INT))as PRMRY_VEND_NUM
,IIF(SRC_IMS_CRE_TS    IS NULL OR   SRC_IMS_CRE_TS='null','N/A', ltrim(rtrim(SRC_IMS_CRE_TS )))as SRC_IMS_CRE_TS
,IIF(SRC_IMS_MODFD_TS    IS NULL OR   SRC_IMS_MODFD_TS='null','N/A',ltrim(rtrim(SRC_IMS_MODFD_TS )) )as SRC_IMS_MODFD_TS
,IIF(VEND_PACK_QTY    IS NULL OR   VEND_PACK_QTY='null',101 ,cast(ltrim(rtrim(VEND_PACK_QTY)) as int))as VEND_PACK_QTY
,IIF(WHSE_PACK_QTY    IS NULL OR   WHSE_PACK_QTY='null',101 ,cast(ltrim(rtrim(WHSE_PACK_QTY)) as int))as WHSE_PACK_QTY
,IIF(CURR_PRICE_MODFD_TS    IS NULL OR   CURR_PRICE_MODFD_TS='null','01-01-1900',cast(ltrim(rtrim(CURR_PRICE_MODFD_TS))as datetime))as CURR_PRICE_MODFD_TS
,IIF(AMT_ITEM_COST    IS NULL OR   AMT_ITEM_COST='null', 101.00,cast(ltrim(rtrim(AMT_ITEM_COST))as decimal))as AMT_ITEM_COST
,IIF(AMT_BASE_ITEM_PRICE    IS NULL OR   AMT_BASE_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_ITEM_PRICE))as decimal))as AMT_BASE_ITEM_PRICE
,IIF(AMT_BASE_SUGG_PRICE    IS NULL OR   AMT_BASE_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_SUGG_PRICE))as decimal))as AMT_BASE_SUGG_PRICE
,IIF(AMT_SUGG_PRICE    IS NULL OR   AMT_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_SUGG_PRICE))as decimal))as AMT_SUGG_PRICE
,IIF(MIN_ITEM_COST    IS NULL OR   MIN_ITEM_COST='null',101.00 ,cast(ltrim(rtrim(MIN_ITEM_COST))as decimal))as MIN_ITEM_COST
,IIF(ORIG_PRICE    IS NULL OR   ORIG_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_PRICE))as decimal))as ORIG_PRICE
,IIF(ORIG_ITEM_PRICE    IS NULL OR   ORIG_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_ITEM_PRICE))as DECIMAL))as ORIG_ITEM_PRICE
,IIF(PROD_NM    IS NULL OR   PROD_NM='null','N/A' ,LTRIM(RTRIM(PROD_NM)))as PROD_NM
,IIF(PROD_HT    IS NULL OR   PROD_HT='null' or PROD_HT like '%[A-Z0-9]%', 101.00,cast(ltrim(rtrim(prod_ht))as FLOAT))as PROD_HT
,IIF(PROD_WT    IS NULL OR   PROD_WT='null',101.00 ,cast(ltrim(rtrim(prod_wt))as decimal))as PROD_WT
,IIF(PROD_LEN    IS NULL OR   PROD_LEN='null',101.00 ,cast(ltrim(rtrim(prod_len))as decimal))as PROD_LEN
,IIF(PROD_WDTH    IS NULL OR   PROD_WDTH='null',101.00 ,cast(ltrim(rtrim(prod_wdth))as decimal))as PROD_WDTH
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(cre_user)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null'OR UPD_TS like '%[A-Z0-9]%','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='NULL','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER
FROM [BCMPWMT].[PROD]
-----ROW COUNT-------9603 
SELECT COUNT(*) FROM dim_prod_SQL_IN1542 
SELECT COUNT(*) FROM (SELECT 
IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null', 101,cast(ltrim(rtrim(CATLG_ITEM_ID)) as int))as CATLG_ITEM_ID
,IIF(PRMRY_DSTRBTR_NM    IS NULL OR   PRMRY_DSTRBTR_NM='null','N/A' ,ltrim(rtrim(PRMRY_DSTRBTR_NM)))as PRMRY_DSTRBTR_NM
,IIF(PRMRY_VEND_NUM    IS NULL OR   PRMRY_VEND_NUM='null',101 ,CAST(ltrim(rtrim(PRMRY_VEND_NUM))AS INT))as PRMRY_VEND_NUM
,IIF(SRC_IMS_CRE_TS    IS NULL OR   SRC_IMS_CRE_TS='null','N/A', ltrim(rtrim(SRC_IMS_CRE_TS )))as SRC_IMS_CRE_TS
,IIF(SRC_IMS_MODFD_TS    IS NULL OR   SRC_IMS_MODFD_TS='null','N/A',ltrim(rtrim(SRC_IMS_MODFD_TS )) )as SRC_IMS_MODFD_TS
,IIF(VEND_PACK_QTY    IS NULL OR   VEND_PACK_QTY='null',101 ,cast(ltrim(rtrim(VEND_PACK_QTY)) as int))as VEND_PACK_QTY
,IIF(WHSE_PACK_QTY    IS NULL OR   WHSE_PACK_QTY='null',101 ,cast(ltrim(rtrim(WHSE_PACK_QTY)) as int))as WHSE_PACK_QTY
,IIF(CURR_PRICE_MODFD_TS    IS NULL OR   CURR_PRICE_MODFD_TS='null','01-01-1900',cast(ltrim(rtrim(CURR_PRICE_MODFD_TS))as datetime))as CURR_PRICE_MODFD_TS
,IIF(AMT_ITEM_COST    IS NULL OR   AMT_ITEM_COST='null', 101.00,cast(ltrim(rtrim(AMT_ITEM_COST))as decimal))as AMT_ITEM_COST
,IIF(AMT_BASE_ITEM_PRICE    IS NULL OR   AMT_BASE_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_ITEM_PRICE))as decimal))as AMT_BASE_ITEM_PRICE
,IIF(AMT_BASE_SUGG_PRICE    IS NULL OR   AMT_BASE_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_SUGG_PRICE))as decimal))as AMT_BASE_SUGG_PRICE
,IIF(AMT_SUGG_PRICE    IS NULL OR   AMT_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_SUGG_PRICE))as decimal))as AMT_SUGG_PRICE
,IIF(MIN_ITEM_COST    IS NULL OR   MIN_ITEM_COST='null',101.00 ,cast(ltrim(rtrim(MIN_ITEM_COST))as decimal))as MIN_ITEM_COST
,IIF(ORIG_PRICE    IS NULL OR   ORIG_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_PRICE))as decimal))as ORIG_PRICE
,IIF(ORIG_ITEM_PRICE    IS NULL OR   ORIG_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_ITEM_PRICE))as DECIMAL))as ORIG_ITEM_PRICE
,IIF(PROD_NM    IS NULL OR   PROD_NM='null','N/A' ,LTRIM(RTRIM(PROD_NM)))as PROD_NM
,IIF(PROD_HT    IS NULL OR   PROD_HT='null' or PROD_HT like '%[A-Z0-9]%', 101.00,cast(ltrim(rtrim(prod_ht))as FLOAT))as PROD_HT
,IIF(PROD_WT    IS NULL OR   PROD_WT='null',101.00 ,cast(ltrim(rtrim(prod_wt))as decimal))as PROD_WT
,IIF(PROD_LEN    IS NULL OR   PROD_LEN='null',101.00 ,cast(ltrim(rtrim(prod_len))as decimal))as PROD_LEN
,IIF(PROD_WDTH    IS NULL OR   PROD_WDTH='null',101.00 ,cast(ltrim(rtrim(prod_wdth))as decimal))as PROD_WDTH
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(cre_user)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null'OR UPD_TS like '%[A-Z0-9]%','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='NULL','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER
FROM [BCMPWMT].[PROD] )S
--------ROW COUNT GROUP BY-------------
SELECT * FROM [BCMPWMT].[PROD]
SELECT UPD_USER,COUNT(*) FROM dim_prod_SQL_IN1542 GROUP BY UPD_USER
SELECT UPD_USER,COUNT(*) FROM (SELECT 
IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null', 101,cast(ltrim(rtrim(CATLG_ITEM_ID)) as int))as CATLG_ITEM_ID
,IIF(PRMRY_DSTRBTR_NM    IS NULL OR   PRMRY_DSTRBTR_NM='null','N/A' ,ltrim(rtrim(PRMRY_DSTRBTR_NM)))as PRMRY_DSTRBTR_NM
,IIF(PRMRY_VEND_NUM    IS NULL OR   PRMRY_VEND_NUM='null',101 ,CAST(ltrim(rtrim(PRMRY_VEND_NUM))AS INT))as PRMRY_VEND_NUM
,IIF(SRC_IMS_CRE_TS    IS NULL OR   SRC_IMS_CRE_TS='null','N/A', ltrim(rtrim(SRC_IMS_CRE_TS )))as SRC_IMS_CRE_TS
,IIF(SRC_IMS_MODFD_TS    IS NULL OR   SRC_IMS_MODFD_TS='null','N/A',ltrim(rtrim(SRC_IMS_MODFD_TS )) )as SRC_IMS_MODFD_TS
,IIF(VEND_PACK_QTY    IS NULL OR   VEND_PACK_QTY='null',101 ,cast(ltrim(rtrim(VEND_PACK_QTY)) as int))as VEND_PACK_QTY
,IIF(WHSE_PACK_QTY    IS NULL OR   WHSE_PACK_QTY='null',101 ,cast(ltrim(rtrim(WHSE_PACK_QTY)) as int))as WHSE_PACK_QTY
,IIF(CURR_PRICE_MODFD_TS    IS NULL OR   CURR_PRICE_MODFD_TS='null','01-01-1900',cast(ltrim(rtrim(CURR_PRICE_MODFD_TS))as datetime))as CURR_PRICE_MODFD_TS
,IIF(AMT_ITEM_COST    IS NULL OR   AMT_ITEM_COST='null', 101.00,cast(ltrim(rtrim(AMT_ITEM_COST))as decimal))as AMT_ITEM_COST
,IIF(AMT_BASE_ITEM_PRICE    IS NULL OR   AMT_BASE_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_ITEM_PRICE))as decimal))as AMT_BASE_ITEM_PRICE
,IIF(AMT_BASE_SUGG_PRICE    IS NULL OR   AMT_BASE_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_SUGG_PRICE))as decimal))as AMT_BASE_SUGG_PRICE
,IIF(AMT_SUGG_PRICE    IS NULL OR   AMT_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_SUGG_PRICE))as decimal))as AMT_SUGG_PRICE
,IIF(MIN_ITEM_COST    IS NULL OR   MIN_ITEM_COST='null',101.00 ,cast(ltrim(rtrim(MIN_ITEM_COST))as decimal))as MIN_ITEM_COST
,IIF(ORIG_PRICE    IS NULL OR   ORIG_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_PRICE))as decimal))as ORIG_PRICE
,IIF(ORIG_ITEM_PRICE    IS NULL OR   ORIG_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_ITEM_PRICE))as DECIMAL))as ORIG_ITEM_PRICE
,IIF(PROD_NM    IS NULL OR   PROD_NM='null','N/A' ,LTRIM(RTRIM(PROD_NM)))as PROD_NM
,IIF(PROD_HT    IS NULL OR   PROD_HT='null' or PROD_HT like '%[A-Z0-9]%', 101.00,cast(ltrim(rtrim(prod_ht))as FLOAT))as PROD_HT
,IIF(PROD_WT    IS NULL OR   PROD_WT='null',101.00 ,cast(ltrim(rtrim(prod_wt))as decimal))as PROD_WT
,IIF(PROD_LEN    IS NULL OR   PROD_LEN='null',101.00 ,cast(ltrim(rtrim(prod_len))as decimal))as PROD_LEN
,IIF(PROD_WDTH    IS NULL OR   PROD_WDTH='null',101.00 ,cast(ltrim(rtrim(prod_wdth))as decimal))as PROD_WDTH
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(cre_user)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null'OR UPD_TS like '%[A-Z0-9]%','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='NULL','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER
FROM [BCMPWMT].[PROD] )S
GROUP BY UPD_USER

----------------DISTINCT COUNT-----
SELECT CATLG_ITEM_ID,COUNT(*) FROM dim_prod_SQL_IN1542 GROUP BY CATLG_ITEM_ID HAVING COUNT(*) <1
---------RANDOM RECORD CHECK------------
SELECT * FROM [BCMPWMT].[PROD]
SELECT UPD_USER,PRMRY_DSTRBTR_NM  FROM dim_prod_SQL_IN1542 WHERE CATLG_ITEM_ID=45826172
SELECT  UPD_USER,PRMRY_DSTRBTR_NM   FROM (SELECT 
IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null', 101,cast(ltrim(rtrim(CATLG_ITEM_ID)) as int))as CATLG_ITEM_ID
,IIF(PRMRY_DSTRBTR_NM    IS NULL OR   PRMRY_DSTRBTR_NM='null','N/A' ,ltrim(rtrim(PRMRY_DSTRBTR_NM)))as PRMRY_DSTRBTR_NM
,IIF(PRMRY_VEND_NUM    IS NULL OR   PRMRY_VEND_NUM='null',101 ,CAST(ltrim(rtrim(PRMRY_VEND_NUM))AS INT))as PRMRY_VEND_NUM
,IIF(SRC_IMS_CRE_TS    IS NULL OR   SRC_IMS_CRE_TS='null','N/A', ltrim(rtrim(SRC_IMS_CRE_TS )))as SRC_IMS_CRE_TS
,IIF(SRC_IMS_MODFD_TS    IS NULL OR   SRC_IMS_MODFD_TS='null','N/A',ltrim(rtrim(SRC_IMS_MODFD_TS )) )as SRC_IMS_MODFD_TS
,IIF(VEND_PACK_QTY    IS NULL OR   VEND_PACK_QTY='null',101 ,cast(ltrim(rtrim(VEND_PACK_QTY)) as int))as VEND_PACK_QTY
,IIF(WHSE_PACK_QTY    IS NULL OR   WHSE_PACK_QTY='null',101 ,cast(ltrim(rtrim(WHSE_PACK_QTY)) as int))as WHSE_PACK_QTY
,IIF(CURR_PRICE_MODFD_TS    IS NULL OR   CURR_PRICE_MODFD_TS='null','01-01-1900',cast(ltrim(rtrim(CURR_PRICE_MODFD_TS))as datetime))as CURR_PRICE_MODFD_TS
,IIF(AMT_ITEM_COST    IS NULL OR   AMT_ITEM_COST='null', 101.00,cast(ltrim(rtrim(AMT_ITEM_COST))as decimal))as AMT_ITEM_COST
,IIF(AMT_BASE_ITEM_PRICE    IS NULL OR   AMT_BASE_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_ITEM_PRICE))as decimal))as AMT_BASE_ITEM_PRICE
,IIF(AMT_BASE_SUGG_PRICE    IS NULL OR   AMT_BASE_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_SUGG_PRICE))as decimal))as AMT_BASE_SUGG_PRICE
,IIF(AMT_SUGG_PRICE    IS NULL OR   AMT_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_SUGG_PRICE))as decimal))as AMT_SUGG_PRICE
,IIF(MIN_ITEM_COST    IS NULL OR   MIN_ITEM_COST='null',101.00 ,cast(ltrim(rtrim(MIN_ITEM_COST))as decimal))as MIN_ITEM_COST
,IIF(ORIG_PRICE    IS NULL OR   ORIG_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_PRICE))as decimal))as ORIG_PRICE
,IIF(ORIG_ITEM_PRICE    IS NULL OR   ORIG_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_ITEM_PRICE))as DECIMAL))as ORIG_ITEM_PRICE
,IIF(PROD_NM    IS NULL OR   PROD_NM='null','N/A' ,LTRIM(RTRIM(PROD_NM)))as PROD_NM
,IIF(PROD_HT    IS NULL OR   PROD_HT='null' or PROD_HT like '%[A-Z0-9]%', 101.00,cast(ltrim(rtrim(prod_ht))as FLOAT))as PROD_HT
,IIF(PROD_WT    IS NULL OR   PROD_WT='null',101.00 ,cast(ltrim(rtrim(prod_wt))as decimal))as PROD_WT
,IIF(PROD_LEN    IS NULL OR   PROD_LEN='null',101.00 ,cast(ltrim(rtrim(prod_len))as decimal))as PROD_LEN
,IIF(PROD_WDTH    IS NULL OR   PROD_WDTH='null',101.00 ,cast(ltrim(rtrim(prod_wdth))as decimal))as PROD_WDTH
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(cre_user)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null'OR UPD_TS like '%[A-Z0-9]%','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='NULL','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER
FROM [BCMPWMT].[PROD] )S
WHERE CATLG_ITEM_ID=45826172
---------------------COLUMN LEVEL CHECK----------------
SELECT * FROM [BCMPWMT].[PROD]


SELECT COUNT(*)  FROM dim_prod_SQL_IN1542 T LEFT JOIN(
SELECT 
IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null', 101,cast(ltrim(rtrim(CATLG_ITEM_ID)) as int))as CATLG_ITEM_ID
,IIF(PRMRY_DSTRBTR_NM    IS NULL OR   PRMRY_DSTRBTR_NM='null','N/A' ,ltrim(rtrim(PRMRY_DSTRBTR_NM)))as PRMRY_DSTRBTR_NM
,IIF(PRMRY_VEND_NUM    IS NULL OR   PRMRY_VEND_NUM='null',101 ,CAST(ltrim(rtrim(PRMRY_VEND_NUM))AS INT))as PRMRY_VEND_NUM
,IIF(SRC_IMS_CRE_TS    IS NULL OR   SRC_IMS_CRE_TS='null','N/A', ltrim(rtrim(SRC_IMS_CRE_TS )))as SRC_IMS_CRE_TS
,IIF(SRC_IMS_MODFD_TS    IS NULL OR   SRC_IMS_MODFD_TS='null','N/A',ltrim(rtrim(SRC_IMS_MODFD_TS )) )as SRC_IMS_MODFD_TS
,IIF(VEND_PACK_QTY    IS NULL OR   VEND_PACK_QTY='null',101 ,cast(ltrim(rtrim(VEND_PACK_QTY)) as int))as VEND_PACK_QTY
,IIF(WHSE_PACK_QTY    IS NULL OR   WHSE_PACK_QTY='null',101 ,cast(ltrim(rtrim(WHSE_PACK_QTY)) as int))as WHSE_PACK_QTY
,IIF(CURR_PRICE_MODFD_TS    IS NULL OR   CURR_PRICE_MODFD_TS='null','01-01-1900',cast(ltrim(rtrim(CURR_PRICE_MODFD_TS))as datetime))as CURR_PRICE_MODFD_TS
,IIF(AMT_ITEM_COST    IS NULL OR   AMT_ITEM_COST='null', 101.00,cast(ltrim(rtrim(AMT_ITEM_COST))as decimal))as AMT_ITEM_COST
,IIF(AMT_BASE_ITEM_PRICE    IS NULL OR   AMT_BASE_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_ITEM_PRICE))as decimal))as AMT_BASE_ITEM_PRICE
,IIF(AMT_BASE_SUGG_PRICE    IS NULL OR   AMT_BASE_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_BASE_SUGG_PRICE))as decimal))as AMT_BASE_SUGG_PRICE
,IIF(AMT_SUGG_PRICE    IS NULL OR   AMT_SUGG_PRICE='null',101.00 ,cast(ltrim(rtrim(AMT_SUGG_PRICE))as decimal))as AMT_SUGG_PRICE
,IIF(MIN_ITEM_COST    IS NULL OR   MIN_ITEM_COST='null',101.00 ,cast(ltrim(rtrim(MIN_ITEM_COST))as decimal))as MIN_ITEM_COST
,IIF(ORIG_PRICE    IS NULL OR   ORIG_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_PRICE))as decimal))as ORIG_PRICE
,IIF(ORIG_ITEM_PRICE    IS NULL OR   ORIG_ITEM_PRICE='null',101.00 ,cast(ltrim(rtrim(ORIG_ITEM_PRICE))as DECIMAL))as ORIG_ITEM_PRICE
,IIF(PROD_NM    IS NULL OR   PROD_NM='null','N/A' ,LTRIM(RTRIM(PROD_NM)))as PROD_NM
,IIF(PROD_HT    IS NULL OR   PROD_HT='null' or PROD_HT like '%[A-Z0-9]%', 101.00,cast(ltrim(rtrim(prod_ht))as FLOAT))as PROD_HT
,IIF(PROD_WT    IS NULL OR   PROD_WT='null',101.00 ,cast(ltrim(rtrim(prod_wt))as decimal))as PROD_WT
,IIF(PROD_LEN    IS NULL OR   PROD_LEN='null',101.00 ,cast(ltrim(rtrim(prod_len))as decimal))as PROD_LEN
,IIF(PROD_WDTH    IS NULL OR   PROD_WDTH='null',101.00 ,cast(ltrim(rtrim(prod_wdth))as decimal))as PROD_WDTH
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(cre_dt))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(cre_user)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null'OR UPD_TS like '%[A-Z0-9]%','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='NULL','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER
FROM [BCMPWMT].[PROD] )S
ON S.CATLG_ITEM_ID=T.CATLG_ITEM_ID
WHERE S.CATLG_ITEM_ID IS NOT NULL AND (

s.CATLG_ITEM_ID  <>  t.CATLG_ITEM_ID or
s.PRMRY_DSTRBTR_NM  <>  t.PRMRY_DSTRBTR_NM or
s.PRMRY_VEND_NUM  <>  t.PRMRY_VEND_NUM or
s.SRC_IMS_CRE_TS  <>  t.SRC_IMS_CRE_TS or
s.SRC_IMS_MODFD_TS  <>  t.SRC_IMS_MODFD_TS or
s.VEND_PACK_QTY  <>  t.VEND_PACK_QTY or
s.WHSE_PACK_QTY  <>  t.WHSE_PACK_QTY or
s.CURR_PRICE_MODFD_TS  <>  t.CURR_PRICE_MODFD_TS or
s.AMT_ITEM_COST  <>  t.AMT_ITEM_COST or
s.AMT_BASE_ITEM_PRICE  <>  t.AMT_BASE_ITEM_PRICE or
s.AMT_BASE_SUGG_PRICE  <>  t.AMT_BASE_SUGG_PRICE or
s.AMT_SUGG_PRICE  <>  t.AMT_SUGG_PRICE or
s.MIN_ITEM_COST  <>  t.MIN_ITEM_COST or
s.ORIG_PRICE  <>  t.ORIG_PRICE or
s.ORIG_ITEM_PRICE  <>  t.ORIG_ITEM_PRICE or
s.PROD_NM  <>  t.PROD_NM or
s.PROD_HT  <>  t.PROD_HT or
s.PROD_WT  <>  t.PROD_WT or
s.PROD_LEN  <>  t.PROD_LEN or
s.PROD_WDTH  <>  t.PROD_WDTH or
s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER
)
--------------------------------------------------------------------------------------------------

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

insert  into dim_RSN_LKP_sql_IN1542 
select 

IIF(RSN_ID    IS NULL OR   RSN_ID='null', 101,cast(ltrim(rtrim(rsn_id))as INT))as RSN_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101 ,cast(ltrim(rtrim(tenant_org_id))as INT))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101 ,cast(ltrim(rtrim(data_src_id))as INT))as DATA_SRC_ID
,IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101 ,cast(ltrim(rtrim(rsn_type_id))as INT))as RSN_TYPE_ID
,IIF(RSN_CD    IS NULL OR   RSN_CD='null'or rsn_cd like '%[a-zA-Z]%',101 ,cast(ltrim(rtrim(rsn_cd))as int))as RSN_CD
,IIF(SRC_RSN_ID    IS NULL OR   SRC_RSN_ID='null',101 ,cast(ltrim(rtrim(src_rsn_id))as INT))as SRC_RSN_ID
,IIF(RSN_DESC    IS NULL OR   RSN_DESC='null','N/A' ,(ltrim(rtrim(rsn_desc))))as RSN_DESC
,IIF(RSN_LONG_DESC    IS NULL OR   RSN_LONG_DESC='null','N/A' ,ltrim(rtrim(rsn_long_desc)))as RSN_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',cast(ltrim(rtrim(cre_ts))as datetime))as CRE_TS
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,UPD_USER AS UPD_USER

from 
[BCMPWMT].[RSN_LKP]

-------------row count---------357
select count(*) from dim_RSN_LKP_sql_IN1542 
select count(*) from (
select 

IIF(RSN_ID    IS NULL OR   RSN_ID='null', 101,cast(ltrim(rtrim(rsn_id))as INT))as RSN_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101 ,cast(ltrim(rtrim(tenant_org_id))as INT))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101 ,cast(ltrim(rtrim(data_src_id))as INT))as DATA_SRC_ID
,IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101 ,cast(ltrim(rtrim(rsn_type_id))as INT))as RSN_TYPE_ID
,IIF(RSN_CD    IS NULL OR   RSN_CD='null'or rsn_cd like '%[a-zA-Z]%',101 ,cast(ltrim(rtrim(rsn_cd))as int))as RSN_CD
,IIF(SRC_RSN_ID    IS NULL OR   SRC_RSN_ID='null',101 ,cast(ltrim(rtrim(src_rsn_id))as INT))as SRC_RSN_ID
,IIF(RSN_DESC    IS NULL OR   RSN_DESC='null','N/A' ,(ltrim(rtrim(rsn_desc))))as RSN_DESC
,IIF(RSN_LONG_DESC    IS NULL OR   RSN_LONG_DESC='null','N/A' ,ltrim(rtrim(rsn_long_desc)))as RSN_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',cast(ltrim(rtrim(cre_ts))as datetime))as CRE_TS
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,UPD_USER AS UPD_USER

from 
[BCMPWMT].[RSN_LKP])s
---------------------------row count group by ---------------------------------------------------
select RSN_TYPE_ID ,count(*) from dim_RSN_LKP_sql_IN1542  group by RSN_TYPE_ID 
select RSN_TYPE_ID , count(*) from (
select 

IIF(RSN_ID    IS NULL OR   RSN_ID='null', 101,cast(ltrim(rtrim(rsn_id))as INT))as RSN_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101 ,cast(ltrim(rtrim(tenant_org_id))as INT))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101 ,cast(ltrim(rtrim(data_src_id))as INT))as DATA_SRC_ID
,IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101 ,cast(ltrim(rtrim(rsn_type_id))as INT))as RSN_TYPE_ID
,IIF(RSN_CD    IS NULL OR   RSN_CD='null'or rsn_cd like '%[a-zA-Z]%',101 ,cast(ltrim(rtrim(rsn_cd))as int))as RSN_CD
,IIF(SRC_RSN_ID    IS NULL OR   SRC_RSN_ID='null',101 ,cast(ltrim(rtrim(src_rsn_id))as INT))as SRC_RSN_ID
,IIF(RSN_DESC    IS NULL OR   RSN_DESC='null','N/A' ,(ltrim(rtrim(rsn_desc))))as RSN_DESC
,IIF(RSN_LONG_DESC    IS NULL OR   RSN_LONG_DESC='null','N/A' ,ltrim(rtrim(rsn_long_desc)))as RSN_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',cast(ltrim(rtrim(cre_ts))as datetime))as CRE_TS
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,UPD_USER AS UPD_USER

from 
[BCMPWMT].[RSN_LKP])s group by RSN_TYPE_ID 
----------------------------distinct-------------------------------
select RSN_ID  ,count(*) from dim_RSN_LKP_sql_IN1542  group by RSN_ID   having  count(*)>1

-------------------------------random record check----------------
select RSN_TYPE_ID ,RSN_CD  from dim_RSN_LKP_sql_IN1542  where rsn_id=189
select RSN_TYPE_ID , RSN_CD  from (
select 

IIF(RSN_ID    IS NULL OR   RSN_ID='null', 101,cast(ltrim(rtrim(rsn_id))as INT))as RSN_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101 ,cast(ltrim(rtrim(tenant_org_id))as INT))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101 ,cast(ltrim(rtrim(data_src_id))as INT))as DATA_SRC_ID
,IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101 ,cast(ltrim(rtrim(rsn_type_id))as INT))as RSN_TYPE_ID
,IIF(RSN_CD    IS NULL OR   RSN_CD='null'or rsn_cd like '%[a-zA-Z]%',101 ,cast(ltrim(rtrim(rsn_cd))as int))as RSN_CD
,IIF(SRC_RSN_ID    IS NULL OR   SRC_RSN_ID='null',101 ,cast(ltrim(rtrim(src_rsn_id))as INT))as SRC_RSN_ID
,IIF(RSN_DESC    IS NULL OR   RSN_DESC='null','N/A' ,(ltrim(rtrim(rsn_desc))))as RSN_DESC
,IIF(RSN_LONG_DESC    IS NULL OR   RSN_LONG_DESC='null','N/A' ,ltrim(rtrim(rsn_long_desc)))as RSN_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',cast(ltrim(rtrim(cre_ts))as datetime))as CRE_TS
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,UPD_USER AS UPD_USER

from 
[BCMPWMT].[RSN_LKP])s 


where rsn_id=189

--------------------------column level check--------------------
select count(*)  from dim_RSN_LKP_sql_IN1542 t  left join
 (
select 

IIF(RSN_ID    IS NULL OR   RSN_ID='null', 101,cast(ltrim(rtrim(rsn_id))as INT))as RSN_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101 ,cast(ltrim(rtrim(tenant_org_id))as INT))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101 ,cast(ltrim(rtrim(data_src_id))as INT))as DATA_SRC_ID
,IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101 ,cast(ltrim(rtrim(rsn_type_id))as INT))as RSN_TYPE_ID
,IIF(RSN_CD    IS NULL OR   RSN_CD='null'or rsn_cd like '%[a-zA-Z]%',101 ,cast(ltrim(rtrim(rsn_cd))as int))as RSN_CD
,IIF(SRC_RSN_ID    IS NULL OR   SRC_RSN_ID='null',101 ,cast(ltrim(rtrim(src_rsn_id))as INT))as SRC_RSN_ID
,IIF(RSN_DESC    IS NULL OR   RSN_DESC='null','N/A' ,(ltrim(rtrim(rsn_desc))))as RSN_DESC
,IIF(RSN_LONG_DESC    IS NULL OR   RSN_LONG_DESC='null','N/A' ,ltrim(rtrim(rsn_long_desc)))as RSN_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',cast(ltrim(rtrim(cre_ts))as datetime))as CRE_TS
,CRE_USER as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(upd_ts))as datetime))as UPD_TS
,UPD_USER AS UPD_USER

from 
[BCMPWMT].[RSN_LKP])s 
on s.RSN_ID =t.RSN_ID 
where s.rsn_id is not null and (

s.RSN_ID  <>  t.RSN_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.RSN_TYPE_ID  <>  t.RSN_TYPE_ID or
s.RSN_CD  <>  t.RSN_CD or
s.SRC_RSN_ID  <>  t.SRC_RSN_ID or
s.RSN_DESC  <>  t.RSN_DESC or
s.RSN_LONG_DESC  <>  t.RSN_LONG_DESC or
s.CRE_TS  <>  t.CRE_TS or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER 

)

-----------------[BCMPWMT].[RSN_TYPE_LKP]---------------------

select * from [BCMPWMT].[RSN_TYPE_LKP]

create table Dim_RSN_TYPE_LKP_sql_in1542(
RSN_TYPE_ID  INT  NOT NULL			,
RSN_TYPE_CD  varchar(50)  NOT NULL		,	
RSN_TYPE_DESC  varchar(200)  NOT NULL	,		
CRE_TS  datetime  NOT NULL			,
CRE_USER  varchar(50)  NOT NULL			,
RSN_TYPE_LKP_KEY  int identity(1,1) primary key	NOT NULL)



TRUNCATE TABLE Dim_RSN_TYPE_LKP_sql_in154

insert into Dim_RSN_TYPE_LKP_sql_in1542
select 
IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101,CONVERT(INT,LTRIM(RSN_TYPE_ID)))as RSN_TYPE_ID
,IIF(RSN_TYPE_CD    IS NULL OR   RSN_TYPE_CD='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_CD)))as RSN_TYPE_CD
,IIF(RSN_TYPE_DESC    IS NULL OR   RSN_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_DESC)))as RSN_TYPE_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',CONVERT(DATETIME,(LTRIM(CRE_TS))))as CRE_TS
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
from [BCMPWMT].[RSN_TYPE_LKP]

SELECT
 * FROM Dim_RSN_TYPE_LKP_sql_in1542
-----------------------------------ROW COUNT-----------------------
SELECT COUNT(*) FROM Dim_RSN_TYPE_LKP_sql_in1542
SELECT COUNT(*) FROM (
select 
IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101,CONVERT(INT,LTRIM(RSN_TYPE_ID)))as RSN_TYPE_ID
,IIF(RSN_TYPE_CD    IS NULL OR   RSN_TYPE_CD='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_CD)))as RSN_TYPE_CD
,IIF(RSN_TYPE_DESC    IS NULL OR   RSN_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_DESC)))as RSN_TYPE_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',CONVERT(DATETIME,(LTRIM(CRE_TS))))as CRE_TS
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
from [BCMPWMT].[RSN_TYPE_LKP])S
----------------------ROW COUNT GROUP BY -----------
SELECT RSN_TYPE_ID,COUNT(*) FROM Dim_RSN_TYPE_LKP_sql_in1542 GROUP BY RSN_TYPE_ID
SELECT RSN_TYPE_ID,COUNT(*) FROM (
select 
IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101,CONVERT(INT,LTRIM(RSN_TYPE_ID)))as RSN_TYPE_ID
,IIF(RSN_TYPE_CD    IS NULL OR   RSN_TYPE_CD='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_CD)))as RSN_TYPE_CD
,IIF(RSN_TYPE_DESC    IS NULL OR   RSN_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_DESC)))as RSN_TYPE_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',CONVERT(DATETIME,(LTRIM(CRE_TS))))as CRE_TS
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
from [BCMPWMT].[RSN_TYPE_LKP])S GROUP BY RSN_TYPE_ID
---------------------------DUPLICATE------------------
SELECT RSN_TYPE_ID,COUNT(*) FROM Dim_RSN_TYPE_LKP_sql_in1542 GROUP BY RSN_TYPE_ID HAVING COUNT(*)>1
----------------------------RANDOM RECORD CHECK---------------------

SELECT RSN_TYPE_ID,RSN_TYPE_CD FROM Dim_RSN_TYPE_LKP_sql_in1542 WHERE RSN_TYPE_ID=2

SELECT RSN_TYPE_ID,RSN_TYPE_CD FROM (
select 
IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101,CONVERT(INT,LTRIM(RSN_TYPE_ID)))as RSN_TYPE_ID
,IIF(RSN_TYPE_CD    IS NULL OR   RSN_TYPE_CD='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_CD)))as RSN_TYPE_CD
,IIF(RSN_TYPE_DESC    IS NULL OR   RSN_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_DESC)))as RSN_TYPE_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',CONVERT(DATETIME,(LTRIM(CRE_TS))))as CRE_TS
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
from [BCMPWMT].[RSN_TYPE_LKP])S WHERE RSN_TYPE_ID=2
---------------------------------------COLUMN LEVEL CHECK---------------

SELECT COUNT(*)  FROM  
Dim_RSN_TYPE_LKP_sql_in1542 T
LEFT JOIN(
select 
IIF(RSN_TYPE_ID    IS NULL OR   RSN_TYPE_ID='null',101,CONVERT(INT,LTRIM(RSN_TYPE_ID)))as RSN_TYPE_ID
,IIF(RSN_TYPE_CD    IS NULL OR   RSN_TYPE_CD='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_CD)))as RSN_TYPE_CD
,IIF(RSN_TYPE_DESC    IS NULL OR   RSN_TYPE_DESC='null','N/A' ,LTRIM(RTRIM(RSN_TYPE_DESC)))as RSN_TYPE_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null','01-01-1900',CONVERT(DATETIME,(LTRIM(CRE_TS))))as CRE_TS
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,LTRIM(RTRIM(CRE_USER)))as CRE_USER
from [BCMPWMT].[RSN_TYPE_LKP])S 
ON
S.RSN_TYPE_ID=T.RSN_TYPE_ID 
WHERE S.RSN_TYPE_ID IS NOT NULL AND (


s.RSN_TYPE_DESC  <>  t.RSN_TYPE_DESC or
s.CRE_TS  <>  t.CRE_TS or
s.CRE_USER  <>  t.CRE_USER 
)
---------------------- DIM_STS_LKP_sql_IN1542-------------------
create table DIM_STS_LKP_sql_IN1542(
STS_LKP_KEY   int identity(1,1) primary key	 ,
STS_ID  INT  NULL				,
STS_MASTER_ID  INT   NULL		,	
TENANT_ORG_ID  INT  NULL		,	
DATA_SRC_ID  INT NULL			,
STS_CD  VARCHAR(50)  NULL			,
SRC_STS_ID  INT   NULL			,
STS_DESC  VARCHAR(50)  NULL			,
STS_LONG_DESC  VARCHAR(200)  NULL	,		
CRE_TS   VARCHAR(50)   NULL			,
UPD_TS   VARCHAR(50)   NULL	)


INSERT INTO DIM_STS_LKP_sql_IN1542
SELECT 
IIF(STS_ID    IS NULL OR   STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_ID))))as STS_ID
,IIF(STS_MASTER_ID    IS NULL OR   STS_MASTER_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_MASTER_ID))))as STS_MASTER_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,CONVERT(INT,LTRIM(RTRIM(DATA_SRC_ID))))as DATA_SRC_ID
,IIF(STS_CD    IS NULL OR   STS_CD='null','N/A' ,LTRIM(RTRIM(STS_CD)))as STS_CD
,IIF(SRC_STS_ID    IS NULL OR   SRC_STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(SRC_STS_ID))))as SRC_STS_ID
,IIF(STS_DESC    IS NULL OR   STS_DESC='null','N/A' ,LTRIM(RTRIM(STS_DESC)))as STS_DESC
,IIF(STS_LONG_DESC    IS NULL OR   STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(STS_LONG_DESC)))as STS_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null', '01-01-1900',CONCAT(DATEPART(QQ, CRE_TS),'-',DATEPART(YEAR,CRE_TS)))as CRE_TS
,IIF(UPD_TS    IS NULL OR   UPD_TS ='null', '01-01-1900',CONCAT(DATEPART(QQ, UPD_TS ),'-',DATEPART(YEAR,UPD_TS )))as UPD_TS 
FROM [BCMPWMT].[STS_LKP]

-----------------------ROW COUNT------------------
SELECT COUNT(*) FROM DIM_STS_LKP_sql_IN1542
SELECT COUNT(*) FROM 
(SELECT 
IIF(STS_ID    IS NULL OR   STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_ID))))as STS_ID
,IIF(STS_MASTER_ID    IS NULL OR   STS_MASTER_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_MASTER_ID))))as STS_MASTER_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,CONVERT(INT,LTRIM(RTRIM(DATA_SRC_ID))))as DATA_SRC_ID
,IIF(STS_CD    IS NULL OR   STS_CD='null','N/A' ,LTRIM(RTRIM(STS_CD)))as STS_CD
,IIF(SRC_STS_ID    IS NULL OR   SRC_STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(SRC_STS_ID))))as SRC_STS_ID
,IIF(STS_DESC    IS NULL OR   STS_DESC='null','N/A' ,LTRIM(RTRIM(STS_DESC)))as STS_DESC
,IIF(STS_LONG_DESC    IS NULL OR   STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(STS_LONG_DESC)))as STS_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null', '01-01-1900',CONCAT(DATEPART(QQ, CRE_TS),'-',DATEPART(YEAR,CRE_TS)))as CRE_TS
,IIF(UPD_TS    IS NULL OR   UPD_TS ='null', '01-01-1900',CONCAT(DATEPART(QQ, UPD_TS ),'-',DATEPART(YEAR,UPD_TS )))as UPD_TS 
FROM [BCMPWMT].[STS_LKP])S
--------------ROW COUNT GROUP BY-----------------
SELECT * FROM 
 [BCMPWMT].[STS_LKP]

SELECT DATA_SRC_ID,COUNT(*) FROM DIM_STS_LKP_sql_IN1542 GROUP BY DATA_SRC_ID

SELECT DATA_SRC_ID,COUNT(*)FROM 
(SELECT 
IIF(STS_ID    IS NULL OR   STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_ID))))as STS_ID
,IIF(STS_MASTER_ID    IS NULL OR   STS_MASTER_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_MASTER_ID))))as STS_MASTER_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,CONVERT(INT,LTRIM(RTRIM(DATA_SRC_ID))))as DATA_SRC_ID
,IIF(STS_CD    IS NULL OR   STS_CD='null','N/A' ,LTRIM(RTRIM(STS_CD)))as STS_CD
,IIF(SRC_STS_ID    IS NULL OR   SRC_STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(SRC_STS_ID))))as SRC_STS_ID
,IIF(STS_DESC    IS NULL OR   STS_DESC='null','N/A' ,LTRIM(RTRIM(STS_DESC)))as STS_DESC
,IIF(STS_LONG_DESC    IS NULL OR   STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(STS_LONG_DESC)))as STS_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null', '01-01-1900',CONCAT(DATEPART(QQ, CRE_TS),'-',DATEPART(YEAR,CRE_TS)))as CRE_TS
,IIF(UPD_TS    IS NULL OR   UPD_TS ='null', '01-01-1900',CONCAT(DATEPART(QQ, UPD_TS ),'-',DATEPART(YEAR,UPD_TS )))as UPD_TS 
FROM [BCMPWMT].[STS_LKP])S
GROUP BY DATA_SRC_ID
------------------DUPLICATE CHECK--------------
SELECT STS_ID,COUNT(*) FROM DIM_STS_LKP_sql_IN1542 GROUP BY STS_ID HAVING COUNT(*)>1

----------------RANDOM RECORD CHECK------------------
SELECT DATA_SRC_ID,STS_DESC FROM DIM_STS_LKP_sql_IN1542 WHERE STS_ID=81
SELECT DATA_SRC_ID,STS_DESC FROM 
(SELECT 
IIF(STS_ID    IS NULL OR   STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_ID))))as STS_ID
,IIF(STS_MASTER_ID    IS NULL OR   STS_MASTER_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_MASTER_ID))))as STS_MASTER_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,CONVERT(INT,LTRIM(RTRIM(DATA_SRC_ID))))as DATA_SRC_ID
,IIF(STS_CD    IS NULL OR   STS_CD='null','N/A' ,LTRIM(RTRIM(STS_CD)))as STS_CD
,IIF(SRC_STS_ID    IS NULL OR   SRC_STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(SRC_STS_ID))))as SRC_STS_ID
,IIF(STS_DESC    IS NULL OR   STS_DESC='null','N/A' ,LTRIM(RTRIM(STS_DESC)))as STS_DESC
,IIF(STS_LONG_DESC    IS NULL OR   STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(STS_LONG_DESC)))as STS_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null', '01-01-1900',CONCAT(DATEPART(QQ, CRE_TS),'-',DATEPART(YEAR,CRE_TS)))as CRE_TS
,IIF(UPD_TS    IS NULL OR   UPD_TS ='null', '01-01-1900',CONCAT(DATEPART(QQ, UPD_TS ),'-',DATEPART(YEAR,UPD_TS )))as UPD_TS 
FROM [BCMPWMT].[STS_LKP])S

 WHERE STS_ID=81
 ------------COLUMN LEVEL CHECK----------------
 SELECT COUNT(*) FROM DIM_STS_LKP_sql_IN1542 T
 LEFT JOIN
(SELECT 
IIF(STS_ID    IS NULL OR   STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_ID))))as STS_ID
,IIF(STS_MASTER_ID    IS NULL OR   STS_MASTER_ID='null',101,CONVERT(INT,LTRIM(RTRIM(STS_MASTER_ID))))as STS_MASTER_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,CONVERT(INT,LTRIM(RTRIM(TENANT_ORG_ID))))as TENANT_ORG_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,CONVERT(INT,LTRIM(RTRIM(DATA_SRC_ID))))as DATA_SRC_ID
,IIF(STS_CD    IS NULL OR   STS_CD='null','N/A' ,LTRIM(RTRIM(STS_CD)))as STS_CD
,IIF(SRC_STS_ID    IS NULL OR   SRC_STS_ID='null',101,CONVERT(INT,LTRIM(RTRIM(SRC_STS_ID))))as SRC_STS_ID
,IIF(STS_DESC    IS NULL OR   STS_DESC='null','N/A' ,LTRIM(RTRIM(STS_DESC)))as STS_DESC
,IIF(STS_LONG_DESC    IS NULL OR   STS_LONG_DESC='null','N/A' ,LTRIM(RTRIM(STS_LONG_DESC)))as STS_LONG_DESC
,IIF(CRE_TS    IS NULL OR   CRE_TS='null', '01-01-1900',CONCAT(DATEPART(QQ, CRE_TS),'-',DATEPART(YEAR,CRE_TS)))as CRE_TS
,IIF(UPD_TS    IS NULL OR   UPD_TS ='null', '01-01-1900',CONCAT(DATEPART(QQ, UPD_TS ),'-',DATEPART(YEAR,UPD_TS )))as UPD_TS 
FROM [BCMPWMT].[STS_LKP])S

ON S.STS_ID  =T.STS_ID 

WHERE S.STS_ID IS NOT NULL AND(
s.STS_ID  <>  t.STS_ID or
s.STS_MASTER_ID  <>  t.STS_MASTER_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.STS_CD  <>  t.STS_CD or
s.SRC_STS_ID  <>  t.SRC_STS_ID or
s.STS_DESC  <>  t.STS_DESC or
s.STS_LONG_DESC  <>  t.STS_LONG_DESC or
s.CRE_TS  <>  t.CRE_TS or
s.UPD_TS  <>  t.UPD_TS )
-----------------------
------------------dim_prod_rpt_hrchy_SQL_IN1542-----------------------
CREATE TABLE dim_prod_rpt_hrchy_SQL_IN1542(

prod_rpt_key    int identity(1,1) primary key	NOT NULL,					
PROD_RPT_HRCHY_ASSOC_ID  integer  NOT NULL				,	
CATLG_ITEM_ID  integer  NOT NULL						,
RPT_HRCHY_ID  integer  NOT NULL							,
RH_SUB_CATEG_NM  integer  NOT NULL						,
CURR_IND  INT  NOT NULL									,
EFF_BEGIN_DT  date  NOT NULL							,
EFF_END_DT  date  NOT NULL								,
PRMRY_CATEG_PATH  varchar(200)  NOT NULL						,
CHAR_PRMRY_CATEG_PATH  varchar(200)  NOT NULL				,	
RH_SUB_CATEG_ID  integer  NOT NULL						,
PRMRY_SHELF_ID  integer  NOT NULL						,


CRE_DT  date  NOT NULL									,
CRE_USER  varCHAR(50)  NOT NULL									,
UPD_TS  datetime  NOT NULL								,
UPD_USER  varchar(50)  NOT NULL			)				
	--------------------------

insert into dim_prod_rpt_hrchy_SQL_IN1542

select 
IIF(PROD_RPT_HRCHY_ASSOC_ID    IS NULL OR   PROD_RPT_HRCHY_ASSOC_ID='null', 101,cast(ltrim(rtrim(PROD_RPT_HRCHY_ASSOC_ID))as int))as PROD_RPT_HRCHY_ASSOC_ID
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101 ,cast(ltrim(rtrim(catlg_item_id))as int))as CATLG_ITEM_ID
,IIF(RPT_HRCHY_ID    IS NULL OR   RPT_HRCHY_ID='null',101 ,cast(ltrim(rtrim(rpt_hrchy_id))as int))as RPT_HRCHY_ID
,IIF(RH_SUB_CATEG_NM    IS NULL OR   RH_SUB_CATEG_NM='null',101 ,cast(ltrim(rtrim(rh_sub_categ_nm))as int))as RH_SUB_CATEG_NM
,IIF(CURR_IND    IS NULL OR   CURR_IND='null',101,cast(ltrim(rtrim(CURR_IND))as INT))as CURR_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',cast(ltrim(rtrim(eff_begin_dt))as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',cast(ltrim(rtrim(eff_end_dt))as date))as EFF_END_DT
,IIF(PRMRY_CATEG_PATH    IS NULL OR   PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(PRMRY_CATEG_PATH)))as PRMRY_CATEG_PATH
,IIF(CHAR_PRMRY_CATEG_PATH    IS NULL OR   CHAR_PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(CHAR_PRMRY_CATEG_PATH)))as CHAR_PRMRY_CATEG_PATH
,IIF(RH_SUB_CATEG_ID    IS NULL OR   RH_SUB_CATEG_ID='null',101 ,cast(ltrim(rtrim(RH_SUB_CATEG_ID))as int))as RH_SUB_CATEG_ID
,IIF(PRMRY_SHELF_ID    IS NULL OR   PRMRY_SHELF_ID='null', 101,cast(ltrim(rtrim(PRMRY_SHELF_ID))as int))as PRMRY_SHELF_ID
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(CRE_USER)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='null','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER

from [BCMPWMT].[PROD_RPT_HRCHY]



ALTER TABLE dim_prod_rpt_hrchy_SQL_IN1542
ADD [RPT_HRCHY_KEY] int
update dim_prod_rpt_hrchy_SQL_IN1542 set [RPT_HRCHY_KEY]= pr.[RPT_HRCHY_KEY] from dim_prod_rpt_hrchy_SQL_IN1542 p 
join dim_rpt_hrchy_SQL_IN1542 pr on  
convert(varchar(50),p.[RPT_HRCHY_ID]) = convert(varchar(50),pr.[RPT_HRCHY_ID])

-------------------------row count--------------9733--
select count(*) from dim_prod_rpt_hrchy_SQL_IN1542

select count(*) from (

select 
IIF(PROD_RPT_HRCHY_ASSOC_ID    IS NULL OR   PROD_RPT_HRCHY_ASSOC_ID='null', 101,cast(ltrim(rtrim(PROD_RPT_HRCHY_ASSOC_ID))as int))as PROD_RPT_HRCHY_ASSOC_ID
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101 ,cast(ltrim(rtrim(catlg_item_id))as int))as CATLG_ITEM_ID
,IIF(RPT_HRCHY_ID    IS NULL OR   RPT_HRCHY_ID='null',101 ,cast(ltrim(rtrim(rpt_hrchy_id))as int))as RPT_HRCHY_ID
,IIF(RH_SUB_CATEG_NM    IS NULL OR   RH_SUB_CATEG_NM='null',101 ,cast(ltrim(rtrim(rh_sub_categ_nm))as int))as RH_SUB_CATEG_NM
,IIF(CURR_IND    IS NULL OR   CURR_IND='null',101,cast(ltrim(rtrim(CURR_IND))as INT))as CURR_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',cast(ltrim(rtrim(eff_begin_dt))as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',cast(ltrim(rtrim(eff_end_dt))as date))as EFF_END_DT
,IIF(PRMRY_CATEG_PATH    IS NULL OR   PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(PRMRY_CATEG_PATH)))as PRMRY_CATEG_PATH
,IIF(CHAR_PRMRY_CATEG_PATH    IS NULL OR   CHAR_PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(CHAR_PRMRY_CATEG_PATH)))as CHAR_PRMRY_CATEG_PATH
,IIF(RH_SUB_CATEG_ID    IS NULL OR   RH_SUB_CATEG_ID='null',101 ,cast(ltrim(rtrim(RH_SUB_CATEG_ID))as int))as RH_SUB_CATEG_ID
,IIF(PRMRY_SHELF_ID    IS NULL OR   PRMRY_SHELF_ID='null', 101,cast(ltrim(rtrim(PRMRY_SHELF_ID))as int))as PRMRY_SHELF_ID
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(CRE_USER)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='null','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER

from [BCMPWMT].[PROD_RPT_HRCHY]

)s

-------------------------------------row count group by --------------------
select * from [BCMPWMT].[PROD_RPT_HRCHY]
select cre_user, count(*) from dim_prod_rpt_hrchy_SQL_IN1542 group by cre_user

select cre_user, count(*) from (

select 
IIF(PROD_RPT_HRCHY_ASSOC_ID    IS NULL OR   PROD_RPT_HRCHY_ASSOC_ID='null', 101,cast(ltrim(rtrim(PROD_RPT_HRCHY_ASSOC_ID))as int))as PROD_RPT_HRCHY_ASSOC_ID
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101 ,cast(ltrim(rtrim(catlg_item_id))as int))as CATLG_ITEM_ID
,IIF(RPT_HRCHY_ID    IS NULL OR   RPT_HRCHY_ID='null',101 ,cast(ltrim(rtrim(rpt_hrchy_id))as int))as RPT_HRCHY_ID
,IIF(RH_SUB_CATEG_NM    IS NULL OR   RH_SUB_CATEG_NM='null',101 ,cast(ltrim(rtrim(rh_sub_categ_nm))as int))as RH_SUB_CATEG_NM
,IIF(CURR_IND    IS NULL OR   CURR_IND='null',101,cast(ltrim(rtrim(CURR_IND))as INT))as CURR_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',cast(ltrim(rtrim(eff_begin_dt))as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',cast(ltrim(rtrim(eff_end_dt))as date))as EFF_END_DT
,IIF(PRMRY_CATEG_PATH    IS NULL OR   PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(PRMRY_CATEG_PATH)))as PRMRY_CATEG_PATH
,IIF(CHAR_PRMRY_CATEG_PATH    IS NULL OR   CHAR_PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(CHAR_PRMRY_CATEG_PATH)))as CHAR_PRMRY_CATEG_PATH
,IIF(RH_SUB_CATEG_ID    IS NULL OR   RH_SUB_CATEG_ID='null',101 ,cast(ltrim(rtrim(RH_SUB_CATEG_ID))as int))as RH_SUB_CATEG_ID
,IIF(PRMRY_SHELF_ID    IS NULL OR   PRMRY_SHELF_ID='null', 101,cast(ltrim(rtrim(PRMRY_SHELF_ID))as int))as PRMRY_SHELF_ID
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(CRE_USER)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='null','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER

from [BCMPWMT].[PROD_RPT_HRCHY]

)s group by cre_user
----------------------------distinct---------------------

select PROD_RPT_HRCHY_ASSOC_ID , count(*) from dim_prod_rpt_hrchy_SQL_IN1542 group by PROD_RPT_HRCHY_ASSOC_ID having count(*)>1
--------------------------random record---------------------------
select * from [BCMPWMT].[PROD_RPT_HRCHY]
select cre_user, catlg_item_id from dim_prod_rpt_hrchy_SQL_IN1542  where PROD_RPT_HRCHY_ASSOC_ID =331453563

select cre_user,catlg_item_id from (

select 
IIF(PROD_RPT_HRCHY_ASSOC_ID    IS NULL OR   PROD_RPT_HRCHY_ASSOC_ID='null', 101,cast(ltrim(rtrim(PROD_RPT_HRCHY_ASSOC_ID))as int))as PROD_RPT_HRCHY_ASSOC_ID
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101 ,cast(ltrim(rtrim(catlg_item_id))as int))as CATLG_ITEM_ID
,IIF(RPT_HRCHY_ID    IS NULL OR   RPT_HRCHY_ID='null',101 ,cast(ltrim(rtrim(rpt_hrchy_id))as int))as RPT_HRCHY_ID
,IIF(RH_SUB_CATEG_NM    IS NULL OR   RH_SUB_CATEG_NM='null',101 ,cast(ltrim(rtrim(rh_sub_categ_nm))as int))as RH_SUB_CATEG_NM
,IIF(CURR_IND    IS NULL OR   CURR_IND='null',101,cast(ltrim(rtrim(CURR_IND))as INT))as CURR_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',cast(ltrim(rtrim(eff_begin_dt))as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',cast(ltrim(rtrim(eff_end_dt))as date))as EFF_END_DT
,IIF(PRMRY_CATEG_PATH    IS NULL OR   PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(PRMRY_CATEG_PATH)))as PRMRY_CATEG_PATH
,IIF(CHAR_PRMRY_CATEG_PATH    IS NULL OR   CHAR_PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(CHAR_PRMRY_CATEG_PATH)))as CHAR_PRMRY_CATEG_PATH
,IIF(RH_SUB_CATEG_ID    IS NULL OR   RH_SUB_CATEG_ID='null',101 ,cast(ltrim(rtrim(RH_SUB_CATEG_ID))as int))as RH_SUB_CATEG_ID
,IIF(PRMRY_SHELF_ID    IS NULL OR   PRMRY_SHELF_ID='null', 101,cast(ltrim(rtrim(PRMRY_SHELF_ID))as int))as PRMRY_SHELF_ID
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(CRE_USER)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='null','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER

from [BCMPWMT].[PROD_RPT_HRCHY]

)s where PROD_RPT_HRCHY_ASSOC_ID =331453563

-------------------------------column level check----------------------

select count(*) from dim_prod_rpt_hrchy_SQL_IN1542  t left join

(

select 
IIF(PROD_RPT_HRCHY_ASSOC_ID    IS NULL OR   PROD_RPT_HRCHY_ASSOC_ID='null', 101,cast(ltrim(rtrim(PROD_RPT_HRCHY_ASSOC_ID))as int))as PROD_RPT_HRCHY_ASSOC_ID
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101 ,cast(ltrim(rtrim(catlg_item_id))as int))as CATLG_ITEM_ID
,IIF(RPT_HRCHY_ID    IS NULL OR   RPT_HRCHY_ID='null',101 ,cast(ltrim(rtrim(rpt_hrchy_id))as int))as RPT_HRCHY_ID
,IIF(RH_SUB_CATEG_NM    IS NULL OR   RH_SUB_CATEG_NM='null',101 ,cast(ltrim(rtrim(rh_sub_categ_nm))as int))as RH_SUB_CATEG_NM
,IIF(CURR_IND    IS NULL OR   CURR_IND='null',101,cast(ltrim(rtrim(CURR_IND))as INT))as CURR_IND
,IIF(EFF_BEGIN_DT    IS NULL OR   EFF_BEGIN_DT='null','01-01-1900',cast(ltrim(rtrim(eff_begin_dt))as date))as EFF_BEGIN_DT
,IIF(EFF_END_DT    IS NULL OR   EFF_END_DT='null','01-01-1900',cast(ltrim(rtrim(eff_end_dt))as date))as EFF_END_DT
,IIF(PRMRY_CATEG_PATH    IS NULL OR   PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(PRMRY_CATEG_PATH)))as PRMRY_CATEG_PATH
,IIF(CHAR_PRMRY_CATEG_PATH    IS NULL OR   CHAR_PRMRY_CATEG_PATH='null','N/A' ,ltrim(rtrim(CHAR_PRMRY_CATEG_PATH)))as CHAR_PRMRY_CATEG_PATH
,IIF(RH_SUB_CATEG_ID    IS NULL OR   RH_SUB_CATEG_ID='null',101 ,cast(ltrim(rtrim(RH_SUB_CATEG_ID))as int))as RH_SUB_CATEG_ID
,IIF(PRMRY_SHELF_ID    IS NULL OR   PRMRY_SHELF_ID='null', 101,cast(ltrim(rtrim(PRMRY_SHELF_ID))as int))as PRMRY_SHELF_ID
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT))as date))as CRE_DT
,IIF(CRE_USER    IS NULL OR   CRE_USER='null','N/A' ,ltrim(rtrim(CRE_USER)))as CRE_USER
,IIF(UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS))as datetime))as UPD_TS
,IIF(UPD_USER    IS NULL OR   UPD_USER='null','N/A',(ltrim(rtrim(UPD_USER))))as UPD_USER

from [BCMPWMT].[PROD_RPT_HRCHY]

)s 
on s.PROD_RPT_HRCHY_ASSOC_ID  =t. PROD_RPT_HRCHY_ASSOC_ID 
where s.PROD_RPT_HRCHY_ASSOC_ID is not null and (
s.PROD_RPT_HRCHY_ASSOC_ID  <>  t.PROD_RPT_HRCHY_ASSOC_ID or
s.CATLG_ITEM_ID  <>  t.CATLG_ITEM_ID or
s.RPT_HRCHY_ID  <>  t.RPT_HRCHY_ID or
s.RH_SUB_CATEG_NM  <>  t.RH_SUB_CATEG_NM or
s.CURR_IND  <>  t.CURR_IND or
s.EFF_BEGIN_DT  <>  t.EFF_BEGIN_DT or
s.EFF_END_DT  <>  t.EFF_END_DT or
s.PRMRY_CATEG_PATH  <>  t.PRMRY_CATEG_PATH or
s.CHAR_PRMRY_CATEG_PATH  <>  t.CHAR_PRMRY_CATEG_PATH or
s.RH_SUB_CATEG_ID  <>  t.RH_SUB_CATEG_ID or
s.PRMRY_SHELF_ID  <>  t.PRMRY_SHELF_ID or

s.CRE_DT  <>  t.CRE_DT or
s.CRE_USER  <>  t.CRE_USER or
s.UPD_TS  <>  t.UPD_TS or
s.UPD_USER  <>  t.UPD_USER 
)
-------------------------------------------------------------------------------------------
SELECT * FROM [BCMPWMT].[CUST_CNTCT]

create table DIM_CUST_CNTCT_SQL_IN1542(
CUST_CNTCT_KEY  int identity(1,1) primary key	NOT NULL			,
CNTCT_ID  int  NOT NULL						,
TENANT_ORG_ID  int  NOT NULL				,
SRC_CNTCT_ID  varchar(50)  NOT NULL			,	
DATA_SRC_ID  int  NOT NULL					,
ACCT_ID  int  NOT NULL						,
ADDR_ID  bigint  NOT NULL						,
PHONE_ID  bigint  NOT NULL						,
EMAIL_ID  varchar(250)  NOT NULL			,	
ADDR_ZONE_ID  int  NOT NULL					,
DELTD_YN  char(1)  NOT NULL					,
CRE_DT  Date  NOT NULL						,
UPD_TS  nvarchar(255)  NOT NULL				
		
)
drop table DIM_CUST_CNTCT_SQL_IN1542
INSERT INTO DIM_CUST_CNTCT_SQL_IN1542 
SELECT 


IIF(CNTCT_ID    IS NULL OR   CNTCT_ID='null',101,cast(ltrim(rtrim(Cntct_id)) as int))as CNTCT_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_org_id)) as int))as TENANT_ORG_ID
,IIF(SRC_CNTCT_ID    IS NULL OR   SRC_CNTCT_ID='null','N/A',ltrim(rtrim(SRC_CNTCT_ID)))as SRC_CNTCT_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID
,IIF(ACCT_ID    IS NULL OR   ACCT_ID='null',101,cast(ltrim(rtrim(Acct_id)) as int))as ACCT_ID
,IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(Addr_id)) as bigint))as ADDR_ID
,IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,cast(ltrim(rtrim(Phone_id)) as bigint))as PHONE_ID
,IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null','N/A',ltrim(rtrim(Email_ID)))as EMAIL_ID
,IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID='null',101,cast(ltrim(rtrim(Addr_Zone_Id))as int))as ADDR_ZONE_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT
,IIF(UPD_TS    IS NULL OR   UPD_TS='null',format(cast('01-01-1990' as datetime),'dd/MMMM/yyyy'), format(cast(UPD_TS as datetime),'dd/MMMM/yyyy'))as UPD_TS



FROM [BCMPWMT].[CUST_CNTCT]


DIM_CUST_PHONE_SQL_IN1542
DIM_CUST_EMAIL_SQL_IN1542
CUST_PHONE_KEY

drop table DIM_CUST_CNTCT_SQL_IN1542 
ALTER TABLE DIM_CUST_CNTCT_SQL_IN1542 ADD [CUST_PHONE_KEY] INT

 UPDATE DIM_CUST_CNTCT_SQL_IN1542 SET DIM_CUST_CNTCT_SQL_IN1542 .[CUST_PHONE_KEY]= 
DIM_CUST_PHONE_SQL_IN1542.[CUST_PHONE_KEY] 
 FROM
DIM_CUST_CNTCT_SQL_IN1542 JOIN DIM_CUST_PHONE_SQL_IN1542 ON
 CONVERT(VARCHAR(50),DIM_CUST_CNTCT_SQL_IN1542.PHONE_ID)=CONVERT(VARCHAR(50),
DIM_CUST_PHONE_SQL_IN1542.PHONE_ID)

---------------------------------------------------------------
SELECT 

CUST_PHONE_KEY,
Cust_email_key,
cust_acct_key,
addr_zone_id_key 
FROM DIM_CUST_CNTCT_SQL_IN1542

SELECT addr_zone_id_key  FROM DIM_CUST_CNTCT_SQL_IN1542
ALTER TABLE DIM_CUST_CNTCT_SQL_IN1542 ADD [Cust_email_key] INT

 UPDATE DIM_CUST_CNTCT_SQL_IN1542 SET DIM_CUST_CNTCT_SQL_IN1542 .[Cust_email_key ]= 
 DIM_CUST_EMAIL_SQL_IN1542.[Cust_email_key] 
 FROM
DIM_CUST_CNTCT_SQL_IN1542 JOIN  DIM_CUST_EMAIL_SQL_IN1542 ON
 CONVERT(VARCHAR(50),DIM_CUST_CNTCT_SQL_IN1542.EMAIL_ID )=CONVERT(VARCHAR(50),
 DIM_CUST_EMAIL_SQL_IN1542.EMAIL_ID )

 ----------------------------------------------
 ALTER TABLE DIM_CUST_CNTCT_SQL_IN1542 ADD [ addr_zone_id_key  ] INT

 UPDATE DIM_CUST_CNTCT_SQL_IN1542 SET DIM_CUST_CNTCT_SQL_IN1542 .[ addr_zone_id_key   ]= 
 dim_cust_addr_zone_SQL_IN1542.[addr_zone_id_key  ] 
 FROM
DIM_CUST_CNTCT_SQL_IN1542 JOIN   dim_cust_addr_zone_SQL_IN1542 ON
 CONVERT(VARCHAR(50),DIM_CUST_CNTCT_SQL_IN1542.ADDR_ZONE_ID  )=CONVERT(VARCHAR(50),
 dim_cust_addr_zone_SQL_IN1542.ADDR_ZONE_ID  )
 --------------------------------

-------------------------------------------
 ALTER TABLE DIM_CUST_CNTCT_SQL_IN1542 ADD [ cust_acct_key  ] INT

 UPDATE DIM_CUST_CNTCT_SQL_IN1542 SET DIM_CUST_CNTCT_SQL_IN1542 .[ cust_acct_key  ]= 
  dim_CUST_ACCT_SQL_IN1542.[cust_acct_key] 
 FROM
DIM_CUST_CNTCT_SQL_IN1542 JOIN     dim_CUST_ACCT_SQL_IN1542 ON
 CONVERT(VARCHAR(50),DIM_CUST_CNTCT_SQL_IN1542.ACCT_ID )=CONVERT(VARCHAR(50),
  dim_CUST_ACCT_SQL_IN1542.ACCT_ID  )

  UPDATE DIM_CUST_CNTCT_SQL_IN1542
  SET [ cust_acct_key  ]=ISNULL([ cust_acct_key  ],101),
  [ addr_zone_id_key  ] =ISNULL([ addr_zone_id_key  ],101),
  [Cust_email_key]=ISNULL([Cust_email_key],101),
  [CUST_PHONE_KEY]=ISNULL([CUST_PHONE_KEY],101)

 -------------------------------------------------------

select * from DIM_CUST_CNTCT_SQL_IN1542

 SELECT * FROM DIM_CUST_CNTCT
 SELECT DISTINCT 
[addr_zone_id_key] FROM  DIM_CUST_CNTCT_SQL_IN1542
 


 SELECT * FROM DIM_CUST_CNTCT_SQL_IN1542

  UPDATE DIM_CUST_CNTCT_SQL_IN1542 SET [ addr_zone_id_key ]=AZ.[addr_zone_id_key] 
 FROM DIM_CUST_CNTCT_SQL_IN1542 CC JOIN
 dim_cust_addr_zone_SQL_IN1542 AZ
 ON CONVERT(VARCHAR(50),CC.ADDR_ZONE_ID)= CONVERT(VARCHAR(50),AZ.ADDR_ZONE_ID)



 UPDATE  DIM_CUST_CNTCT_SQL_IN1542
 SET Cust_email_key=  ISNULL(Cust_email_key,101),
 CUST_PHONE_KEY=ISNULL(CUST_PHONE_KEY,101),
 addr_zone_ID_key=ISNULL(  addr_zone_ID_key,101),
cust_acct_key=ISNULL(cust_acct_key,101)


SELECT CUST_ACCT_KEY,CUST_PHONE_KEY,ADDR_ZONE_ID_KEY,CUST_EMAIL_KEY 
FROM DIM_CUST_CNTCT_SQL_IN1542
SELECT 
 cust_acct_key  ,
 addr_zone_id_key  
 FROM  DIM_CUST_CNTCT_SQL_IN1542

SELECT * FROM DIM_CUST_CNTCT_SQL_IN1542
 cust_addr_zone_key
cust_phone_key
Cust_email_key
ciust_accnt_key
DROP TABLE DIM_CUST_CNTCT_SQL_IN1542
--------------------------ROW COUNT----------------------


SELECT COUNT(*) FROM DIM_CUST_CNTCT_SQL_IN1542
SELECT COUNT(*) FROM 
(SELECT 
IIF(CNTCT_ID    IS NULL OR   CNTCT_ID='null',101,cast(ltrim(rtrim(Cntct_id)) as int))as CNTCT_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_org_id)) as int))as TENANT_ORG_ID
,IIF(SRC_CNTCT_ID    IS NULL OR   SRC_CNTCT_ID='null','N/A',ltrim(rtrim(SRC_CNTCT_ID)))as SRC_CNTCT_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID
,IIF(ACCT_ID    IS NULL OR   ACCT_ID='null',101,cast(ltrim(rtrim(Acct_id)) as int))as ACCT_ID
,IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(Addr_id)) as bigint))as ADDR_ID
,IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,cast(ltrim(rtrim(Phone_id)) as bigint))as PHONE_ID
,IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null','N/A',ltrim(rtrim(Email_ID)))as EMAIL_ID
,IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID='null',101,cast(ltrim(rtrim(Addr_Zone_Id))as int))as ADDR_ZONE_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT
,IIF(UPD_TS    IS NULL OR   UPD_TS='null',format(cast('01-01-1990' as datetime),'dd/MMMM/yyyy'), format(cast(UPD_TS as datetime),'dd/MMMM/yyyy'))as UPD_TS
FROM [BCMPWMT].[CUST_CNTCT]
)S
------------------------ROW COUNT GROUP BY------------------

SELECT DATA_SRC_ID ,COUNT(*) FROM DIM_CUST_CNTCT_SQL_IN1542 GROUP BY DATA_SRC_ID 
SELECT DATA_SRC_ID  ,COUNT(*) FROM 
(SELECT 
IIF(CNTCT_ID    IS NULL OR   CNTCT_ID='null',101,cast(ltrim(rtrim(Cntct_id)) as int))as CNTCT_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_org_id)) as int))as TENANT_ORG_ID
,IIF(SRC_CNTCT_ID    IS NULL OR   SRC_CNTCT_ID='null','N/A',ltrim(rtrim(SRC_CNTCT_ID)))as SRC_CNTCT_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID
,IIF(ACCT_ID    IS NULL OR   ACCT_ID='null',101,cast(ltrim(rtrim(Acct_id)) as int))as ACCT_ID
,IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(Addr_id)) as bigint))as ADDR_ID
,IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,cast(ltrim(rtrim(Phone_id)) as bigint))as PHONE_ID
,IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null','N/A',ltrim(rtrim(Email_ID)))as EMAIL_ID
,IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID='null',101,cast(ltrim(rtrim(Addr_Zone_Id))as int))as ADDR_ZONE_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT
,IIF(UPD_TS    IS NULL OR   UPD_TS='null',format(cast('01-01-1990' as datetime),'dd/MMMM/yyyy'), format(cast(UPD_TS as datetime),'dd/MMMM/yyyy'))as UPD_TS
FROM [BCMPWMT].[CUST_CNTCT]
)S GROUP BY DATA_SRC_ID 
----------------------------DUPLICATE-------------
SELECT CNTCT_ID  ,COUNT(*) FROM DIM_CUST_CNTCT_SQL_IN1542 GROUP BY CNTCT_ID  HAVING COUNT(*)>1
-------------------------RANDOM RECORD---------------
SELECT EMAIL_ID  ,PHONE_ID  FROM DIM_CUST_CNTCT_SQL_IN1542 WHERE CNTCT_ID =419459891

SELECT  EMAIL_ID  ,PHONE_ID  FROM 
(SELECT 
IIF(CNTCT_ID    IS NULL OR   CNTCT_ID='null',101,cast(ltrim(rtrim(Cntct_id)) as int))as CNTCT_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_org_id)) as int))as TENANT_ORG_ID
,IIF(SRC_CNTCT_ID    IS NULL OR   SRC_CNTCT_ID='null','N/A',ltrim(rtrim(SRC_CNTCT_ID)))as SRC_CNTCT_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID
,IIF(ACCT_ID    IS NULL OR   ACCT_ID='null',101,cast(ltrim(rtrim(Acct_id)) as int))as ACCT_ID
,IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(Addr_id)) as bigint))as ADDR_ID
,IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,cast(ltrim(rtrim(Phone_id)) as bigint))as PHONE_ID
,IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null','N/A',ltrim(rtrim(Email_ID)))as EMAIL_ID
,IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID='null',101,cast(ltrim(rtrim(Addr_Zone_Id))as int))as ADDR_ZONE_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT
,IIF(UPD_TS    IS NULL OR   UPD_TS='null',format(cast('01-01-1990' as datetime),'dd/MMMM/yyyy'), format(cast(UPD_TS as datetime),'dd/MMMM/yyyy'))as UPD_TS
FROM [BCMPWMT].[CUST_CNTCT]
)S  WHERE CNTCT_ID =419459891
----------------------------------------COLUMN LEVEL CHECK-----------------

SELECT COUNT(*) FROM DIM_CUST_CNTCT_SQL_IN1542 T LEFT JOIN(
SELECT 
IIF(CNTCT_ID    IS NULL OR   CNTCT_ID='null',101,cast(ltrim(rtrim(Cntct_id)) as int))as CNTCT_ID
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(Tenant_org_id)) as int))as TENANT_ORG_ID
,IIF(SRC_CNTCT_ID    IS NULL OR   SRC_CNTCT_ID='null','N/A',ltrim(rtrim(SRC_CNTCT_ID)))as SRC_CNTCT_ID
,IIF(DATA_SRC_ID    IS NULL OR   DATA_SRC_ID='null',101,cast(ltrim(rtrim(Data_src_id)) as int))as DATA_SRC_ID
,IIF(ACCT_ID    IS NULL OR   ACCT_ID='null',101,cast(ltrim(rtrim(Acct_id)) as int))as ACCT_ID
,IIF(ADDR_ID    IS NULL OR   ADDR_ID='null',101,cast(ltrim(rtrim(Addr_id)) as bigint))as ADDR_ID
,IIF(PHONE_ID    IS NULL OR   PHONE_ID='null',101,cast(ltrim(rtrim(Phone_id)) as bigint))as PHONE_ID
,IIF(EMAIL_ID    IS NULL OR   EMAIL_ID='null','N/A',ltrim(rtrim(Email_ID)))as EMAIL_ID
,IIF(ADDR_ZONE_ID    IS NULL OR   ADDR_ZONE_ID='null',101,cast(ltrim(rtrim(Addr_Zone_Id))as int))as ADDR_ZONE_ID
,IIF(DELTD_YN    IS NULL OR   DELTD_YN='null','N/A' ,cast(ltrim(rtrim(Deltd_yn)) as char)) as DELTD_YN
,IIF(CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(Cre_Dt))as Date ))as CRE_DT
,IIF(UPD_TS    IS NULL OR   UPD_TS='null',format(cast('01-01-1990' as datetime),'dd/MMMM/yyyy'), format(cast(UPD_TS as datetime),'dd/MMMM/yyyy'))as UPD_TS
FROM [BCMPWMT].[CUST_CNTCT]
)S  
ON T.CNTCT_ID  =S.CNTCT_ID 
WHERE S.CNTCT_ID  IS NOT NULL AND (

s.CNTCT_ID  <>  t.CNTCT_ID or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.SRC_CNTCT_ID  <>  t.SRC_CNTCT_ID or
s.DATA_SRC_ID  <>  t.DATA_SRC_ID or
s.ACCT_ID  <>  t.ACCT_ID or
s.ADDR_ID  <>  t.ADDR_ID or
s.PHONE_ID  <>  t.PHONE_ID or
s.EMAIL_ID  <>  t.EMAIL_ID or
s.ADDR_ZONE_ID  <>  t.ADDR_ZONE_ID or
s.DELTD_YN  <>  t.DELTD_YN or
s.CRE_DT  <>  t.CRE_DT or
s.UPD_TS  <>  t.UPD_TS )


----------------------------------------------------------
CREATE TABLE Dim_OFFR_SQL_IN1542(                 
OFFER_PK   VARCHAR(50) PRIMARY KEY  NOT NULL			   ,
CATLG_ITEM_ID   bigint  NOT NULL 		   ,
SRC_ORG_CD   bigint  NOT NULL			   ,
TENANT_ORG_ID   bigint  NOT NULL		   ,
SRC_ITEM_KEY   bigint  NOT NULL			   ,
UPC   VARCHAR(50)  NOT NULL					   ,
WM_ITEM_NUM   BIGint  NOT NULL				   ,
WM_UPC   VARCHAR(50)  NOT NULL				   ,
OFFR_NM   VARCHAR(250)  NOT NULL				   ,
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
		
OFFR_KEY   	 int identity(1,1) NOT NULL	   )
										   
		DROP TABLE 	Dim_OFFR_SQL_IN1542
	"ALTER TABLE DIM_OFFR ADD [prod_key] INT
 UPDATE DIM_OFFR SET PROD_KEY=P.PROD_KEY
 FROM DIM_OFFR D LEFT JOIN DIM_PROD P ON
 D.CATLG_ITEM_ID=P.CATLG_ITEM_ID
"
INSERT INTO Dim_OFFR_SQL_IN1542
SELECT 
IIF(OFFER_PK    IS NULL OR   OFFER_PK='null', 'N/A',LTRIM(RTRIM(OFFER_PK)))as OFFER_PK
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101,CAST(LTRIM(RTRIM(CATLG_ITEM_ID) )AS BIGINT))As CATLG_ITEM_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null',101,CAST(LTRIM(RTRIM(SRC_ORG_CD) )AS BIGINT))as SRC_ORG_CD
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(TENANT_ORG_ID ))AS BIGINT))as TENANT_ORG_ID
,IIF(SRC_ITEM_KEY    IS NULL OR   SRC_ITEM_KEY='null',101,cast(ltrim(rtrim(SRC_ITEM_KEY) )as bigint))as SRC_ITEM_KEY
,IIF(UPC    IS NULL OR   UPC='null','N/A' ,LTRIM(RTRIM(UPC)))as UPC
,IIF(WM_ITEM_NUM    IS NULL OR   WM_ITEM_NUM='null',101,CAST(LTRIM(RTRIM(WM_ITEM_NUM))AS BIGINT))as WM_ITEM_NUM
,IIF(WM_UPC    IS NULL OR   WM_UPC='null','N/A' ,LTRIM(RTRIM(WM_UPC)))as WM_UPC
,IIF(OFFR_NM    IS NULL OR   OFFR_NM='null', 'N/A',LTRIM(RTRIM(OFFR_NM)))as OFFR_NM
,IIF(OFFR_START_TS like '%[A-Z]%'   or OFFR_START_TS    IS NULL OR   OFFR_START_TS='null','N/A',FORMAT( CAST(OFFR_START_TS AS DATEtime),'yyMMdd'))as OFFR_START_TS
,IIF(OFFR_START_DT    IS NULL OR   OFFR_START_DT='null','01-01-1900',cast(ltrim(rtrim(OFFR_START_DT ))AS DATETIME))as OFFR_START_DT
,IIF(OFFR_END_TS    IS NULL OR   OFFR_END_TS='null','01-01-1900',cast(ltrim(rtrim(OFFR_END_TS ))AS DATETIME))as OFFR_END_TS
,IIF(OFFR_TYPE_ID    IS NULL OR   OFFR_TYPE_ID='null','N/A', LTRIM(RTRIM(OFFR_TYPE_ID)))as OFFR_TYPE_ID
,IIF(COMM_PCT    IS NULL OR   COMM_PCT='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(COMM_PCT))))as COMM_PCT
,IIF(SLR_OFFR_ID    IS NULL OR   SLR_OFFR_ID='null','N/A', LTRIM(RTRIM(SLR_OFFR_ID)))as SLR_OFFR_ID
,IIF(PRTNR_ID    IS NULL OR   PRTNR_ID='null','N/A' ,LTRIM(RTRIM(PRTNR_ID)))as PRTNR_ID
,IIF(START_PRICE  LIKE '%[A-Z]%' OR START_PRICE IS NULL OR   START_PRICE='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(START_PRICE))))as START_PRICE
,IIF(LAST_PRICE_UPD_TS    IS NULL OR   LAST_PRICE_UPD_TS='null','01-01-1900',cast(ltrim(rtrim(LAST_PRICE_UPD_TS ))AS DATETIME))as LAST_PRICE_UPD_TS
,IIF(CURR_PRICE NOT LIKE '%.%' OR CURR_PRICE    IS NULL OR   CURR_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_PRICE))))as CURR_PRICE
,IIF(CURR_SUGG_PRICE  NOT LIKE '%.%'OR CURR_SUGG_PRICE    IS NULL OR   CURR_SUGG_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_SUGG_PRICE))))as CURR_SUGG_PRICE
,IIF(BASE_ITEM_PRICE NOT LIKE '%.%'OR BASE_ITEM_PRICE    IS NULL OR   BASE_ITEM_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_ITEM_PRICE))))as BASE_ITEM_PRICE
,IIF(BASE_SUGG_PRICE NOT LIKE '%.%' OR BASE_SUGG_PRICE    IS NULL OR   BASE_SUGG_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_SUGG_PRICE))))as BASE_SUGG_PRICE
,IIF(UOM    IS NULL OR   UOM='null','N/A', LTRIM(RTRIM(UOM)))as UOM
,IIF(TAXABLE_IND LIKE '%[.]%' OR TAXABLE_IND    IS NULL OR   TAXABLE_IND='null',101,cast(ltrim(rtrim(taxable_ind))as int))as TAXABLE_IND
,IIF(GIFT_WRAP_IND    IS NULL OR   GIFT_WRAP_IND='null',101,cast(ltrim(rtrim(gift_wrap_ind))as int))as GIFT_WRAP_IND
,IIF(SHIP_ALONE_IND    IS NULL OR   SHIP_ALONE_IND='null',101,cast(ltrim(rtrim(ship_alone_ind))as int))as SHIP_ALONE_IND
,IIF(FREE_RETURNS_IND    LIKE '%[0-9]%' OR FREE_RETURNS_IND    IS NULL OR   FREE_RETURNS_IND='null',101,cast(ltrim(rtrim(free_retuRns_ind))as int))as FREE_RETURNS_IND
,IIF(SLR_UPC    IS NULL OR   SLR_UPC='null', 'N/A',LTRIM(RTRIM(SLR_UPC)))as SLR_UPC
,IIF(SHIPTOSTORE_IND   LIKE '%[0-9]%' OR  SHIPTOSTORE_IND    IS NULL OR   SHIPTOSTORE_IND='null',101,cast(ltrim(rtrim(shiptostore_ind))as int))as SHIPTOSTORE_IND
,IIF(PIP_IND    IS NULL OR   PIP_IND='null',101,cast(ltrim(rtrim(pip_ind))as int))as PIP_IND
,IIF(PRE_ORDER_IND    IS NULL OR   PRE_ORDER_IND='null',101,cast(ltrim(rtrim(pre_order_ind))as int))as PRE_ORDER_IND
,IIF(CRE_DT    NOT LIKE '%[/]%' OR  CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT

,IIF(UPD_TS     NOT LIKE '%[/]%'  OR UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS ))AS DATETIME))as UPD_TS

FROM
[BCMPWMT].[OFFR]

dim_prod_SQL_IN1542(
prod_key  


ALTER TABLE Dim_OFFR_SQL_IN1542 ADD [prod_key] INT
 UPDATE  Dim_OFFR_SQL_IN1542 SET PROD_KEY=P.PROD_KEY
 FROM Dim_OFFR_SQL_IN1542 D LEFT JOIN dim_prod_SQL_IN1542 P ON
 D.CATLG_ITEM_ID=P.CATLG_ITEM_ID
 UPDATE  Dim_OFFR_SQL_IN1542  SET [prod_key] =ISNULL([prod_key],101)
 SELECT * FROM Dim_OFFR_SQL_IN1542

---------------------ROW COUNT---------------13464--
SELECT COUNT(*) FROM Dim_OFFR_SQL_IN1542 
SELECT COUNT(*) FROM(

SELECT 
IIF(OFFER_PK    IS NULL OR   OFFER_PK='null', 'N/A',LTRIM(RTRIM(OFFER_PK)))as OFFER_PK
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101,CAST(LTRIM(RTRIM(CATLG_ITEM_ID) )AS BIGINT))As CATLG_ITEM_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null',101,CAST(LTRIM(RTRIM(SRC_ORG_CD) )AS BIGINT))as SRC_ORG_CD
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(TENANT_ORG_ID ))AS BIGINT))as TENANT_ORG_ID
,IIF(SRC_ITEM_KEY    IS NULL OR   SRC_ITEM_KEY='null',101,cast(ltrim(rtrim(SRC_ITEM_KEY) )as bigint))as SRC_ITEM_KEY
,IIF(UPC    IS NULL OR   UPC='null','N/A' ,LTRIM(RTRIM(UPC)))as UPC
,IIF(WM_ITEM_NUM    IS NULL OR   WM_ITEM_NUM='null',101,CAST(LTRIM(RTRIM(WM_ITEM_NUM))AS BIGINT))as WM_ITEM_NUM
,IIF(WM_UPC    IS NULL OR   WM_UPC='null','N/A' ,LTRIM(RTRIM(WM_UPC)))as WM_UPC
,IIF(OFFR_NM    IS NULL OR   OFFR_NM='null', 'N/A',LTRIM(RTRIM(OFFR_NM)))as OFFR_NM
,IIF(OFFR_START_TS like '%[A-Z]%'   or OFFR_START_TS    IS NULL OR   OFFR_START_TS='null','N/A',FORMAT( CAST(OFFR_START_TS AS DATEtime),'yyMMdd'))as OFFR_START_TS
,IIF(OFFR_START_DT    IS NULL OR   OFFR_START_DT='null','01-01-1900',cast(ltrim(rtrim(OFFR_START_DT ))AS DATETIME))as OFFR_START_DT
,IIF(OFFR_END_TS    IS NULL OR   OFFR_END_TS='null','01-01-1900',cast(ltrim(rtrim(OFFR_END_TS ))AS DATETIME))as OFFR_END_TS
,IIF(OFFR_TYPE_ID    IS NULL OR   OFFR_TYPE_ID='null','N/A', LTRIM(RTRIM(OFFR_TYPE_ID)))as OFFR_TYPE_ID
,IIF(COMM_PCT    IS NULL OR   COMM_PCT='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(COMM_PCT))))as COMM_PCT
,IIF(SLR_OFFR_ID    IS NULL OR   SLR_OFFR_ID='null','N/A', LTRIM(RTRIM(SLR_OFFR_ID)))as SLR_OFFR_ID
,IIF(PRTNR_ID    IS NULL OR   PRTNR_ID='null','N/A' ,LTRIM(RTRIM(PRTNR_ID)))as PRTNR_ID
,IIF(START_PRICE  LIKE '%[A-Z]%' OR START_PRICE IS NULL OR   START_PRICE='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(START_PRICE))))as START_PRICE
,IIF(LAST_PRICE_UPD_TS    IS NULL OR   LAST_PRICE_UPD_TS='null','01-01-1900',cast(ltrim(rtrim(LAST_PRICE_UPD_TS ))AS DATETIME))as LAST_PRICE_UPD_TS
,IIF(CURR_PRICE NOT LIKE '%.%' OR CURR_PRICE    IS NULL OR   CURR_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_PRICE))))as CURR_PRICE
,IIF(CURR_SUGG_PRICE  NOT LIKE '%.%'OR CURR_SUGG_PRICE    IS NULL OR   CURR_SUGG_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_SUGG_PRICE))))as CURR_SUGG_PRICE
,IIF(BASE_ITEM_PRICE NOT LIKE '%.%'OR BASE_ITEM_PRICE    IS NULL OR   BASE_ITEM_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_ITEM_PRICE))))as BASE_ITEM_PRICE
,IIF(BASE_SUGG_PRICE NOT LIKE '%.%' OR BASE_SUGG_PRICE    IS NULL OR   BASE_SUGG_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_SUGG_PRICE))))as BASE_SUGG_PRICE
,IIF(UOM    IS NULL OR   UOM='null','N/A', LTRIM(RTRIM(UOM)))as UOM
,IIF(TAXABLE_IND LIKE '%[.]%' OR TAXABLE_IND    IS NULL OR   TAXABLE_IND='null',101,cast(ltrim(rtrim(taxable_ind))as int))as TAXABLE_IND
,IIF(GIFT_WRAP_IND    IS NULL OR   GIFT_WRAP_IND='null',101,cast(ltrim(rtrim(gift_wrap_ind))as int))as GIFT_WRAP_IND
,IIF(SHIP_ALONE_IND    IS NULL OR   SHIP_ALONE_IND='null',101,cast(ltrim(rtrim(ship_alone_ind))as int))as SHIP_ALONE_IND
,IIF(FREE_RETURNS_IND    LIKE '%[0-9]%' OR FREE_RETURNS_IND    IS NULL OR   FREE_RETURNS_IND='null',101,cast(ltrim(rtrim(free_retuRns_ind))as int))as FREE_RETURNS_IND
,IIF(SLR_UPC    IS NULL OR   SLR_UPC='null', 'N/A',LTRIM(RTRIM(SLR_UPC)))as SLR_UPC
,IIF(SHIPTOSTORE_IND   LIKE '%[0-9]%' OR  SHIPTOSTORE_IND    IS NULL OR   SHIPTOSTORE_IND='null',101,cast(ltrim(rtrim(shiptostore_ind))as int))as SHIPTOSTORE_IND
,IIF(PIP_IND    IS NULL OR   PIP_IND='null',101,cast(ltrim(rtrim(pip_ind))as int))as PIP_IND
,IIF(PRE_ORDER_IND    IS NULL OR   PRE_ORDER_IND='null',101,cast(ltrim(rtrim(pre_order_ind))as int))as PRE_ORDER_IND
,IIF(CRE_DT    NOT LIKE '%[/]%' OR  CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT

,IIF(UPD_TS     NOT LIKE '%[/]%'  OR UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS ))AS DATETIME))as UPD_TS

FROM
[BCMPWMT].[OFFR])S
--------------ROW COUNT GROUP BY------------------
SELECT * FROM [BCMPWMT].[OFFR]
SELECT COMM_PCT,COUNT(*) FROM Dim_OFFR_SQL_IN1542  GROUP BY COMM_PCT
SELECT COMM_PCT,COUNT(*) FROM(

SELECT 
IIF(OFFER_PK    IS NULL OR   OFFER_PK='null', 'N/A',LTRIM(RTRIM(OFFER_PK)))as OFFER_PK
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101,CAST(LTRIM(RTRIM(CATLG_ITEM_ID) )AS BIGINT))As CATLG_ITEM_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null',101,CAST(LTRIM(RTRIM(SRC_ORG_CD) )AS BIGINT))as SRC_ORG_CD
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(TENANT_ORG_ID ))AS BIGINT))as TENANT_ORG_ID
,IIF(SRC_ITEM_KEY    IS NULL OR   SRC_ITEM_KEY='null',101,cast(ltrim(rtrim(SRC_ITEM_KEY) )as bigint))as SRC_ITEM_KEY
,IIF(UPC    IS NULL OR   UPC='null','N/A' ,LTRIM(RTRIM(UPC)))as UPC
,IIF(WM_ITEM_NUM    IS NULL OR   WM_ITEM_NUM='null',101,CAST(LTRIM(RTRIM(WM_ITEM_NUM))AS BIGINT))as WM_ITEM_NUM
,IIF(WM_UPC    IS NULL OR   WM_UPC='null','N/A' ,LTRIM(RTRIM(WM_UPC)))as WM_UPC
,IIF(OFFR_NM    IS NULL OR   OFFR_NM='null', 'N/A',LTRIM(RTRIM(OFFR_NM)))as OFFR_NM
,IIF(OFFR_START_TS like '%[A-Z]%'   or OFFR_START_TS    IS NULL OR   OFFR_START_TS='null','N/A',FORMAT( CAST(OFFR_START_TS AS DATEtime),'yyMMdd'))as OFFR_START_TS
,IIF(OFFR_START_DT    IS NULL OR   OFFR_START_DT='null','01-01-1900',cast(ltrim(rtrim(OFFR_START_DT ))AS DATETIME))as OFFR_START_DT
,IIF(OFFR_END_TS    IS NULL OR   OFFR_END_TS='null','01-01-1900',cast(ltrim(rtrim(OFFR_END_TS ))AS DATETIME))as OFFR_END_TS
,IIF(OFFR_TYPE_ID    IS NULL OR   OFFR_TYPE_ID='null','N/A', LTRIM(RTRIM(OFFR_TYPE_ID)))as OFFR_TYPE_ID
,IIF(COMM_PCT    IS NULL OR   COMM_PCT='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(COMM_PCT))))as COMM_PCT
,IIF(SLR_OFFR_ID    IS NULL OR   SLR_OFFR_ID='null','N/A', LTRIM(RTRIM(SLR_OFFR_ID)))as SLR_OFFR_ID
,IIF(PRTNR_ID    IS NULL OR   PRTNR_ID='null','N/A' ,LTRIM(RTRIM(PRTNR_ID)))as PRTNR_ID
,IIF(START_PRICE  LIKE '%[A-Z]%' OR START_PRICE IS NULL OR   START_PRICE='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(START_PRICE))))as START_PRICE
,IIF(LAST_PRICE_UPD_TS    IS NULL OR   LAST_PRICE_UPD_TS='null','01-01-1900',cast(ltrim(rtrim(LAST_PRICE_UPD_TS ))AS DATETIME))as LAST_PRICE_UPD_TS
,IIF(CURR_PRICE NOT LIKE '%.%' OR CURR_PRICE    IS NULL OR   CURR_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_PRICE))))as CURR_PRICE
,IIF(CURR_SUGG_PRICE  NOT LIKE '%.%'OR CURR_SUGG_PRICE    IS NULL OR   CURR_SUGG_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_SUGG_PRICE))))as CURR_SUGG_PRICE
,IIF(BASE_ITEM_PRICE NOT LIKE '%.%'OR BASE_ITEM_PRICE    IS NULL OR   BASE_ITEM_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_ITEM_PRICE))))as BASE_ITEM_PRICE
,IIF(BASE_SUGG_PRICE NOT LIKE '%.%' OR BASE_SUGG_PRICE    IS NULL OR   BASE_SUGG_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_SUGG_PRICE))))as BASE_SUGG_PRICE
,IIF(UOM    IS NULL OR   UOM='null','N/A', LTRIM(RTRIM(UOM)))as UOM
,IIF(TAXABLE_IND LIKE '%[.]%' OR TAXABLE_IND    IS NULL OR   TAXABLE_IND='null',101,cast(ltrim(rtrim(taxable_ind))as int))as TAXABLE_IND
,IIF(GIFT_WRAP_IND    IS NULL OR   GIFT_WRAP_IND='null',101,cast(ltrim(rtrim(gift_wrap_ind))as int))as GIFT_WRAP_IND
,IIF(SHIP_ALONE_IND    IS NULL OR   SHIP_ALONE_IND='null',101,cast(ltrim(rtrim(ship_alone_ind))as int))as SHIP_ALONE_IND
,IIF(FREE_RETURNS_IND    LIKE '%[0-9]%' OR FREE_RETURNS_IND    IS NULL OR   FREE_RETURNS_IND='null',101,cast(ltrim(rtrim(free_retuRns_ind))as int))as FREE_RETURNS_IND
,IIF(SLR_UPC    IS NULL OR   SLR_UPC='null', 'N/A',LTRIM(RTRIM(SLR_UPC)))as SLR_UPC
,IIF(SHIPTOSTORE_IND   LIKE '%[0-9]%' OR  SHIPTOSTORE_IND    IS NULL OR   SHIPTOSTORE_IND='null',101,cast(ltrim(rtrim(shiptostore_ind))as int))as SHIPTOSTORE_IND
,IIF(PIP_IND    IS NULL OR   PIP_IND='null',101,cast(ltrim(rtrim(pip_ind))as int))as PIP_IND
,IIF(PRE_ORDER_IND    IS NULL OR   PRE_ORDER_IND='null',101,cast(ltrim(rtrim(pre_order_ind))as int))as PRE_ORDER_IND
,IIF(CRE_DT    NOT LIKE '%[/]%' OR  CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT

,IIF(UPD_TS     NOT LIKE '%[/]%'  OR UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS ))AS DATETIME))as UPD_TS

FROM
[BCMPWMT].[OFFR])S
GROUP BY COMM_PCT
-----------------DUPLICATE CHECK-------------------


SELECT OFFER_PK,COUNT(*) FROM Dim_OFFR_SQL_IN1542  GROUP BY OFFER_PK HAVING COUNT(*)>1
------------------------------------RANDOM RECORD CHECK-------------
SELECT * FROM [BCMPWMT].[OFFR]
SELECT COMM_PCT,OFFR_NM FROM Dim_OFFR_SQL_IN1542  WHERE OFFER_PK ='20165A373934480AAC5C4361D6B64D31'
SELECT COMM_PCT,OFFR_NM FROM(

SELECT 
IIF(OFFER_PK    IS NULL OR   OFFER_PK='null', 'N/A',LTRIM(RTRIM(OFFER_PK)))as OFFER_PK
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101,CAST(LTRIM(RTRIM(CATLG_ITEM_ID) )AS BIGINT))As CATLG_ITEM_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null',101,CAST(LTRIM(RTRIM(SRC_ORG_CD) )AS BIGINT))as SRC_ORG_CD
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(TENANT_ORG_ID ))AS BIGINT))as TENANT_ORG_ID
,IIF(SRC_ITEM_KEY    IS NULL OR   SRC_ITEM_KEY='null',101,cast(ltrim(rtrim(SRC_ITEM_KEY) )as bigint))as SRC_ITEM_KEY
,IIF(UPC    IS NULL OR   UPC='null','N/A' ,LTRIM(RTRIM(UPC)))as UPC
,IIF(WM_ITEM_NUM    IS NULL OR   WM_ITEM_NUM='null',101,CAST(LTRIM(RTRIM(WM_ITEM_NUM))AS BIGINT))as WM_ITEM_NUM
,IIF(WM_UPC    IS NULL OR   WM_UPC='null','N/A' ,LTRIM(RTRIM(WM_UPC)))as WM_UPC
,IIF(OFFR_NM    IS NULL OR   OFFR_NM='null', 'N/A',LTRIM(RTRIM(OFFR_NM)))as OFFR_NM
,IIF(OFFR_START_TS like '%[A-Z]%'   or OFFR_START_TS    IS NULL OR   OFFR_START_TS='null','N/A',FORMAT( CAST(OFFR_START_TS AS DATEtime),'yyMMdd'))as OFFR_START_TS
,IIF(OFFR_START_DT    IS NULL OR   OFFR_START_DT='null','01-01-1900',cast(ltrim(rtrim(OFFR_START_DT ))AS DATETIME))as OFFR_START_DT
,IIF(OFFR_END_TS    IS NULL OR   OFFR_END_TS='null','01-01-1900',cast(ltrim(rtrim(OFFR_END_TS ))AS DATETIME))as OFFR_END_TS
,IIF(OFFR_TYPE_ID    IS NULL OR   OFFR_TYPE_ID='null','N/A', LTRIM(RTRIM(OFFR_TYPE_ID)))as OFFR_TYPE_ID
,IIF(COMM_PCT    IS NULL OR   COMM_PCT='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(COMM_PCT))))as COMM_PCT
,IIF(SLR_OFFR_ID    IS NULL OR   SLR_OFFR_ID='null','N/A', LTRIM(RTRIM(SLR_OFFR_ID)))as SLR_OFFR_ID
,IIF(PRTNR_ID    IS NULL OR   PRTNR_ID='null','N/A' ,LTRIM(RTRIM(PRTNR_ID)))as PRTNR_ID
,IIF(START_PRICE  LIKE '%[A-Z]%' OR START_PRICE IS NULL OR   START_PRICE='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(START_PRICE))))as START_PRICE
,IIF(LAST_PRICE_UPD_TS    IS NULL OR   LAST_PRICE_UPD_TS='null','01-01-1900',cast(ltrim(rtrim(LAST_PRICE_UPD_TS ))AS DATETIME))as LAST_PRICE_UPD_TS
,IIF(CURR_PRICE NOT LIKE '%.%' OR CURR_PRICE    IS NULL OR   CURR_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_PRICE))))as CURR_PRICE
,IIF(CURR_SUGG_PRICE  NOT LIKE '%.%'OR CURR_SUGG_PRICE    IS NULL OR   CURR_SUGG_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_SUGG_PRICE))))as CURR_SUGG_PRICE
,IIF(BASE_ITEM_PRICE NOT LIKE '%.%'OR BASE_ITEM_PRICE    IS NULL OR   BASE_ITEM_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_ITEM_PRICE))))as BASE_ITEM_PRICE
,IIF(BASE_SUGG_PRICE NOT LIKE '%.%' OR BASE_SUGG_PRICE    IS NULL OR   BASE_SUGG_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_SUGG_PRICE))))as BASE_SUGG_PRICE
,IIF(UOM    IS NULL OR   UOM='null','N/A', LTRIM(RTRIM(UOM)))as UOM
,IIF(TAXABLE_IND LIKE '%[.]%' OR TAXABLE_IND    IS NULL OR   TAXABLE_IND='null',101,cast(ltrim(rtrim(taxable_ind))as int))as TAXABLE_IND
,IIF(GIFT_WRAP_IND    IS NULL OR   GIFT_WRAP_IND='null',101,cast(ltrim(rtrim(gift_wrap_ind))as int))as GIFT_WRAP_IND
,IIF(SHIP_ALONE_IND    IS NULL OR   SHIP_ALONE_IND='null',101,cast(ltrim(rtrim(ship_alone_ind))as int))as SHIP_ALONE_IND
,IIF(FREE_RETURNS_IND    LIKE '%[0-9]%' OR FREE_RETURNS_IND    IS NULL OR   FREE_RETURNS_IND='null',101,cast(ltrim(rtrim(free_retuRns_ind))as int))as FREE_RETURNS_IND
,IIF(SLR_UPC    IS NULL OR   SLR_UPC='null', 'N/A',LTRIM(RTRIM(SLR_UPC)))as SLR_UPC
,IIF(SHIPTOSTORE_IND   LIKE '%[0-9]%' OR  SHIPTOSTORE_IND    IS NULL OR   SHIPTOSTORE_IND='null',101,cast(ltrim(rtrim(shiptostore_ind))as int))as SHIPTOSTORE_IND
,IIF(PIP_IND    IS NULL OR   PIP_IND='null',101,cast(ltrim(rtrim(pip_ind))as int))as PIP_IND
,IIF(PRE_ORDER_IND    IS NULL OR   PRE_ORDER_IND='null',101,cast(ltrim(rtrim(pre_order_ind))as int))as PRE_ORDER_IND
,IIF(CRE_DT    NOT LIKE '%[/]%' OR  CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT

,IIF(UPD_TS     NOT LIKE '%[/]%'  OR UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS ))AS DATETIME))as UPD_TS

FROM
[BCMPWMT].[OFFR])S  WHERE OFFER_PK ='20165A373934480AAC5C4361D6B64D31'

----------------------------------------------------------COLUMN LEVEL CHECK------------------------------
SELECT COUNT(*) FROM Dim_OFFR_SQL_IN1542 T  LEFT JOIN
(

SELECT 
IIF(OFFER_PK    IS NULL OR   OFFER_PK='null', 'N/A',LTRIM(RTRIM(OFFER_PK)))as OFFER_PK
,IIF(CATLG_ITEM_ID    IS NULL OR   CATLG_ITEM_ID='null',101,CAST(LTRIM(RTRIM(CATLG_ITEM_ID) )AS BIGINT))As CATLG_ITEM_ID
,IIF(SRC_ORG_CD    IS NULL OR   SRC_ORG_CD='null',101,CAST(LTRIM(RTRIM(SRC_ORG_CD) )AS BIGINT))as SRC_ORG_CD
,IIF(TENANT_ORG_ID    IS NULL OR   TENANT_ORG_ID='null',101,cast(ltrim(rtrim(TENANT_ORG_ID ))AS BIGINT))as TENANT_ORG_ID
,IIF(SRC_ITEM_KEY    IS NULL OR   SRC_ITEM_KEY='null',101,cast(ltrim(rtrim(SRC_ITEM_KEY) )as bigint))as SRC_ITEM_KEY
,IIF(UPC    IS NULL OR   UPC='null','N/A' ,LTRIM(RTRIM(UPC)))as UPC
,IIF(WM_ITEM_NUM    IS NULL OR   WM_ITEM_NUM='null',101,CAST(LTRIM(RTRIM(WM_ITEM_NUM))AS BIGINT))as WM_ITEM_NUM
,IIF(WM_UPC    IS NULL OR   WM_UPC='null','N/A' ,LTRIM(RTRIM(WM_UPC)))as WM_UPC
,IIF(OFFR_NM    IS NULL OR   OFFR_NM='null', 'N/A',LTRIM(RTRIM(OFFR_NM)))as OFFR_NM
,IIF(OFFR_START_TS like '%[A-Z]%'   or OFFR_START_TS    IS NULL OR   OFFR_START_TS='null','N/A',FORMAT( CAST(OFFR_START_TS AS DATEtime),'yyMMdd'))as OFFR_START_TS
,IIF(OFFR_START_DT    IS NULL OR   OFFR_START_DT='null','01-01-1900',cast(ltrim(rtrim(OFFR_START_DT ))AS DATETIME))as OFFR_START_DT
,IIF(OFFR_END_TS    IS NULL OR   OFFR_END_TS='null','01-01-1900',cast(ltrim(rtrim(OFFR_END_TS ))AS DATETIME))as OFFR_END_TS
,IIF(OFFR_TYPE_ID    IS NULL OR   OFFR_TYPE_ID='null','N/A', LTRIM(RTRIM(OFFR_TYPE_ID)))as OFFR_TYPE_ID
,IIF(COMM_PCT    IS NULL OR   COMM_PCT='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(COMM_PCT))))as COMM_PCT
,IIF(SLR_OFFR_ID    IS NULL OR   SLR_OFFR_ID='null','N/A', LTRIM(RTRIM(SLR_OFFR_ID)))as SLR_OFFR_ID
,IIF(PRTNR_ID    IS NULL OR   PRTNR_ID='null','N/A' ,LTRIM(RTRIM(PRTNR_ID)))as PRTNR_ID
,IIF(START_PRICE  LIKE '%[A-Z]%' OR START_PRICE IS NULL OR   START_PRICE='null',101.00 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(START_PRICE))))as START_PRICE
,IIF(LAST_PRICE_UPD_TS    IS NULL OR   LAST_PRICE_UPD_TS='null','01-01-1900',cast(ltrim(rtrim(LAST_PRICE_UPD_TS ))AS DATETIME))as LAST_PRICE_UPD_TS
,IIF(CURR_PRICE NOT LIKE '%.%' OR CURR_PRICE    IS NULL OR   CURR_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_PRICE))))as CURR_PRICE
,IIF(CURR_SUGG_PRICE  NOT LIKE '%.%'OR CURR_SUGG_PRICE    IS NULL OR   CURR_SUGG_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(CURR_SUGG_PRICE))))as CURR_SUGG_PRICE
,IIF(BASE_ITEM_PRICE NOT LIKE '%.%'OR BASE_ITEM_PRICE    IS NULL OR   BASE_ITEM_PRICE='null', 101,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_ITEM_PRICE))))as BASE_ITEM_PRICE
,IIF(BASE_SUGG_PRICE NOT LIKE '%.%' OR BASE_SUGG_PRICE    IS NULL OR   BASE_SUGG_PRICE='null',101 ,CONVERT(DECIMAL(19,6),LTRIM(RTRIM(BASE_SUGG_PRICE))))as BASE_SUGG_PRICE
,IIF(UOM    IS NULL OR   UOM='null','N/A', LTRIM(RTRIM(UOM)))as UOM
,IIF(TAXABLE_IND LIKE '%[.]%' OR TAXABLE_IND    IS NULL OR   TAXABLE_IND='null',101,cast(ltrim(rtrim(taxable_ind))as int))as TAXABLE_IND
,IIF(GIFT_WRAP_IND    IS NULL OR   GIFT_WRAP_IND='null',101,cast(ltrim(rtrim(gift_wrap_ind))as int))as GIFT_WRAP_IND
,IIF(SHIP_ALONE_IND    IS NULL OR   SHIP_ALONE_IND='null',101,cast(ltrim(rtrim(ship_alone_ind))as int))as SHIP_ALONE_IND
,IIF(FREE_RETURNS_IND    LIKE '%[0-9]%' OR FREE_RETURNS_IND    IS NULL OR   FREE_RETURNS_IND='null',101,cast(ltrim(rtrim(free_retuRns_ind))as int))as FREE_RETURNS_IND
,IIF(SLR_UPC    IS NULL OR   SLR_UPC='null', 'N/A',LTRIM(RTRIM(SLR_UPC)))as SLR_UPC
,IIF(SHIPTOSTORE_IND   LIKE '%[0-9]%' OR  SHIPTOSTORE_IND    IS NULL OR   SHIPTOSTORE_IND='null',101,cast(ltrim(rtrim(shiptostore_ind))as int))as SHIPTOSTORE_IND
,IIF(PIP_IND    IS NULL OR   PIP_IND='null',101,cast(ltrim(rtrim(pip_ind))as int))as PIP_IND
,IIF(PRE_ORDER_IND    IS NULL OR   PRE_ORDER_IND='null',101,cast(ltrim(rtrim(pre_order_ind))as int))as PRE_ORDER_IND
,IIF(CRE_DT    NOT LIKE '%[/]%' OR  CRE_DT    IS NULL OR   CRE_DT='null','01-01-1900',cast(ltrim(rtrim(CRE_DT ))AS DATE))as CRE_DT

,IIF(UPD_TS     NOT LIKE '%[/]%'  OR UPD_TS    IS NULL OR   UPD_TS='null','01-01-1900',cast(ltrim(rtrim(UPD_TS ))AS DATETIME))as UPD_TS

FROM
[BCMPWMT].[OFFR])S  
ON  T.OFFER_PK = S.OFFER_PK 
WHERE S.OFFER_PK IS NOT NULL 
AND (
s.CATLG_ITEM_ID  <>  t.CATLG_ITEM_ID or
s.SRC_ORG_CD  <>  t.SRC_ORG_CD or
s.TENANT_ORG_ID  <>  t.TENANT_ORG_ID or
s.SRC_ITEM_KEY  <>  t.SRC_ITEM_KEY or
s.UPC  <>  t.UPC or
s.WM_ITEM_NUM  <>  t.WM_ITEM_NUM or
s.WM_UPC  <>  t.WM_UPC or
s.OFFR_NM  <>  t.OFFR_NM or
s.OFFR_START_TS  <>  t.OFFR_START_TS or
s.OFFR_START_DT  <>  t.OFFR_START_DT or
s.OFFR_END_TS  <>  t.OFFR_END_TS or
s.OFFR_TYPE_ID  <>  t.OFFR_TYPE_ID or
s.COMM_PCT  <>  t.COMM_PCT or
s.SLR_OFFR_ID  <>  t.SLR_OFFR_ID or
s.PRTNR_ID  <>  t.PRTNR_ID or
s.START_PRICE  <>  t.START_PRICE or
s.LAST_PRICE_UPD_TS  <>  t.LAST_PRICE_UPD_TS or
s.CURR_PRICE  <>  t.CURR_PRICE or
s.CURR_SUGG_PRICE  <>  t.CURR_SUGG_PRICE or
s.BASE_ITEM_PRICE  <>  t.BASE_ITEM_PRICE or
s.BASE_SUGG_PRICE  <>  t.BASE_SUGG_PRICE or
s.UOM  <>  t.UOM or
s.TAXABLE_IND  <>  t.TAXABLE_IND or
s.GIFT_WRAP_IND  <>  t.GIFT_WRAP_IND or
s.SHIP_ALONE_IND  <>  t.SHIP_ALONE_IND or
s.FREE_RETURNS_IND  <>  t.FREE_RETURNS_IND or
s.SLR_UPC  <>  t.SLR_UPC or
s.SHIPTOSTORE_IND  <>  t.SHIPTOSTORE_IND or
s.PIP_IND  <>  t.PIP_IND or
s.PRE_ORDER_IND  <>  t.PRE_ORDER_IND or
s.CRE_DT  <>  t.CRE_DT or

s.UPD_TS  <>  t.UPD_TS 
)


-----------------------------------------------------------------------------------

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
CUST_ID_1  int  NOT NULL											,
TENANT_ORG_ID_1  int  NOT NULL									,
ACCT_STS_ID  int  NOT NULL										,
ACCT_TYPE_ID  int  NOT NULL										,
EMAIL  varchar(250)  NOT NULL									,
VALID_CUST_IND_1  INT  NOT NULL									,
CRE_DT_1  date  NOT NULL											,
CRE_USER_1  varchar(250)  NOT NULL								,
UPD_TS_1  datetime  NOT NULL										,
UPD_USER_1  varchar(250)  NOT NULL								,
Start_Date  datetime  NOT NULL									,
End_Date  datetime  									,
DELTD_YN_1  char(1)  NOT NULL							);
truncate table DIM_CUST_ACCT_DETAILS_SQL_IN1542
insert into DIM_CUST_ACCT_DETAILS_SQL_IN1542

select 
c.CUST_ID                
,c.TENANT_ORG_ID
,c.CUST_TYPE_ID
,c.NICKNAME
,c.SALUTE
,c.MIDDLE_NM
,c.CUST_TITLE
,c.SUFFIX
,c.WM_EMPLOYEE_ID
,c.CRE_DT
,c.CRE_USER
,c.UPD_TS
,c.UPD_USER
,c.SIGNUP_TS
,c.REALM_ID
,c.VALID_CUST_IND
,c.DELTD_YN
,a.ACCT_ID
,a.CUST_ID as CUST_ID_1
,a.TENANT_ORG_ID as TENANT_ORG_ID_1
,a.ACCT_STS_ID
,a.ACCT_TYPE_ID
,a.EMAIL
,a.VALID_CUST_IND as VALID_CUST_IND_1
,a.CRE_DT as CRE_DT_1
,a.CRE_USER as CRE_USER_1
,a.UPD_TS as upd_ts_1
,a.UPD_USER as upd_user_1
,a.Start_Date
,a.End_Date
,a.DELTD_YN as DELTD_YN_1
from DIM_CUST_SQL_IN1542 c left join dim_CUST_ACCT_SQL_IN1542 a
on c.CUST_ID  =a.CUST_ID
-----------------row count----------------4975
select count(*) from DIM_CUST_ACCT_DETAILS_SQL_IN1542
select count(*) from (select 
c.CUST_ID                
,c.TENANT_ORG_ID
,c.CUST_TYPE_ID
,c.NICKNAME
,c.SALUTE
,c.MIDDLE_NM
,c.CUST_TITLE
,c.SUFFIX
,c.WM_EMPLOYEE_ID
,c.CRE_DT
,c.CRE_USER
,c.UPD_TS
,c.UPD_USER
,c.SIGNUP_TS
,c.REALM_ID
,c.VALID_CUST_IND
,c.DELTD_YN
,a.ACCT_ID
,a.CUST_ID as CUST_ID_1
,a.TENANT_ORG_ID as TENANT_ORG_ID_1
,a.ACCT_STS_ID
,a.ACCT_TYPE_ID
,a.EMAIL
,a.VALID_CUST_IND as VALID_CUST_IND_1
,a.CRE_DT as CRE_DT_1
,a.CRE_USER as CRE_USER_1
,a.UPD_TS as upd_ts_1
,a.UPD_USER upd_user_1
,a.Start_Date
,a.End_Date
,a.DELTD_YN as DELTD_YN_1
from DIM_CUST_SQL_IN1542 c left join dim_CUST_ACCT_SQL_IN1542 a
on c.CUST_ID  =a.CUST_ID
)s

------------row count group by---------------
select * from DIM_CUST_SQL_IN1542 
select cre_user,count(*) from DIM_CUST_ACCT_DETAILS_SQL_IN1542 group by cre_user
select cre_user, count(*) from (select 
c.CUST_ID                
,c.TENANT_ORG_ID
,c.CUST_TYPE_ID
,c.NICKNAME
,c.SALUTE
,c.MIDDLE_NM
,c.CUST_TITLE
,c.SUFFIX
,c.WM_EMPLOYEE_ID
,c.CRE_DT
,c.CRE_USER
,c.UPD_TS
,c.UPD_USER
,c.SIGNUP_TS
,c.REALM_ID
,c.VALID_CUST_IND
,c.DELTD_YN
,a.ACCT_ID
,a.CUST_ID as CUST_ID_1
,a.TENANT_ORG_ID as TENANT_ORG_ID_1
,a.ACCT_STS_ID
,a.ACCT_TYPE_ID
,a.EMAIL
,a.VALID_CUST_IND as VALID_CUST_IND_1
,a.CRE_DT as CRE_DT_1
,a.CRE_USER as CRE_USER_1
,a.UPD_TS as upd_ts_1
,a.UPD_USER upd_user_1
,a.Start_Date
,a.End_Date
,a.DELTD_YN as DELTD_YN_1
from DIM_CUST_SQL_IN1542 c left join dim_CUST_ACCT_SQL_IN1542 a
on c.CUST_ID  =a.CUST_ID
)s group by cre_user

-----------------------duplicate check------------------
select CUST_ID,count(*) from DIM_CUST_ACCT_DETAILS_SQL_IN1542  group by CUST_ID  having count(*)>1
-------------------random record check-------------------------------------------
select cre_user,salute from DIM_CUST_ACCT_DETAILS_SQL_IN1542 where cust_id=1987728795
select cre_user,salute  from (select 
c.CUST_ID                
,c.TENANT_ORG_ID
,c.CUST_TYPE_ID
,c.NICKNAME
,c.SALUTE
,c.MIDDLE_NM
,c.CUST_TITLE
,c.SUFFIX
,c.WM_EMPLOYEE_ID
,c.CRE_DT
,c.CRE_USER
,c.UPD_TS
,c.UPD_USER
,c.SIGNUP_TS
,c.REALM_ID
,c.VALID_CUST_IND
,c.DELTD_YN
,a.ACCT_ID
,a.CUST_ID as CUST_ID_1
,a.TENANT_ORG_ID as TENANT_ORG_ID_1
,a.ACCT_STS_ID
,a.ACCT_TYPE_ID
,a.EMAIL
,a.VALID_CUST_IND as VALID_CUST_IND_1
,a.CRE_DT as CRE_DT_1
,a.CRE_USER as CRE_USER_1
,a.UPD_TS as upd_ts_1
,a.UPD_USER upd_user_1
,a.Start_Date
,a.End_Date
,a.DELTD_YN as DELTD_YN_1
from DIM_CUST_SQL_IN1542 c left join dim_CUST_ACCT_SQL_IN1542 a
on c.CUST_ID  =a.CUST_ID
)s where cust_id=1987728795
------------------------column level check----------------
select count(*) from DIM_CUST_ACCT_DETAILS_SQL_IN1542 t left join
(select c.CUST_ID                
,c.TENANT_ORG_ID
,c.CUST_TYPE_ID
,c.NICKNAME
,c.SALUTE
,c.MIDDLE_NM
,c.CUST_TITLE
,c.SUFFIX
,c.WM_EMPLOYEE_ID
,c.CRE_DT
,c.CRE_USER
,c.UPD_TS
,c.UPD_USER
,c.SIGNUP_TS
,c.REALM_ID
,c.VALID_CUST_IND
,c.DELTD_YN
,a.ACCT_ID
,a.CUST_ID as CUST_ID_1
,a.TENANT_ORG_ID as TENANT_ORG_ID_1
,a.ACCT_STS_ID
,a.ACCT_TYPE_ID
,a.EMAIL
,a.VALID_CUST_IND as VALID_CUST_IND_1
,a.CRE_DT as CRE_DT_1
,a.CRE_USER as CRE_USER_1
,a.UPD_TS as upd_ts_1
,a.UPD_USER upd_user_1
,a.Start_Date
,a.End_Date
,a.DELTD_YN as DELTD_YN_1
from DIM_CUST_SQL_IN1542 c left join dim_CUST_ACCT_SQL_IN1542 a
on c.CUST_ID  =a.CUST_ID
)s 
on
t.CUST_ID=s.CUST_ID_1

where s.CUST_ID_1 is not null and (

t.CUST_ID           <>            
t.TENANT_ORG_ID		<>      
t.CUST_TYPE_ID		<>      
t.NICKNAME			<>      
t.SALUTE			<>      
t.MIDDLE_NM			<>      
t.CUST_TITLE		<>      
t.SUFFIX			<>      
t.WM_EMPLOYEE_ID	<>      
t.CRE_DT			<>      
t.CRE_USER			<>      
t.UPD_TS			<>      
t.UPD_USER			<>      
t.SIGNUP_TS			<>      
t.REALM_ID			<>      
t.VALID_CUST_IND	<>      
t.DELTD_YN			<>      
					<>      



)
----------------------FACT---------------------------
