
create table Dates_SQL_in1542
(id int primary key not null,
Dates date,
year_id int
)






drop table Dates_SQL_in1542
drop procedure dates1_SQL_IN1542

create procedure dates1_SQL_IN1542
as
declare @start_date date = '01-01-1962'
declare @end_date date = '12-31-2024'
declare @count int =0
declare @year int =1962
declare @year_id int = 1 
while @start_date <= @end_date
	begin
		insert into  Dates_SQL_in1542 values(@count+1,@start_date,@year_id)
		set @count = @count+1
		set @start_date = dateadd(day,1,@start_date)
		if @year <> year(@start_date)
		  set @year_id = @year_id+1
			set @year = year(@start_date)
	end
exec dates1_SQL_IN1542


select * from dates_SQL_IN1542

	create table dim_Year_sql_in1542(
year_key int  identity(1,1) primary key,
year_id int not null 
)

drop table dim_year_sq

insert into dim_Year_sql_in1542
select distinct(year(Dates)) from Dates
order by year(Dates)

select * from dim_year_sql_in1542

create table dim_qtr_sql_in1542
(quater_key int identity(1,1) primary key,
quater_id int not null,
year_key int not null,
year_id int not null
foreign key (year_key) references dim_year_sql_in1542(year_key))


truncate table dim_qtr_sql_in1542

insert into dim_qtr_sql_in1542(quater_id,year_key,year_id)
select distinct(datename(qq,d.dates)) as quater_id,y.year_key,y.year_id
from dim_year_sql_in1542 y join dates d on y.year_key = d.year_id
order by y.year_id

select * from dim_qtr_sql_in1542

create table Dim_month_sql_in1542
(month_key int not null primary key identity(1,1),
month_id int ,
month_name varchar(20),
quater_key int not null,
quater_id int not null,
year_key int not null,
year_id int not null
foreign key (year_key) references dim_year_sql_in1542(year_key),
foreign key (quater_key) references dim_qtr_sql_in1542(quater_key)
);

drop table dim_month_sql_in1542

select * from 
Dim_month_sql_in1542


insert into  Dim_month_sql_in1542(month_id,month_name,quater_key,quater_id,year_key,year_id)

select distinct(month(d.dates)),
datename(month,d.dates),
q.quater_key,
q.quater_id,
q.year_key,
q.year_id
from Dates_SQL_in1542 d join dim_qtr_sql_in1542 q on year(d.dates) = q.year_id and datepart(qq,d.dates) = q.quater_id
order by year_id



select * from dates_sql_in1542
select * from dim_year_sql_in1542
select * from dim_qtr_sql_in1542
select * from Dim_month_sql_in1542
select* from dim_week_sql_in1542
select * from dim_day_sql_in1542

create table dim_week_sql_in1542 
(week_key int identity(1,1) primary key,
week_id int not null,
Month_key int not null,
month_id int not null,
quater_key int not null,
quater_id int not null,
year_key int not null,
year_id int not null);

insert into dim_week_sql_in1542(week_id,Month_key,month_id,quater_key,quater_id,year_key
,year_id)
select distinct(datepart(ww,d.dates)),
m.Month_key,
m.month_id,
m.quater_key,
m.quater_id,
m.year_key,
m.year_id
from dates_sql_in1542 d join Dim_month_sql_in1542 m on year(d.dates) = m.year_id
and datepart(qq,d.dates) = m.quater_id
and datepart(mm,d.dates) = m.month_id
order by year_id

select * from dim_week
drop table dim_week


create table dim_day_sql_in1542
(Day_key int identity(1,1) primary key,
Date_id date  not null,
Day_id		int not null,
week_key	int not null,
Week_id		int not null,
Month_key	int not null,
Month_id	int not null,
Quarter_key	int not null,
Quarter_id	int not null,
year_key	int not null,
year_id		int not null);


insert into dim_day_sql_in1542
(
Date_id		,
Day_id		,
week_key	,
Week_id		,
Month_key	,
Month_id	,
Quarter_key	,
Quarter_id	,
year_key	,
year_id		)

select distinct(d.dates),datepart(dd,d.dates),
w.week_key		,
w.Week_id		,
w.Month_key		,
w.Month_id		,
w.quater_key	,
w.quater_id	,
w.year_key		,
w.year_id
from dates d join dim_week_sql_in1542 w on year(d.dates) = w.year_id
and datepart(qq,d.dates) = w.quater_id
and datepart(mm,d.dates) = w.month_id
and datepart(ww,d.dates) = w.week_id
order by year_id





select * from dim_day_sql_in1542





create table DIM_DAY_HOUR_sql_IN1552
(Day_hour_key	int	IDENTITY,
Day_key	int			,
Date_id	date		,
Day_id	int			,
week_key	int		,
Week_id	int			,
Month_key	int		,
Month_id	int		,
Quarter_key	int		,
Quarter_id	int		,
year_key	int		,
year_id	int			,
hour_id	int			,
hour_key 	int )

DROP TABLE DIM_DAY_HOUR_sql_IN1552
DROP TABLE hours_24

create table hours_24
(hours_24 int ,
HOUR_KEY INT IDENTITY)

drop table DIM_DAY_HOUR_sql_IN1552
exec  hours_1_24

select * from hours_24

truncate table hours_24

create procedure hours_1_24
as
declare @count int = 0
while @count <= 23
	begin 
	insert into hours_24 values(@count)
	set @count = @count +1
	end

exec hours_1_24

select * from dim_day_SQL_IN1552

select * from DIM_DAY_HOUR_sql_IN1552

truncate table DIM_DAY_HOUR_sql_IN1552

insert into DIM_DAY_HOUR_sql_IN1552
(
Day_key			,
Date_id			,
Day_id			,
week_key		,
Week_id			,
Month_key		,
Month_id		,
Quarter_key		,
Quarter_id		,
year_key		,
year_id			,
hour_id	,
HOUR_KEY)

select 
d.Day_key
,d.Date_id
,d.Day_id
,d.week_key
,d.Week_id
,d.Month_key
,d.Month_id
,d.Quarter_key
,d.Quarter_id
,d.year_key
,d.year_id
,h.hours_24,h.hour_key
from dim_day_SQL_IN1552 d cross join hours_24 h
order by date_id asc


