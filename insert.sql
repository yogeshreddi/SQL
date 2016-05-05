------ CA_PICKUP_LOCATION_MSTR -----------

INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAHYD001','AP','HYD','STORE BANJARA','8181818181','FLAT 1 BANJARAHILLS HYDERABAD','500071'); 
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAHYD002','AP','HYD','STORE GOLCONDA','8282828282','FLAT 2 GOLCONDA HYDERABAD','500075'); 
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAHYD003','AP','HYD','STORE CHARMINAR','8383838383','FLAT 3 CHARMINAR HYDERABAD','500013');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAHYD004','AP','HYD','STORE MEHDIPATNAM','8484848484','FLAT 4 MEHDIPATANAM HYDERABAD','500072');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAHYD005','AP','HYD','STORE TOLICHOWKI','8585858585','FLAT 5 TOLICHOWKI HYDERABAD','500075');

INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAMUM001','MH','MUM','STORE BANDRA','7171717171','PLOT 1 BANDRA MUMBAI','400001');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAMUM002','MH','MUM','STORE VIKROLI','7272727272','PLOT 2 VIKROLI MUMBAI','400011');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAMUM003','MH','MUM','STORE ANDHERI EAST','7373737373','PLOT 3 EAST ANDHERI MUMBAI','400107');


INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CADEL001','DL','DEL','DHWARAKA STORE','6161616161','#1 BANDRA DELHI','600001');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CADEL002','DL','DEL','STORE HAUZ KHAS','6262626262','#334 BANDRA NEW DELHI','600881');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CADEL003','DL','DEL','STORE NOIDA','6363636363','PLOT 777 BANDRA DELHI','600761');

INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAVJG001','AP','VJG','STORE KARVEPAK','8989898989','301 KARVEPAK PURAM VIZAG','502092');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CAVJG002','AP','VJG','STORE KAKI','8787878787','ROAD 5 FLAT 338 KAKIPALLY VIZAG','502035');

INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CACHN002','TN','CHN','STORE AUTONAGAR','4141414141','STREET 25, PLOT 225 AUTONAGAR CHENNAI','702035');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CACHN003','TN','CHN','STORE MACHI','4242424242','ROAD NO 34, PLOT 989 MACHI CHENNAI','707125');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CACHN004','TN','CHN','STORE VANAKAM','4343434343','#4567 PLOT 080 VANAKAM CHENNAI','700937');
INSERT INTO CA_PICKUP_LOCATION_MSTR VALUES('CACHN005','TN','CHN','STORE KAKI','4444444444','na','702184');


COMMIT;


------CA_DEALER_ROLE_DESC------

INSERT INTO CA_DEALER_ROLE_DESC VALUES('01','Dealer','He can accept and reverse payments');
INSERT INTO CA_DEALER_ROLE_DESC VALUES('02','Cashier','He can only accept cash payments and cannot reverse those payments');
INSERT INTO CA_DEALER_ROLE_DESC VALUES('03','Super User','He can accept payments and also can rverse payments accepted by himself and cashier');
INSERT INTO CA_DEALER_ROLE_DESC VALUES('04','Manager','He can accept and reverse payments and also can block dealers');

COMMIT;

----------CA_USERS----------

