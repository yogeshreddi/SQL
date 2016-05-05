-------Location Report along with their address

SELECT * FROM CA_PICKUP_LOCATION_MSTR;

-------Report No of Locations/STORES available in each circle
SELECT COUNT(*) NO_OF_STORES,CIRCLE FROM 
  CA_PICKUP_LOCATION_MSTR
  GROUP BY CIRCLE;

-------USERS Report along with the role name and description

SELECT U.DEALER_LOGIN_ID,U.DEALER_NAME,U.DEALER_CIRCLE,D.DEALER_ROLE_ID,D.DEALER_ROLE_NAME,D.DEALER_ROLE_DESC 
  FROM CA_USERS U JOIN CA_DEALER_ROLE_DESC D
  ON (U.DEALER_ROLE_ID = D.DEALER_ROLE_ID);

-------Dealers Reports along with the store details of the dealer where he is working in

SELECT * FROM CA_PICKUP_LOCATION_MSTR NATURAL JOIN CA_USERS;

  
-------Dealer and his CIRCLE LEVEL MANAGER login_id's COMMA SEPERATED

SELECT DEALER_LOGIN_ID ,
      (SELECT WM_CONCAT(DISTINCT DEALER_LOGIN_ID) FROM CA_USERS M WHERE M.DEALER_CIRCLE =D.DEALER_CIRCLE AND DEALER_ROLE_ID = '04') MANAGER_ID 
      FROM CA_USERS D 
      WHERE D.DEALER_ROLE_ID IN ('01','02','03') ;

-------Dealer and his STORE LEVEL MANAGER login_id's 

SELECT DEALER_LOGIN_ID ,DEALER_NAME,DEALER_ROLE_ID,
      (SELECT WM_CONCAT(DEALER_LOGIN_ID) FROM 
            (SELECT * FROM CA_PICKUP_LOCATION_MSTR NATURAL JOIN CA_USERS) M 
             WHERE M.PICKUP_LOCATION_ID =D.PICKUP_LOCATION_ID 
             AND DEALER_ROLE_ID = '04') MANAGER_ID,
      (SELECT WM_CONCAT(DEALER_NAME) FROM 
            (SELECT * FROM CA_PICKUP_LOCATION_MSTR NATURAL JOIN CA_USERS) M 
             WHERE M.PICKUP_LOCATION_ID =D.PICKUP_LOCATION_ID 
             AND DEALER_ROLE_ID = '04') MANAGER_NAME 
    FROM (SELECT * FROM CA_PICKUP_LOCATION_MSTR NATURAL JOIN CA_USERS) D 
    WHERE D.DEALER_ROLE_ID IN ('01','02','03') ;

-------Report Showing circle's with total no of users,no of dealer,no of managers,no of cashiers,no of super users

SELECT COUNT(*) AS TOTAL_USERS,
        SUM(DECODE(DEALER_ROLE_ID,'01',1,0)) AS NO_OF_DEALERS,
        SUM(DECODE(DEALER_ROLE_ID,'02',1,0)) AS NO_OF_CASHIERS,
        SUM(DECODE(DEALER_ROLE_ID,'03',1,0)) AS NO_OF_SUPER_USERS,
        SUM(DECODE(DEALER_ROLE_ID,'04',1,0)) AS NO_OF_MANAGERS,
        DEALER_CIRCLE FROM CA_USERS 
  GROUP BY DEALER_CIRCLE;
    

------Report for fetching STORES/LOCATIONS which doesnot have any users working in it

SELECT * FROM CA_PICKUP_LOCATION_MSTR 
  WHERE PICKUP_LOCATION_ID NOT IN 
      (SELECT DISTINCT PICKUP_LOCATION_ID FROM CA_USERS);
  
------If in case due to some technical application issues payments were inserted into table multiple times, we need to fetch report for duplicates
------Query to fetch duplicates based on DEALER_LOGIN_ID,ACCOUNT_NO,DEL_NO,AMOUNT,PAYMENT_DATE USING GROUP BY 
------(since receipt number is a system generated can never be duplicate)

