--This script displays all tables in the database, with proper formattting---

---Display Client Table---
COLUMN clientno FORMAT 99999;
COLUMN clientname FORMAT A15;
COLUMN street FORMAT A20;
COLUMN city FORMAT A15;
COLUMN webaddress FORMAT A25;
COLUMN contact_fname FORMAT A15;
COLUMN contact_lname FORMAT A15;

SELECT * FROM client;

---Display Outlet Table---
SELECT * FROM outlet;

---Display Employee Table---
COLUMN fname FORMAT A15;
COLUMN lname FORMAT A15;

SELECT * FROM employee;

---Display Vehicle Table---
COLUMN color FORMAT A10;
COLUMN inspectiondate FORMAT A10;
COLUMN outno FORMAT 99;

SELECT * FROM vehicle;

---Display Rental Agreement Table---
COLUMN returndate FORMAT A12;
COLUMN insurancetype FORMAT A13;

SELECT * FROM ragreement;

---Display Fault Report Table---
COLUMN datechecked FORMAT A12;
COLUMN comments FORMAT A30;

SELECT * FROM faultreport;