INSERT INTO CA_USERS VALUES('Bahyd001','01','CAHYD001','kjhgf97baosjgfoiywkjfbj','Mr. Pawan Kalyan','6548164964','pspk@xyz.com','xyz place, 123 flat Hyderabad','AP');
INSERT INTO CA_USERS VALUES('Bahyd002','01','CAHYD001','lkghhglkjhkjtiljlkjgklj','Mr. Ram Charan','6959786986','mps@xyz.com','hgk place, 986 flat Hyderabad','AP');
INSERT INTO CA_USERS VALUES('Bahyd003','03','CAHYD001','jhfkjhbmbnkjhgfkjggdgd','Ms. Raghu','3216549855','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd005','02','CAHYD001','jhfkjhbmbnkjhgfkjggdgd','Ms. Samiresh','3211546542','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd006','04','CAHYD001','kgkjnhjhgkljhgkjhfjkhfj','Ms. Venkata Jag','3211546542','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd011','01','CAHYD002','jhfkjhbmbnkjhgfkjggdgd','Ms. Shaik','9876541321','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd012','02','CAHYD002','gfaskjlhgjfhaskfljgglkjgk','Mr. Surya','6541321654','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd014','04','CAHYD002','gfaskjlhgjfhaskfljgglkjgk','Mr. Aditya','6546123136','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd022','01','CAHYD003','jhkmnkkj67gfhgfj\hgvjbhghv','Mr. Vikas','3698521756','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd024','04','CAHYD003','654kjjcv1jg^mcgfhjhjkghg','Mr. Samppo','2154879632','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd032','01','CAHYD004','vgigjhygdyggojl,mkjhrygfkh','Mr. Shashidahr','6565636968','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd034','04','CAHYD005','fdstrd5yghgkjmcgfhjhjkghg','Mr. Ramarao','9848969695','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd041','01','CAHYD005','kjgurugkjgujhgmkjhrygfkh','Ms. Radha','7879797525','','','AP');
INSERT INTO CA_USERS VALUES('Bahyd042','04','CAHYD004','fdstrdjhfhgdcgfhjhjkghgjhg','Mr. Shankar','1234567890','','','AP');

INSERT INTO CA_USERS VALUES('Bamum001','01','CAMUM001','kjgurugkjgujhgmkjhrygggfkh','Ms. Ramya','6587527758','','','MH');
INSERT INTO CA_USERS VALUES('Bamum002','04','CAMUM001','fdstrdjhfhgdcgfhjhjkghgjhg','Mr. Nitesh','1234567895','','','MH');
INSERT INTO CA_USERS VALUES('Bamum011','01','CAMUM002','fjjsgjakajkbjsjuhsgkbkjjh','Mr. Kishore','8768786597','','','MH');
INSERT INTO CA_USERS VALUES('Bamum012','04','CAMUM002','jhakjnbxkjhgkjsjhgxkjkjg','Mr. Nanapatekar','8768765868','','','MH');
INSERT INTO CA_USERS VALUES('Bamum021','01','CAMUM003','jhknbkjgkjhglkjhlkjgkjgkj','Mr. Hardik Kat','6565465161','','','MH');
INSERT INTO CA_USERS VALUES('Bamum022','04','CAMUM003','jhglknlkjglkjh;kjhljkhlkj','Mr. Kashyap Joshi','5445665548','','','MH');


INSERT INTO CA_USERS VALUES('Badel011','01','CADEL002','fjjsgjakajkbjsjuhsgkbkjjh','Mr. Amit','8768786597','','','DL');
INSERT INTO CA_USERS VALUES('Badel012','04','CADEL002','jhakjnbxkjhgkjsjhgxkjkjg','Mr. Akhil Bh','8768765868','','','DL');
INSERT INTO CA_USERS VALUES('Badel021','01','CADEL003','jhknbkjgkjhglkjhlkjgkjgkj','Mr. Ch Chandan','8768786597','','','DL');
INSERT INTO CA_USERS VALUES('Badel022','04','CADEL003','jhglknlkjglkjh;kjhljkhlkj','Ms. Naina','8768765868','','','DL');
INSERT INTO CA_USERS VALUES('Badel031','01','CADEL001','jhknbkjgkjhglkjhlkjgkjgkj','Ms. Harani','8768786597','','','DL');
INSERT INTO CA_USERS VALUES('Badel042','04','CADEL001','jhglknlkjglkjh;kjhljkhlkj','Ms. Swetha','8768765868','','','DL');


INSERT INTO CA_USERS VALUES('Bachn011','01','CACHN002','JHFKJHjakajkbjsjuhsgkbkjjh','Mr. Anil','8768786597','','','TN');
INSERT INTO CA_USERS VALUES('Bachn012','04','CACHN002','GFDShgdJHGbxkjhgkjsjhgxkjk','Mr. Bachan','8768765868','','','TN');
INSERT INTO CA_USERS VALUES('Bachn021','01','CACHN003','LKJlkjhjhknbkjgkjhglkjhlk','Mr. Chinki','8768786597','','','TN');
INSERT INTO CA_USERS VALUES('Bachn022','04','CACHN003','jhglknlkjglkjh;kjhljkhlkj','Ms. AMALA','8768765868','','','TN');
INSERT INTO CA_USERS VALUES('Bachn031','01','CACHN004','jhknbkjgkjhglkjhlkjgkjgkj','Ms. Halan','8768786597','','','TN');
INSERT INTO CA_USERS VALUES('Bachn042','04','CACHN004','jhglknlkjglkjh;kjhljkhlkj','Ms. Sweety','8768765868','','','TN');

