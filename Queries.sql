--Question 1

COLUMN make FORMAT A10;
COLUMN model FORMAT A11;
COLUMN year FORMAT 9999;
COLUMN "Start Date" FORMAT A12;
COLUMN "Return Date" FORMAT A14;

SELECT rentalno AS "Rental Num",
       startdate AS "Start Date",
       returndate AS "Return Date",
       mileagebefore AS "Starting Mileage",
       mileageafter AS "Ending Mileage",
       licenseno AS "License Num",
       outno AS "Outlet Num",
       make AS "Make",
       model AS "Model",
       year AS "Year",
       NVL(TO_CHAR(datechecked), 'No fault reports') AS "Date Checked"
FROM ragreement JOIN vehicle USING (licenseno)
                LEFT OUTER JOIN faultreport USING (rentalno, licenseno)
ORDER BY 1;


-- Question 2
-- Assumption - Average distance driven per rental for last year - considered 2017
-- Within/in last year considered to be sysdate - 365

SELECT outno AS "Outlet Num",
       numvehicles AS "Num of Vehicles",
       num_rentals_within_last_year AS "Num Rentals (Last Year)",
       avg_distance AS "Average Distance",
       numemp AS "Num of Employees",
       round(num_rentals_within_last_year/numEmp,2) AS "Rentals per Employee" 
FROM (SELECT NVL(TO_CHAR(outno),'Total') AS outno,
      COUNT(licenseno) AS numvehicles
      FROM outlet JOIN vehicle USING(outno)
      GROUP BY GROUPING SETS(outno,())) 
      NATURAL JOIN
     (SELECT NVL(TO_CHAR(outno),'Total') AS outno, COUNT(startdate) AS num_rentals_within_last_year
      FROM outlet JOIN vehicle USING(outno) 
                  JOIN ragreement USING(licenseno)
      WHERE startdate > (SYSDATE - 365)
      GROUP BY GROUPING SETS(outno,()))
      NATURAL JOIN
     (SELECT NVL(TO_CHAR(outno),'Total') AS outno, 
      AVG(-mileagebefore+mileageafter) AS avg_distance
      FROM outlet JOIN vehicle USING(outno)
                  JOIN ragreement USING(licenseno)
      WHERE EXTRACT(year FROM returndate) = EXTRACT(year FROM SYSDATE) - 1
      GROUP BY GROUPING SETS(outno,()))
      NATURAL JOIN
     (SELECT NVL(TO_CHAR(outno),'Total') AS outno,
      COUNT(empno) AS numEmp
      FROM outlet JOIN employee USING(outno)
      GROUP BY GROUPING SETS(outno,()));
      
-- Question 3
-- Reference: https://community.oracle.com/thread/2406870 for chronological order
SELECT nvl(month,'Total') AS month, SUM(DECODE(outno, 1, TRUNC(returndate-startdate) * dailyrate, 0)) AS "Outlet 1",
       SUM(DECODE(outno, 2, TRUNC(returndate-startdate) * dailyrate, 0)) AS "Outlet 2",
       SUM(DECODE(outno, 3, TRUNC(returndate-startdate) * dailyrate, 0)) AS "Outlet 3",
       NVL(SUM(TRUNC(returndate - startdate) * dailyrate), 0) AS "Total Month Revenue",
       NVL(COUNT(rentalno), 0) AS rental_count,
       ROUND(DECODE(NVL(COUNT(rentalno), 0), 0, 0, NVL(SUM(TRUNC(returndate-startdate) * dailyrate), 0) / COUNT(rentalno)),2) AS "Revenue per Rental"
FROM (SELECT * 
      FROM (SELECT DECODE(TO_CHAR(returndate,'Month'), 
                   NULL, 
                   'Total', 
                   TO_CHAR(returndate,'Month')) AS month,
                   outno,
                   returndate,
                   startdate,
                   dailyrate,
                   rentalno
            FROM outlet NATURAL JOIN vehicle 
                        NATURAL JOIN ragreement 
            WHERE EXTRACT(YEAR FROM STARTDATE) = EXTRACT(YEAR FROM SYSDATE) - 1) y
      RIGHT OUTER JOIN
     (SELECT TO_CHAR(add_months(DATE '2018-01-15',level-1),'Month') AS month
      FROM dual
      CONNECT BY LEVEL <=12) x
      USING (month))         
GROUP BY ROLLUP(month)
ORDER BY DECODE(TRIM(month),'January'  ,1,
                                          'February' ,2,
                                          'March'    ,3,
                                          'April'    ,4,
                                          'May'      ,5,
                                          'June'     ,6,
                                          'July'     ,7,
                                          'August'   ,8,
                                          'September',9,
                                          'October'  ,10,
                                          'November' ,11,
                                          'December' ,12,13);
                                          
-- Question 4
-- Assumption: Considered number of fault reports and number of rental agreements separately
-- Used SUM(monday) etc as sum of 1 measure is itself. It was needed for group function
SELECT DECODE(outno,NULL,'Total',outno) AS outno,
       SUM(monday) AS monday,SUM(tuesday) AS tuesday,
       SUM(wednesday) AS wednesday,SUM(thursday) AS thursday,
       SUM(Friday) AS friday,SUM(Saturday) AS saturday,
       SUM(Sunday) AS sunday,SUM(totalcount) AS totalcount 