SELECT COUNT(*),DEALER_LOGIN_ID,ACCOUNT_NO,DEL_NO,AMOUNT,PAYMENT_DATE 
  FROM CA_DEALER_PAYMENTS 
  GROUP BY DEALER_LOGIN_ID,ACCOUNT_NO,DEL_NO,AMOUNT,PAYMENT_DATE
  HAVING COUNT(*)>1;

----From the duplicate payments we have to fetch only the duplicates 
  
SELECT  * FROM CA_DEALER_PAYMENTS 
WHERE RECEIPT_NO IN 
(SELECT RECEIPT_NO FROM
  (SELECT RECEIPT_NO,DEALER_LOGIN_ID,ACCOUNT_NO,DEL_NO,AMOUNT,PAYMENT_DATE, 
        RANK() OVER (PARTITION BY DEALER_LOGIN_ID,ACCOUNT_NO,DEL_NO,AMOUNT,PAYMENT_DATE  
                    ORDER BY RECEIPT_NO
                    ) AS RANK1
  FROM CA_DEALER_PAYMENTS
  ) 
WHERE RANK1>4
);

----Report to find the average payment acceptance(with a trucated decimal value) of dealers in sorted order descending

SELECT TRUNC(AVG(AMOUNT)) AVERAGE,DEALER_LOGIN_ID 
FROM CA_DEALER_PAYMENTS
GROUP BY DEALER_LOGIN_ID
ORDER BY AVERAGE DESC;

-----Report whihc gives the circle wise revenue for all the january months together

 SELECT SUM(TRANS_AMOUNT) AS AMOUNT,CIRCLE FROM CA_PICKUP_ADVICE_DTLS 
    WHERE SUBSTR(CREATED_DATE-1,4,3)= UPPER(&MONTH1)
    AND STATUS = 'COLLECTED'
    GROUP BY CIRCLE;
    
-----Report fetching dealer id,dealer name and his blocked status, if blocked reason for blocking

SELECT A.DEALER_LOGIN_ID,A.DEALER_NAME,DECODE(NVL(IS_BLOCKED,'N'),'Y','BLOCKED','NOT BLOCKED') BLOCK_STATUS,
    (SELECT NVL(REASON_DESC,'NA') FROM 
      CA_DEALER_BLOCK_REASON C 
      WHERE C.REASON_CODE = B.REASON_CODE) AS REASON,A.DEALER_CIRCLE
  FROM CA_USERS A LEFT OUTER JOIN CA_DEALER_BLOCK B
  ON (A.DEALER_LOGIN_ID = B.DEALER_LOGIN_ID);
  
  
  
------Report for fetching all the files and no of records in each of the file(both pickup advice and ack files)

select file_name,no_of_rows from ca_pickup_advice_file_mstr
union all
select file_name,count(*) as no_of_rows from ca_banker_ack_dtls 
Group by file_name;

------Report for fetching dealer/cashier/super user who can accept payments but are not accepting payments

SELECT * FROM CA_USERS 
    WHERE DEALER_LOGIN_ID NOT IN (SELECT DEALER_LOGIN_ID FROM CA_DEALER_PAYMENTS)
    AND DEALER_ROLE_ID IN ('01','02','03');
    
    
------Report Fetching the payments accepted between two dates along with their status

SELECT A.*,B.DEALER_ROLE_ID,C.STATUS FROM CA_DEALER_PAYMENTS A,
              CA_USERS B,
              CA_PICKUP_ADVICE_DTLS C
      WHERE A.RECEIPT_NO = C.RECEIPT_NO
      AND A.DEALER_LOGIN_ID = B.DEALER_LOGIN_ID
      AND A.PAYMENT_DATE BETWEEN TO_DATE(&START_DATE_IN_MMDDYYYY,'MM-DD-YYYY') and TO_DATE(&END_DATE_IN_MMDDYYYY,'MM-DD-YYYY');