INSERT INTO CA_USERS VALUES('Bavjg021','01','CAVJG001','LKJlkjhjhknbkjgkjhglkjhlk','Mr. SHANKARI','8764686597','','','AP');
INSERT INTO CA_USERS VALUES('Bavjg022','04','CAVJG001','jhglknlkjglkjh;kjhljkhlkj','Ms. Paul An','8766235868','','','AP');
INSERT INTO CA_USERS VALUES('Bavjg031','01','CAVJG002','jhknbkjgkjhglkjhlkjgkjgkj','Ms. divya b ','8769876597','','','AP');
INSERT INTO CA_USERS VALUES('Bavjg042','04','CAVJG002','jhglknlkjglkjh;kjhljkhlkj','Ms. keerthana anand','9632765868','','','AP');

COMMIT;

----CA_DEALER_BLOCK_REASON-----

INSERT INTO CA_DEALER_BLOCK_REASON (REASON_CODE,REASON_DESC) VALUES('11','Payments not submitted to banker');
INSERT INTO CA_DEALER_BLOCK_REASON (REASON_CODE,REASON_DESC) VALUES('22','Blocked by Manager for other reason');
INSERT INTO CA_DEALER_BLOCK_REASON (REASON_CODE,REASON_DESC) VALUES('33','Partial Payments not submitted to banker from past 3 days');

COMMIT;

----CA_DEALER_BLOCK

INSERT INTO CA_DEALER_BLOCK(DEALER_LOGIN_ID ,REASON_CODE ,IS_BLOCKED ,CREATED_BY ,REMARKS )
  VALUES('Bachn011','22','Y','Bachn012','Fraud');
INSERT INTO CA_DEALER_BLOCK(DEALER_LOGIN_ID ,REASON_CODE ,IS_BLOCKED ,CREATED_BY ,REMARKS )
  VALUES('Bahyd001','22','Y','Bahyd006','Fraud');
  
  
COMMIT;

-----CA_PAYMENTS_TYPES

INSERT INTO CA_PAYMENT_TYPES VALUES('1001','Cash Payment','Cash Payment Accepted at store');
INSERT INTO CA_PAYMENT_TYPES VALUES('1002','Cheque Payment','Cheque Payment Accepted at store');
INSERT INTO CA_PAYMENT_TYPES VALUES('1003','Credit card Payment','Credit Card Payment Accepted at store');
INSERT INTO CA_PAYMENT_TYPES VALUES('7001','Vendor Cash Payment','Cash Payment Accepted at vendor location');
INSERT INTO CA_PAYMENT_TYPES VALUES('7002','Vendor Cheque Payment','Cheque Payment Accepted at vendor location');
INSERT INTO CA_PAYMENT_TYPES VALUES('7003','Vendor Credit card Payment','Credit Card Payment Accepted at vendor location');

COMMIT;

------CA_DEALER_PAYMENT----