FROM ((SELECT DECODE(outno,NULL,'Total','Rent: ' || outno ) AS outno,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'MON',1,0)) AS Monday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'TUE',1,0)) AS Tuesday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'WED',1,0)) AS Wednesday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'THU',1,0)) AS Thursday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'FRI',1,0)) AS Friday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'SAT',1,0)) AS Saturday,
             SUM(DECODE(TO_CHAR(startdate,'DY'), 'SUN',1,0)) AS Sunday,
             COUNT(rentalno) AS totalcount
       FROM outlet NATURAL JOIN    vehicle 
                  NATURAL JOIN    ragreement 
                  LEFT OUTER JOIN faultreport USING (licenseno,rentalno)
       WHERE  SYSDATE - startdate <= 180
       GROUP BY (outno))
      UNION
      (SELECT DECODE(outno,NULL,'Total','Report: ' || outno ) AS outno,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'MON', 1 , 0)) AS Monday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'TUE', 1 , 0)) AS Tuesday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'WED', 1 , 0)) AS Wednesday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'THU', 1 , 0)) AS Thursday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'FRI', 1 , 0)) AS Friday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'SAT', 1 , 0)) AS Saturday,
              SUM(DECODE(TO_CHAR(datechecked,'DY'), 'SUN', 1 , 0)) AS Sunday,
              COUNT(reportnum) AS totalcount
       FROM outlet NATURAL JOIN    vehicle 
                   NATURAL JOIN    ragreement 
                   LEFT OUTER JOIN faultreport USING (licenseno,rentalno)
       WHERE  SYSDATE - datechecked <= 180
       GROUP BY (outno)))
GROUP BY GROUPING SETS(outno,());


-- Question 5

SELECT NVL(TO_CHAR(o.outno),'Manager total'), managerno || ': ' || fname || ' ' || lname AS Manager,
       COUNT(r.rentalno) AS num_rental, ROUND(SUM((RETURNDATE - STARTDATE)*DAILYRATE)/COUNT(r.rentalno),2) AS REVENUE_per_rental,
       ROUND(SUM(DECODE(reportnum,NULL,0,1))/COUNT(r.rentalno),2) AS num_fault_per_rental
FROM outlet o JOIN vehicle v ON v.outno=o.outno
              JOIN ragreement r ON v.licenseno=r.licenseno
              LEFT OUTER JOIN faultreport f ON f.rentalno=r.rentalno AND f.licenseno=r.licenseno
              JOIN employee e ON e.empno=o.managerno
GROUP BY GROUPING SETS((o.outno, o.managerno || ': ' || e.fname || ' ' || e.lname),(o.managerno || ': ' || e.fname || ' ' || e.lname))
ORDER BY 2;


-- Question 6
-- Assumption : Considered Maximum and minimum revenue generated for 2 quarters combined. 
SELECT (CASE  WHEN ROWNUM = 1 THEN 'Min Revenue'
              WHEN ROWNUM = 2 THEN 'Max Revenue' END) AS "Status",
        out_no AS "Outlet No.",
        revenue AS "Revenue"
FROM ((SELECT *
       FROM (SELECT outno AS out_no, ROUND(SUM((NVL(returndate,NULL)-startdate) * dailyrate),2) AS revenue
             FROM ragreement JOIN vehicle USING(licenseno)
                             JOIN outlet  USING (outno)
             WHERE (EXTRACT(month FROM returndate) >= 10 AND EXTRACT(year FROM returndate) = EXTRACT(year FROM sysdate) - 1) 
             OR    (EXTRACT(month FROM returndate) <= 3 AND EXTRACT(year FROM returndate) = EXTRACT(year FROM sysdate)) 
             GROUP BY (outno)
             ORDER BY 2 DESC)
       WHERE ROWNUM = 1)
       UNION
     (SELECT * 
      FROM (SELECT outno as out_no, 
                   ROUND(SUM((NVL(returndate,NULL)-startdate) * dailyrate),2) AS revenue
            FROM ragreement JOIN vehicle USING (licenseno)
                            JOIN outlet  USING (outno)
            WHERE (EXTRACT(month FROM returndate) >= 10 AND EXTRACT(year FROM returndate) = EXTRACT(year FROM sysdate) - 1) 
            OR (EXTRACT(month FROM returndate) <= 3 AND EXTRACT(year FROM returndate) = EXTRACT(year FROM sysdate)) 
            GROUP BY (outno)
            ORDER BY 2)
      WHERE ROWNUM = 1));

    
-- Question 7
-- Assumption: Average is average of (sysdate - year of vehicle)
SELECT make,model,num_cars,avg_age, 
       NVL(num_rentals,0) AS num_rentals, 
       NVL(num_days_rented ,0) AS num_days_rented,  
       NVL(num_fault_reports ,0) AS num_fault_reports 
