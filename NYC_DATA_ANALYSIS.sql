
--Creating the table to dump the nyc data into
DROP TABLE TRIP_FARE_SAMPLE CASCADE CONSTRAINTS;
CREATE TABLE TRIP_FARE_SAMPLE( medallion VARCHAR2(3000 BYTE), 
hack_license VARCHAR2(3000 BYTE), 
vendor_id VARCHAR2(10 BYTE), 
rate_id NUMBER, 
store_and_fwd_flag VARCHAR2(1 BYTE), 
pickup_datetime TIMESTAMP, 
dropoff_datetime TIMESTAMP, 
passenger_count NUMBER, 
trip_time_in_secs NUMBER, 
trip_distance NUMBER, 
pickup_longitude NUMBER, 
pickup_latitude NUMBER, 
dropoff_longitude NUMBER, 
dropoff_latitude NUMBER,
vendor_id_copy VARCHAR2(10 BYTE),  
fare_payment_type VARCHAR2(10 BYTE), 
fare_amount NUMBER, 
fare_surcharge NUMBER, 
mta_tax NUMBER, 
tip_amount NUMBER, 
toll_amount NUMBER, 
total_amount NUMBER
   ) ;
   
   

-- Checking all the columns available in the table   
(select WM_CONCAT(column_name) from all_tab_columns where table_name like 'TEMP_TABLE');   
   
-- Insertinng the data into the original tables from the temp table   
insert into TRIP_FARE_SAMPLE
select COL1,COL2,COL3,COL4,COL5,TO_TIMESTAMP(COL6,'MM/DD/YYYY HH24:MI'),TO_TIMESTAMP(COL7,'MM/DD/YYYY HH24:MI'),COL8,COL9,COL10,COL11,COL12,COL13,COL14,
COL17,COL19,COL20,COL21,COL22,COL23,COL24,COL25 from temp_table ;  
   
-- On analysinsg the data we found that there are a few records whihc have swapped log and lat values   
-- to get rid of this issue, we created a new table with appropriate data
CREATE TABLE TRIP_FARE_SAMPLE_NEW AS
SELECT MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LATITUDE as P_LONG,PICKUP_LONGITUDE as P_LAT,D_LONG,D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT FROM
(SELECT 
MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LONGITUDE,PICKUP_LATITUDE,DROPOFF_LATITUDE as D_LONG,DROPOFF_LONGITUDE as D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT
FROM 
TRIP_FARE_SAMPLE WHERE DROPOFF_LONGITUDE > 0
union
SELECT 
MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LONGITUDE,PICKUP_LATITUDE,DROPOFF_LONGITUDE as D_LONG,DROPOFF_LATITUDE as D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT
FROM 
TRIP_FARE_SAMPLE WHERE DROPOFF_LONGITUDE < 0) WHERE PICKUP_LONGITUDE > 0
UNION
SELECT MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LONGITUDE as P_LONG,PICKUP_LATITUDE as P_LAT,D_LONG,D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT FROM
(SELECT 
MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LONGITUDE,PICKUP_LATITUDE,DROPOFF_LATITUDE as D_LONG,DROPOFF_LONGITUDE as D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT
FROM 
TRIP_FARE_SAMPLE WHERE DROPOFF_LONGITUDE > 0
union
SELECT 
MEDALLION,HACK_LICENSE,VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,TRIP_TIME_IN_SECS,
TRIP_DISTANCE,PICKUP_LONGITUDE,PICKUP_LATITUDE,DROPOFF_LONGITUDE as D_LONG,DROPOFF_LATITUDE as D_LAT,VENDOR_ID_COPY,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT
FROM 
TRIP_FARE_SAMPLE WHERE DROPOFF_LONGITUDE < 0) WHERE PICKUP_LONGITUDE < 0;
   
   
-- Creting new variables
-- new Tip falg column whihc will indicate whethere customer gave tip or not
alter table TRIP_FARE_SAMPLE_NEW ADD tip_flag VARCHAR2(1); 
update TRIP_FARE_SAMPLE_NEW set tip_flag = 0 where tip_amount = 0;