insert into CA_DEALER_PAYMENTS
(select 	'100001',	'Bahyd001',	'1001',	'100000100',	'9890765457',	'500',	'1-Jan-14'	from dual	union all
select 	'100002',	'Bahyd002',	'1001',	'100000100',	'9890765458',	'550',	'2-Jan-14'	from dual	union all
select 	'100003',	'Bahyd011',	'1001',	'100000100',	'9890765459',	'555',	'3-Jan-14'	from dual	union all
select 	'100004',	'Bahyd022',	'1001',	'100000103',	'9890765460',	'560',	'4-Jan-14'	from dual	union all
select 	'100005',	'Bahyd032',	'1001',	'100000104',	'9890765461',	'565',	'5-Jan-14'	from dual	union all
select 	'100006',	'Bahyd041',	'1001',	'100000105',	'9890765462',	'570',	'6-Jan-14'	from dual	union all
select 	'100007',	'Bamum001',	'1001',	'100000106',	'9890765463',	'575',	'7-Jan-14'	from dual	union all
select 	'100008',	'Bamum011',	'1001',	'100000106',	'9890765464',	'580',	'8-Jan-14'	from dual	union all
select 	'100009',	'Bamum021',	'1001',	'100000108',	'9890765465',	'585',	'9-Jan-14'	from dual	union all
select 	'100010',	'Badel011',	'1001',	'100000109',	'9890765466',	'590',	'10-Jan-14'	from dual	union all
select 	'100011',	'Badel021',	'1001',	'100000110',	'9890765467',	'595',	'11-Jan-14'	from dual	union all
select 	'100012',	'Badel031',	'1001',	'100000111',	'9890765468',	'600',	'12-Jan-14'	from dual	union all
select 	'100013',	'Bachn011',	'1001',	'100000112',	'9890765469',	'605',	'13-Jan-14'	from dual	union all
select 	'100014',	'Bachn021',	'1001',	'100000113',	'9890765470',	'610',	'14-Jan-14'	from dual	union all
select 	'100015',	'Bachn031',	'1001',	'100000114',	'9890765471',	'615',	'15-Jan-14'	from dual	union all
select 	'100016',	'Bavjg021',	'1001',	'100000115',	'9890765472',	'1000',	'16-Jan-14'	from dual	union all
select 	'100017',	'Bavjg031',	'1001',	'100000116',	'9890765473',	'1035',	'17-Jan-14'	from dual	union all
select 	'100018',	'Bahyd001',	'1001',	'100000117',	'9890765474',	'1070',	'18-Jan-14'	from dual	union all
select 	'100019',	'Bahyd002',	'1001',	'100000118',	'9890765475',	'1105',	'19-Jan-14'	from dual	union all
select 	'100020',	'Bahyd011',	'1001',	'100000119',	'9890765476',	'1140',	'1-Jan-14'	from dual	union all
select 	'100021',	'Bahyd022',	'1001',	'100000120',	'9890765477',	'1175',	'2-Jan-14'	from dual	union all
select 	'100022',	'Bahyd032',	'1001',	'100000121',	'9890765478',	'1210',	'3-Jan-14'	from dual	union all
select 	'100023',	'Bahyd041',	'1001',	'100000122',	'9890765479',	'1245',	'4-Jan-14'	from dual	union all
select 	'100024',	'Bamum001',	'1001',	'100000123',	'9890765480',	'1280',	'5-Jan-14'	from dual	union all
select 	'100025',	'Bamum011',	'1001',	'100000124',	'9890765481',	'1315',	'6-Jan-14'	from dual	union all
select 	'100026',	'Bamum021',	'1001',	'100000125',	'9890765482',	'897',	'7-Jan-14'	from dual	union all
select 	'100027',	'Badel011',	'1001',	'100000126',	'9890765483',	'910',	'8-Jan-14'	from dual	union all
select 	'100028',	'Badel021',	'1001',	'100000127',	'9890765484',	'923',	'9-Jan-14'	from dual	union all
select 	'100029',	'Badel031',	'1001',	'100000128',	'9890765485',	'936',	'10-Jan-14'	from dual	union all
select 	'100030',	'Bachn011',	'1001',	'100000129',	'9890765486',	'949',	'5-Feb-14'	from dual	union all
select 	'100031',	'Bachn021',	'1001',	'100000130',	'9890765487',	'962',	'5-Mar-14'	from dual	union all
select 	'100032',	'Bachn031',	'1001',	'100000131',	'9890765488',	'975',	'5-Apr-14'	from dual	union all
select 	'100033',	'Bavjg021',	'1001',	'100000132',	'9890765489',	'988',	'5-May-14'	from dual	union all
select 	'100034',	'Bavjg031',	'1001',	'100000133',	'9890765490',	'1001',	'5-Jun-14'	from dual	union all
select 	'100035',	'Bahyd001',	'1001',	'100000134',	'9890765491',	'1014',	'5-Jul-14'	from dual	union all
select 	'100036',	'Bahyd002',	'1001',	'100000135',	'9890765492',	'1027',	'5-Aug-14'	from dual	union all
select 	'100037',	'Bahyd011',	'1001',	'100000136',	'9890765493',	'1040',	'5-Sep-14'	from dual	union all
select 	'100038',	'Bahyd022',	'1001',	'100000137',	'9890765494',	'1053',	'5-Oct-14'	from dual	union all
select 	'100039',	'Bahyd032',	'1001',	'100000138',	'9890765495',	'1066',	'5-Nov-14'	from dual	union all
select 	'100040',	'Bahyd041',	'1001',	'100000139',	'9890765496',	'1079',	'5-Dec-14'	from dual	union all
select 	'100041',	'Bamum001',	'1001',	'100000140',	'9890765497',	'1092',	'5-Jan-15'	from dual	union all
select 	'100042',	'Bamum011',	'1001',	'100000141',	'9890765498',	'1105',	'5-Feb-15'	from dual	union all
select 	'100043',	'Bamum021',	'1001',	'100000142',	'9890765499',	'1118',	'5-Mar-15'	from dual	union all
select 	'100044',	'Badel011',	'1001',	'100000143',	'9890765500',	'1131',	'5-Apr-15'	from dual	union all
select 	'100045',	'Badel021',	'1002',	'100000144',	'9890765501',	'1144',	'5-May-15'	from dual	union all
select 	'100046',	'Badel031',	'1002',	'100000145',	'9890765502',	'1157',	'5-Jun-15'	from dual	union all
select 	'100047',	'Bachn011',	'1002',	'100000146',	'9890765503',	'1170',	'5-Jul-15'	from dual	union all
select 	'100048',	'Bachn021',	'1002',	'100000147',	'9890765504',	'1183',	'5-Aug-15'	from dual	union all
select 	'100049',	'Bachn031',	'1002',	'100000148',	'9890765505',	'1196',	'5-Sep-15'	from dual	union all
select 	'100050',	'Bavjg021',	'1002',	'100000149',	'9890765506',	'1209',	'5-Oct-15'	from dual	union all
select 	'100051',	'Bavjg031',	'1002',	'100000150',	'9890765507',	'1222',	'5-Nov-15'	from dual	union all
select 	'100052',	'Bahyd001',	'1002',	'100000151',	'9890765508',	'1235',	'5-Dec-15'	from dual	union all
select 	'100053',	'Bahyd002',	'1002',	'100000152',	'9890765509',	'1248',	'6-Jan-15'	from dual	union all
select 	'100054',	'Bahyd011',	'1002',	'100000153',	'9890765510',	'1261',	'7-Jan-15'	from dual	union all
select 	'100055',	'Bahyd022',	'1002',	'100000154',	'9890765511',	'1274',	'8-Jan-15'	from dual	union all
select 	'100056',	'Bahyd032',	'1002',	'100000155',	'9890765512',	'1287',	'9-Jan-15'	from dual	union all
select 	'100057',	'Bahyd001',	'1002',	'100000156',	'9890765513',	'1300',	'10-Jan-15'	from dual	union all
select 	'100058',	'Bahyd002',	'1002',	'100000157',	'9890765514',	'1313',	'11-Jan-15'	from dual	union all
select 	'100059',	'Bahyd011',	'1002',	'100000158',	'9890765515',	'1326',	'12-Jan-15'	from dual	union all
select 	'100060',	'Bahyd022',	'1002',	'100000159',	'9890765516',	'1339',	'13-Jan-15'	from dual	union all
select 	'100061',	'Bahyd032',	'1002',	'100000160',	'9890765517',	'1352',	'14-Jan-15'	from dual	union all
select 	'100062',	'Bahyd001',	'1002',	'100000161',	'9890765518',	'1365',	'15-Jan-15'	from dual	union all
select 	'100063',	'Bahyd002',	'1002',	'100000162',	'9890765519',	'1378',	'16-Jan-15'	from dual	union all
select 	'100064',	'Bahyd011',	'1002',	'100000163',	'9890765520',	'1391',	'17-Jan-15'	from dual	union all
select 	'100065',	'Bahyd022',	'1002',	'100000164',	'9890765521',	'1404',	'18-Jan-15'	from dual	union all
select 	'100066',	'Bahyd032',	'1002',	'100000165',	'9890765522',	'1417',	'19-Jan-15'	from dual	union all
select 	'100067',	'Bahyd001',	'1002',	'100000166',	'9890765523',	'1430',	'20-Jan-15'	from dual	union all
select 	'100068',	'Bahyd002',	'1002',	'100000167',	'9890765524',	'1443',	'21-Jan-15'	from dual	union all
select 	'100069',	'Bahyd011',	'1002',	'100000168',	'9890765525',	'1456',	'22-Jan-15'	from dual	union all
select 	'100070',	'Bahyd022',	'1002',	'100000169',	'9890765526',	'1469',	'23-Jan-15'	from dual	union all
select 	'100071',	'Bahyd032',	'1002',	'100000170',	'9890765527',	'1482',	'24-Jan-15'	from dual	union all
select 	'100072',	'Bahyd041',	'1002',	'100000171',	'9890765528',	'1495',	'25-Jan-15'	from dual	union all
select 	'100073',	'Bamum001',	'1002',	'100000172',	'9890765529',	'1508',	'26-Jan-15'	from dual	union all
select 	'100074',	'Bamum011',	'1002',	'100000173',	'9890765530',	'1521',	'27-Jan-15'	from dual	union all
select 	'100075',	'Bamum021',	'1002',	'100000174',	'9890765531',	'1534',	'28-Jan-15'	from dual	union all
select 	'100076',	'Bahyd041',	'1002',	'100000175',	'9890765532',	'1547',	'29-Jan-15'	from dual	union all
select 	'100077',	'Bamum001',	'1002',	'100000176',	'9890765533',	'1560',	'30-Jan-15'	from dual	union all
select 	'100078',	'Bamum011',	'1002',	'100000177',	'9890765534',	'1573',	'31-Jan-15'	from dual	union all
select 	'100079',	'Bamum021',	'1002',	'100000178',	'9890765535',	'1586',	'1-Feb-15'	from dual	union all
select 	'100080',	'Bahyd041',	'1002',	'100000179',	'9890765536',	'1599',	'2-Feb-15'	from dual	union all
select 	'100081',	'Bamum001',	'1002',	'100000180',	'9890765537',	'1612',	'3-Feb-15'	from dual	union all
select 	'100082',	'Bamum011',	'1002',	'100000181',	'9890765538',	'1625',	'4-Feb-15'	from dual	union all
select 	'100083',	'Bamum021',	'1002',	'100000182',	'9890765539',	'1638',	'5-Feb-15'	from dual	union all
select 	'100084',	'Bahyd041',	'1002',	'100000183',	'9890765540',	'1651',	'6-Feb-15'	from dual	union all
select 	'100085',	'Bamum001',	'1002',	'100000184',	'9890765541',	'1664',	'7-Feb-15'	from dual	union all
select 	'100086',	'Bamum011',	'1002',	'100000185',	'9890765542',	'1677',	'8-Feb-15'	from dual	union all
select 	'100087',	'Bamum021',	'1002',	'100000186',	'9890765543',	'1690',	'9-Feb-15'	from dual	union all
select 	'100088',	'Bahyd041',	'1002',	'100000187',	'9890765544',	'1703',	'10-Feb-15'	from dual	union all
select 	'100089',	'Bamum001',	'1002',	'100000188',	'9890765545',	'1716',	'11-Feb-15'	from dual	union all
select 	'100090',	'Bamum011',	'1002',	'100000189',	'9890765546',	'1729',	'12-Feb-15'	from dual	union all
select 	'100091',	'Bamum021',	'1002',	'100000190',	'9890765547',	'1742',	'13-Feb-15'	from dual	union all
select 	'100092',	'Bahyd041',	'1002',	'100000191',	'9890765548',	'1755',	'14-Feb-15'	from dual	union all
select 	'100093',	'Bamum001',	'1002',	'100000192',	'9890765549',	'1768',	'15-Feb-15'	from dual	union all
select 	'100094',	'Bamum011',	'1002',	'100000193',	'9890765550',	'1781',	'16-Feb-15'	from dual	union all
select 	'100095',	'Bamum021',	'1002',	'100000194',	'9890765551',	'1794',	'17-Feb-15'	from dual	union all
select 	'100096',	'Bahyd041',	'1002',	'100000195',	'9890765552',	'1807',	'18-Feb-15'	from dual	union all
select 	'100097',	'Bamum001',	'1002',	'100000196',	'9890765553',	'1820',	'19-Feb-15'	from dual	union all
select 	'100098',	'Bamum011',	'1002',	'100000197',	'9890765554',	'1833',	'20-Feb-15'	from dual	union all
select 	'100099',	'Bamum021',	'1002',	'100000198',	'9890765555',	'1846',	'21-Feb-15'	from dual	);