FROM ((SELECT NVL(make,'_total') AS make,
              NVL(model,DECODE(make,NULL,' ', '_Sub Total ' || make )) AS model, 
              COUNT(*) AS num_cars, 
              ROUND(AVG(EXTRACT(YEAR FROM SYSDATE) - year),2) AS avg_age
       FROM vehicle
       GROUP BY ROLLUP (make,model))
       LEFT JOIN 
      (SELECT NVL(make,'_total') AS make,
              NVL(model,DECODE(make,NULL,' ', '_Sub Total ' || make )) AS model,
              NVL(COUNT(*),0) AS num_rentals, 
              NVL(SUM(TRUNC(NVL(returndate,SYSDATE) - startdate)),0) AS num_days_rented,
              NVL(COUNT(reportnum),0) AS num_fault_reports
       FROM vehicle LEFT OUTER JOIN ragreement  USING (licenseno) 
                    LEFT OUTER JOIN faultreport USING (rentalno,licenseno)
       WHERE EXTRACT(YEAR FROM startdate) = EXTRACT(YEAR FROM SYSDATE)
       GROUP BY ROLLUP (make,model))    
       USING (make,model))
ORDER BY 1,2;


-- Question 8 -- Reference https://www.tek-tips.com/viewthread.cfm?qid=1703809 for getting the quarter from date

-- Considering only the makes rented last year in all the quarters: 
SELECT TO_CHAR(returndate,'Q') AS Quarter, make, 
       DECODE(COUNT(rentalno),0,0,COUNT(reportnum)/COUNT(rentalno)) AS likelihood,
       RANK() over (PARTITION BY (TO_CHAR(returndate,'Q')) 
                    ORDER BY  DECODE(COUNT(rentalno),0,0,COUNT(reportnum)/COUNT(rentalno)) DESC) AS rank ,
       COUNT(rentalno) AS num_rentals
FROM vehicle   LEFT OUTER JOIN ragreement  USING (licenseno)
               LEFT OUTER JOIN faultreport USING (rentalno)
WHERE EXTRACT(YEAR FROM returndate) = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY (TO_CHAR(returndate,'Q'), make);

-- Considering all the makes irrespective of whether they are rented or not
SELECT B.quarter AS Quarter, make, 
       DECODE(COUNT(rentalno),0,0,COUNT(reportnum)/COUNT(rentalno)) AS likelihood,
       RANK() over (PARTITION BY B.quarter
                    ORDER BY  DECODE(COUNT(rentalno),0,0,COUNT(reportnum)/COUNT(rentalno)) DESC) AS rank ,
       COUNT(rentalno) AS num_rentals
FROM ((SELECT licenseno, TO_CHAR(returndate,'Q') AS quarter, rentalno, reportnum, returndate
       FROM vehicle   LEFT OUTER JOIN ragreement  USING (licenseno)
                      LEFT OUTER JOIN faultreport USING (rentalno,licenseno)
       WHERE EXTRACT(YEAR FROM returndate) = EXTRACT(YEAR FROM SYSDATE) - 1) A
       RIGHT OUTER JOIN
      (SELECT licenseno, make, quarter
       FROM vehicle NATURAL JOIN (SELECT LEVEL AS quarter
                                  FROM DUAL
                                  CONNECT BY LEVEL < 5)) B
       ON (A.licenseno = B.licenseno AND A.quarter = B.quarter))
GROUP BY (B.quarter, make);


---Question 9---
SELECT outno, same_state_customer_count,same_state_rental_count,
       ROUND(same_state_customer_count/total_customer_count,2) AS proportion_customer,
       ROUND(same_state_rental_count/total_rental_count,2) AS proportion_rental
FROM ((SELECT outno,count(DISTINCT clientno) AS same_state_customer_count,
                    count(rentalno) AS same_state_rental_count
       FROM client c JOIN ragreement ra USING (clientno)
                     JOIN vehicle USING (licenseno)
                     JOIN outlet o USING (outno)
       WHERE c.state = o.state
       GROUP BY outno)
       JOIN 
      (SELECT outno,count(DISTINCT clientno) AS total_customer_count,
                    count(rentalno) AS total_rental_count
       FROM client c JOIN ragreement ra USING (clientno)
                     JOIN vehicle USING (licenseno)
                     JOIN outlet o USING (outno)
       GROUP BY outno)
       USING (outno));
       
---Question 10---
COLUMN employee_Details FORMAT A30
SELECT emp_level, 
       employee_Details, 
       NVL(num_report,0) AS NUM_REPORT, 
       outno, 
       outlet_address 
FROM ((SELECT empno, LEVEL as emp_level, 
       LPAD(' ', 3*(LEVEL-1)) || empno || ' ' || fname || ' ' || lname AS employee_details,
       outno, 
       street || ', ' || city  || ', ' || state || ' ' || zipcode AS outlet_address
       FROM employee JOIN outlet USING (outno)
       START WITH empno = 1 or empno = 2 or empno = 3
       CONNECT BY PRIOR empno = supervisorno)
       LEFT OUTER JOIN        
      (SELECT empno, 
       count(reportnum) AS num_report
       FROM employee NATURAL JOIN faultreport
       WHERE SYSDATE - datechecked <= 90
       GROUP BY empno)
       USING (empno));