-- new D_HOUR, P_HOUR column to extract the hour of the data when the dropoff,pickup happened
ALTER TABLE TRIP_FARE_SAMPLE_NEW  ADD P_HOUR VARCHAR2(30);
ALTER TABLE TRIP_FARE_SAMPLE_NEW  ADD D_HOUR VARCHAR2(30);

update TRIP_FARE_SAMPLE_NEW  set D_HOUR = extract(HOUR from dropoff_datetime) ;
update TRIP_FARE_SAMPLE_NEW  set P_HOUR = extract(HOUR from pickup_datetime) ;

--- Creating clumns for day of the week when the pickup and drop happened

ALTER TABLE TRIP_FARE_SAMPLE_NEW  ADD P_WEEKDAY VARCHAR2(30);
ALTER TABLE TRIP_FARE_SAMPLE_NEW  ADD D_WEEKDAY VARCHAR2(30);

update TRIP_FARE_SAMPLE_NEW  set D_WEEKDAY = to_char(dropoff_datetime,'DAY') ;
update TRIP_FARE_SAMPLE_NEW  set P_WEEKDAY = to_char(pickup_datetime,'DAY') ;
   
-- Selecting only the data which is appropriate

select VENDOR_ID,RATE_ID,STORE_AND_FWD_FLAG,PICKUP_DATETIME,DROPOFF_DATETIME,PASSENGER_COUNT,
TRIP_TIME_IN_SECS,TRIP_DISTANCE,P_LONG,P_LAT,D_LONG,D_LAT,FARE_PAYMENT_TYPE,FARE_AMOUNT,
FARE_SURCHARGE,MTA_TAX,TIP_AMOUNT,TOLL_AMOUNT,TOTAL_AMOUNT,TIP_FLAG,P_WEEKDAY,D_WEEKDAY,D_HOUR,P_HOUR
from TRIP_FARE_SAMPLE_NEW 
  where passenger_count <> 0
  and Rate_id not in ( 0,65)
  --and FARE_PAYMENT_TYPE <> 'UNK'
  and trip_time_in_secs <> 0
  and trip_time_in_secs > 30
  and (1609*trip_distance)/(trip_time_in_secs) < 36;

--Analysing the data based on group w.r.t to different categorical column   
select count(*),sum(tip_amount),sum(total_amount-tip_amount),hack_license 
from TRIP_FARE_SAMPLE group by hack_license;


select count(*),sum(TIP_AMOUNT),PICKUP_LONGITUDE,PICKUP_LATITUDE 
from TRIP_FARE_SAMPLE 
group by PICKUP_LONGITUDE,PICKUP_LATITUDE 
order by sum(TIP_AMOUNT) desc;

select count(*),avg(fare_amount) as fare,avg(tip_amount) as tip,
avg(fare_amount/TRIP_DISTANCE),FARE_PAYMENT_TYPE 
from TRIP_FARE_SAMPLE_NEW 
where TRIP_DISTANCE <> 0 group by FARE_PAYMENT_TYPE;

select count(*),avg(fare_amount) as FARE,avg(tip_amount) as TIP,passenger_count
from TRIP_FARE_SAMPLE_NEW 
where TRIP_TIME_IN_SECS <> 0  and TRIP_DISTANCE <> 0 group by passenger_count;


select count(distinct MEDALLION),count(distinct RATE_ID),count(distinct PASSENGER_COUNT),count(distinct TRIP_TIME_IN_SECS),
count(distinct TRIP_DISTANCE),count(distinct FARE_PAYMENT_TYPE),count(distinct FARE_SURCHARGE),count(distinct MTA_TAX),
count(distinct TOLL_AMOUNT) from TRIP_FARE_SAMPLE_NEW;

select count(*),avg(tip_amount),D_WEEKDAY,D_HOUR from TRIP_FARE_SAMPLE_NEW group by D_WEEKDAY,D_HOUR;

select count(*),ROUND(avg(tip_amount),2) as TIP,TIP_FLAG,PASSENGER_COUNT 
from TRIP_FARE_SAMPLE_NEW  
group by TIP_FLAG,PASSENGER_COUNT;

select count(*),avg(fare_amount),avg(tip_amount),rate_id 
from TRIP_FARE_SAMPLE_NEW group by rate_id;