insert into CA_DEALER_PAYMENTS
(select 	'100101',	'Bahyd001',	'1001',	'100000100',	'9890765457',	'500',	'1-Jan-14'	from dual	union all
select 	'100102',	'Bahyd002',	'1001',	'100000100',	'9890765458',	'550',	'2-Jan-14'	from dual	union all
select 	'100103',	'Bahyd011',	'1001',	'100000100',	'9890765459',	'555',	'3-Jan-14'	from dual	union all
select 	'100104',	'Bahyd022',	'1001',	'100000103',	'9890765460',	'560',	'4-Jan-14'	from dual	union all
select 	'100105',	'Bahyd032',	'1001',	'100000104',	'9890765461',	'565',	'5-Jan-14'	from dual	union all
select 	'100106',	'Bahyd041',	'1001',	'100000105',	'9890765462',	'570',	'6-Jan-14'	from dual	union all
select 	'100107',	'Bamum001',	'1001',	'100000106',	'9890765463',	'575',	'7-Jan-14'	from dual	union all
select 	'100108',	'Bamum011',	'1001',	'100000106',	'9890765464',	'580',	'8-Jan-14'	from dual	union all
select 	'100109',	'Bamum021',	'1001',	'100000108',	'9890765465',	'585',	'9-Jan-14'	from dual	union all
select 	'100110',	'Badel011',	'1001',	'100000109',	'9890765466',	'590',	'10-Jan-14'	from dual	);


