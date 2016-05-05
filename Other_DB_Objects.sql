--------Procedures and extra objects used for DB-----------


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



----SEQUENCE AND TRIGGER FOR FILE_ID IN PIKCUP_ADVICE_FILE_MSTR

DROP SEQUENCE SEQ_CA_PICKUP_ADVICE_FILE_ID;
CREATE SEQUENCE SEQ_CA_PICKUP_ADVICE_FILE_ID 
START WITH 1000000001
INCREMENT BY 1
MINVALUE 1000000001
MAXVALUE 9999999999
NOCACHE;

CREATE OR REPLACE TRIGGER TRG_CA_PICKUP_ADVICE_FILE_ID
BEFORE INSERT
ON CA_PICKUP_ADVICE_FILE_MSTR
FOR EACH ROW
BEGIN
SELECT SEQ_CA_PICKUP_ADVICE_FILE_ID.nextval INTO :NEW.FILE_ID FROM dual;
END;
/

---INDEX CREATION FOR PAYMENT TABLES
CREATE INDEX ACCOUNT_NO_INDEX ON CA_DEALER_PAYMENTS(ACCOUNT_NO) TABLESPACE USERS;

CREATE INDEX ACCOUNT_NO_INDEX_1 ON CA_PICKUP_ADVICE_DTLS(ACCOUNT_NO) TABLESPACE USERS;


----TO CHECK IF ALL THE TABLES ARE CREATED OR NOT

SELECT * FROM ALL_TABLES 
  WHERE UPPER(OWNER) =UPPER(USER)
  AND TABLE_NAME LIKE 'CA%';
  
----To check for the constraints created and matching with the constraints drawn in erd

SELECT * FROM ALL_CONSTRAINTS 
  WHERE UPPER(OWNER) = UPPER(USER)
  AND TABLE_NAME LIKE 'CA%'
  ORDER BY TABLE_NAME;
  