insert into CA_DEALER_PAYMENTS
(select 	'100201',	'Bahyd001',	'1001',	'100000100',	'9890765457',	'500',	'1-Jan-14'	from dual	union all
select 	'100202',	'Bahyd002',	'1001',	'100000100',	'9890765458',	'550',	'2-Jan-14'	from dual	union all
select 	'100203',	'Bahyd011',	'1001',	'100000100',	'9890765459',	'555',	'3-Jan-14'	from dual	union all
select 	'100204',	'Bahyd022',	'1001',	'100000103',	'9890765460',	'560',	'4-Jan-14'	from dual	union all
select 	'100205',	'Bahyd032',	'1001',	'100000104',	'9890765461',	'565',	'5-Jan-14'	from dual	union all
select 	'100206',	'Bahyd041',	'1001',	'100000105',	'9890765462',	'570',	'6-Jan-14'	from dual	);

insert into CA_DEALER_PAYMENTS
(select 	'100301',	'Bahyd001',	'1001',	'100000100',	'9890765457',	'500',	'1-Jan-14'	from dual	union all
select 	'100302',	'Bahyd002',	'1001',	'100000100',	'9890765458',	'550',	'2-Jan-14'	from dual	union all
select 	'100303',	'Bahyd011',	'1001',	'100000100',	'9890765459',	'555',	'3-Jan-14'	from dual	);

insert into CA_DEALER_PAYMENTS
(select 	'100401',	'Bahyd001',	'1001',	'100000100',	'9890765457',	'500',	'1-Jan-14'	from dual	union all
select 	'100402',	'Bahyd002',	'1001',	'100000100',	'9890765458',	'550',	'2-Jan-14'	from dual	);

COMMIT;

-------CA_PICKUP_ADVICE_DTLS-----

DECLARE
pk VARCHAR2(10):=null;
ps VARCHAR2(10):=null;
nu NUMBER(6):=100001;
BEGIN
FOR i IN (SELECT DISTINCT PAYMENT_DATE AS pd,DEALER_LOGIN_ID id1 FROM CA_DEALER_PAYMENTS) 
loop

select 'D1'||nu into ps from dual;

SELECT a.PICKUP_LOCATION_ID into pk FROM CA_PICKUP_LOCATION_MSTR a,ca_users b 
  WHERE b.DEALER_LOGIN_ID = i.id1 
  and a.PICKUP_LOCATION_ID=b.PICKUP_LOCATION_ID;
  
INSERT INTO CA_PICKUP_ADVICE_DTLS (receipt_no,account_no,trans_amount,pickup_location_id,payinslip_no,payment_trans_id,created_date,circle)
(select receipt_no,account_no,amount,pk,ps,payment_trans_id,payment_date, 
        (select a.DEALER_CIRCLE from ca_users a 
        where a.dealer_login_id = b.dealer_login_id
        ) 
    from ca_dealer_payments b
    where b.PAYMENT_DATE = i.pd 
    and b.DEALER_LOGIN_ID = i.id1
);

nu:=nu+1;

end loop;
commit;
END;
/

-----CA_PICKUP_ADVICE_FILE_MSTR----

DECLARE
fn VARCHAR2(100):=null;
fi NUMBER(10):=0;
cn number(10):=0;
BEGIN
FOR i IN (SELECT DISTINCT CREATED_DATE AS pd,CIRCLE id1 FROM CA_PICKUP_ADVICE_DTLS) 
loop

SELECT 'CA_'||i.id1||'_PICKUP_ADVICE_'||i.pd into fn from dual;
SELECT COUNT(*) INTO cn FROM CA_PICKUP_ADVICE_DTLS where created_date = i.pd and circle=i.id1;

INSERT INTO CA_PICKUP_ADVICE_FILE_MSTR (FILE_NAME,FILE_TYPE,NO_OF_ROWS,CREATED_DATE,CREATED_BY)
(SELECT distinct fn,'PICKUP_ADVICE',cn,created_date+1,'CAAS' 
    FROM CA_PICKUP_ADVICE_DTLS 
    WHERE created_date = i.pd and circle = i.id1
);
end loop;

for j in (SELECT DISTINCT CREATED_DATE AS pd,CIRCLE id1 FROM CA_PICKUP_ADVICE_DTLS)
loop

select file_id into fi from ca_pickup_advice_file_mstr 
    where j.id1=substr(file_name,4,2) 
    and j.pd=created_date-1;

update CA_PICKUP_ADVICE_DTLS 
    SET FILE_ID =fi 
  where j.id1=circle 
  and j.pd=created_date;

end loop;
commit;
END;
/

-----CA_BANKER_ACK_DTLS-----

INSERT INTO CA_BANKER_ACK_DTLS 
(SELECT SUBSTR(B.FILE_NAME,1,6)||'COLLECTED_'||B.CREATED_DATE,A.RECEIPT_NO,A.TRANS_AMOUNT,A.PAYINSLIP_NO,A.PICKUP_LOCATION_ID,'COLLECTED',A.CREATED_DATE 
  FROM CA_PICKUP_ADVICE_DTLS A 
  JOIN CA_PICKUP_ADVICE_FILE_MSTR B
  ON (A.FILE_ID= B.FILE_ID));
  
  
UPDATE CA_BANKER_ACK_DTLS SET STATUS = 'NOT COLCTD' WHERE PAYINSLIP_NO IN ('D1100004','D1100001','D1100002');
  
UPDATE CA_PICKUP_ADVICE_DTLS SET STATUS = 'NOT COLCTD' WHERE PAYINSLIP_NO IN ('D1100004','D1100001','D1100002');

UPDATE CA_PICKUP_ADVICE_DTLS SET STATUS = 'COLLECTED',COLLECTED_DATE = CREATED_DATE+1 WHERE PAYINSLIP_NO NOT IN ('D1100004','D1100001','D1100002');

COMMIT;


----Blocking dealers who have not submitted the payments

insert into CA_DEALER_BLOCK(dealer_login_id,REASON_CODE,IS_BLOCKED,CREATED_BY,TRANS_DATE)
select b.dealer_login_id,'11','Y','CAAS',to_char(b.payment_date) from ca_pickup_advice_dtls a join ca_dealer_payments b
      on a.receipt_no = b.receipt_no
      where a.status <> 'COLLECTED' 
      and sysdate-a.created_date>3;
      
commit;