---Client Table---
INSERT INTO client VALUES(1, 'Bob Smith', '687 Fearing Ave', 'Los Angeles', 'CA', 90001, NULL, 'Bob', 'Smith','213-568-9682', 'bob_smith@yahoo.com');
INSERT INTO client VALUES(2, 'Jennifer Lopez', '9242 Westwood Cir', 'Los Angeles', 'CA', 90036, NULL, 'Jennifer', 'Lopez','213-857-9935', 'jlo@gmail.com');
INSERT INTO client VALUES(3, 'Tom Cruz', '1327 Gatling St', 'Los Angeles', 'CA', 90027, NULL, 'Tom ', 'Cruz','213-823-4490', 'tommi@gmail.com');
INSERT INTO client VALUES(4, 'JustLee Books', '130 Ventura Blvd', 'Los Angeles', 'CA', 90210, 'justleebooks.com', 'Tim', 'Lee','718-552-9385', 'tim@justleebooks.com');
INSERT INTO client VALUES(5, 'Apple', '938 Fifth Ave', 'New York', 'NY', 10115, 'apple.com', 'Steve', 'Jobs','718-485-2994', 'sjobs@apple.com');
INSERT INTO client VALUES(6, 'Bill Gates', '8830 Brooklyn Dr', 'New York', 'NY', 10585, NULL, 'Bill', 'Gates','718-395-1993', 'bill.gates@hotmail.com');
INSERT INTO client VALUES(7, 'Liam Neeson', '901 6th St', 'New York', 'NY', 10482, NULL, 'Liam', 'Neeson','718-298-2957', 'liamneeson@yahoo.com');
INSERT INTO client VALUES(8, 'Harry Potter', '729 Johnson Dr', 'New York', 'NY', 10847, NULL, 'Harry', 'Potter','718-320-4897', 'harryp@yahoo.com');
INSERT INTO client VALUES(9, 'Barbara Jordan', '3945 Forbes Ave', 'Pittsburgh', 'PA', 15213, NULL, 'Barbara', 'Jordan','412-582-9241', 'bjordan@yahoo.com');
INSERT INTO client VALUES(10, 'Chris Brown', '309 Spahr St', 'Pittsburgh', 'PA', 15232, NULL, 'Chris', 'Brown','412-397-5523', 'chris.brown@gmail.com');
INSERT INTO client VALUES(11, 'Giant Eagle', '485 Main St', 'Pittsburgh', 'PA', 15210, 'gianteagle.com', 'John', 'Williams','412-295-2957', 'jwilliams@gianteagle.com');
INSERT INTO client VALUES(12, 'Jeff Bezos', '4387 Craig St', 'Pittsburgh', 'PA', 15213, NULL, 'Jeff', 'Bezos','412-582-1057', 'jeff_bezos@gmail.com');

---Outlet Table---
INSERT INTO outlet VALUES(1, '495 Wilkins Ave', 'Los Angeles', 'CA', 90210, '213-495-9001', NULL);
INSERT INTO outlet VALUES(2, '8827 Forbes Ave', 'Pittsburgh', 'PA', 15213, '412-482-4900', NULL);
INSERT INTO outlet VALUES(3, '385 18th St', 'New York', 'NY', 10837, '718-385-0183', NULL);

---Employee Table---
INSERT INTO employee VALUES(1, 'William', 'Defoe', 'Area Manager', '213-232-8493', 'william.defoe@carrental.com', '25-AUG-1971', 'M', 120000, '12-AUG-1995', 1, NULL);
INSERT INTO employee VALUES(2, 'Charles', 'Babbage', 'Area Manager', '412-585-9383', 'charles.babbage@carrental.com', '28-AUG-1971', 'M', 110000, '10-SEP-1996', 2, NULL);
INSERT INTO employee VALUES(3, 'Annie', 'Besant', 'Area Manager', '718-094-4849', 'annie.besant@carrental.com', '13-JAN-1973', 'F', 115990.23, '02-OCT-1997', 3, NULL);
INSERT INTO employee VALUES(4, 'Thomas', 'Edison', 'Mechanic', '213-685-3928', 'thomas.edison@carrental.com', '16-OCT-1980', 'M', 71002, '22-JAN-2002', 1, 1);
INSERT INTO employee VALUES(5, 'Ourania', 'Siabanise', 'Sales Rep', '213-484-8629', 'ourania.siabanise@carrental.com', '08-MAY-1982', 'F', 82322, '04-MAY-2003', 1, 1);
INSERT INTO employee VALUES(6, 'Prabhas', 'Raju', 'Administrative Asst', '213-967-4282', 'prabhas.raju@carrental.com', '05-MAY-1979', 'M', 78122, '15-FEB-2001', 1, 1);
INSERT INTO employee VALUES(7, 'Ross', 'Taylor', 'Mechanic', '412-965-9209', 'ross.taylor@carrental.com', '21-APR-1981', 'M', 70912, '09-NOV-2004', 2, 2);
INSERT INTO employee VALUES(8, 'Monica', 'Geller', 'Sales Rep', '412-484-6678', 'monica.geller@carrental.com', '10-JAN-1979', 'F', 84232, '11-JUL-2002', 2, 2);
INSERT INTO employee VALUES(9, 'Joey', 'Tribbiani', 'Administrative Asst', '412-955-6330', 'joey.tribbiani@carrental.com', '13-NOV-1980', 'M', 77092, '07-JUN-2002', 2, 2);
INSERT INTO employee VALUES(10, 'Chandler', 'Bing', 'Mechanic', '718-955-9032', 'chandler.bing@carrental.com', '12-JUN-1979', 'M', 69823, '01-MAR-2003', 3, 3);
INSERT INTO employee VALUES(11, 'Robert', 'Downey', 'Sales Rep', '718-048-3844', 'robert.downey@carrental.com', '11-JUL-1978', 'M', 83202, '05-MAY-2001', 3, 3);
INSERT INTO employee VALUES(12, 'Jie', 'Fang', 'Administrative Asst', '718-233-0422', 'jie.fang@carrental.com', '13-MAY-1981', 'F', 80123.56, '29-DEC-2004', 3, 3);
INSERT INTO employee VALUES(13, 'Michelle', 'Monaghan', 'Mechanic', '213-111-0942', 'michelle.monaghan@carrental.com', '16-JUL-1984', 'F', 58021.53, '26-JAN-2008', 1, 4);
INSERT INTO employee VALUES(14, 'Stone', 'Austin', 'Mechanic', '213-559-4842', 'stone.austin@carrental.com', '30-SEP-1986', 'M', 59121.52, '04-JUN-2010', 1, 4);
INSERT INTO employee VALUES(15, 'Dwayne', 'Johnson', 'Sales Rep', '213-958-2658', 'dwayne.johnson@carrental.com', '14-JUN-1987', 'M', 64192.25, '07-OCT-2010', 1, 5);
INSERT INTO employee VALUES(16, 'Mithali', 'Agarwal', 'Sales Rep', '213-679-0001', 'mithali.agarwal@carrental.com', '22-JUN-1987', 'F', 62109.92, '08-APR-2012', 1, 5);
INSERT INTO employee VALUES(17, 'Shaun', 'Marsh', 'Administrative Asst', '213-855-9267', 'shaun.marsh@carrental.com', '16-SEP-1986', 'M', 60121.12, '31-MAR-2010', 1, 6);
INSERT INTO employee VALUES(18, 'Maria', 'Sharapova', 'Administrative Asst', '213-842-9311', 'maria.sharapova@carrental.com', '29-OCT-1987', 'F', 60001.12, '09-DEC-2012', 1, 6);
INSERT INTO employee VALUES(19, 'Rod', 'Laver', 'Mechanic', '412-833-8521', 'rod.laver@carrental.com', '31-MAR-1988', 'M', 57129.21, '10-JUN-2014', 2, 7);
INSERT INTO employee VALUES(20, 'Martina', 'Navratilova', 'Mechanic', '412-599-0999', 'martina.navratilova@carrental.com', '14-JUN-1989', 'F', 56092.43, '23-APR-2015', 2, 7);
INSERT INTO employee VALUES(21, 'Andre', 'Agassi', 'Sales Rep', '412-002-8002', 'andre.agassi@carrental.com', '16-NOV-1988', 'M', 64019.21, '21-FEB-2015', 2, 8);
INSERT INTO employee VALUES(22, 'Pete', 'Sampras', 'Sales Rep', '412-933-4664', 'pete.sampras@carrental.com', '28-OCT-1991', 'M', 63012.91, '27-APR-2012', 2, 8);
INSERT INTO employee VALUES(23, 'Mithilda', 'May', 'Administrative Asst', '412-092-1653', 'mithilda.may@carrental.com', '30-NOV-1992', 'F', 61222.21, '17-JUL-2014', 2, 9);
INSERT INTO employee VALUES(24, 'Julianna', 'Moore', 'Administrative Asst', '412-954-2281', 'julianna.moore@carrental.com', '13-APR-1992', 'F', 60129.12, '13-MAY-2015', 2, 9);
INSERT INTO employee VALUES(25, 'Roger', 'Federer', 'Mechanic', '718-192-5953', 'roger.federer@carrental.com', '06-SEP-1994', 'M', 55019, '27-JUL-2017', 3, 10);
INSERT INTO employee VALUES(26, 'Nancy', 'Drew', 'Mechanic', '718-694-1122', 'nancy.drew@carrental.com', '14-MAR-1995', 'F', 54102.22, '19-SEP-2017', 3, 10);
INSERT INTO employee VALUES(27, 'Hannah', 'Beggs', 'Sales Rep', '718-122-4932', 'hannah.beggs@carrental.com', '12-JUL-1995', 'F', 66029.12, '15-JUN-2018', 3, 11);
INSERT INTO employee VALUES(28, 'Elizabeth', 'Lawrence', 'Sales Rep', '718-483-5493', 'elizabeth.lawrence@carrental.com', '19-FEB-1994', 'F', 67109.21, '04-MAR-2017', 3, 11);
INSERT INTO employee VALUES(29, 'Rafael', 'Nadal', 'Administrative Asst', '718-211-0922', 'rafael.nadal@carrental.com', '20-FEB-1996', 'M', 61000, '23-JUN-2018', 3, 12);
INSERT INTO employee VALUES(30, 'Sofia', 'Burgers', 'Administrative Asst', '718-822-9112', 'sofia.burgers@carrental.com', '01-JAN-1996', 'F', 60654, '01-FEB-2018', 3, 12);

---Add Outlet Manager Numbers---
UPDATE outlet SET managerno = 1 WHERE outno = 1;
UPDATE outlet SET managerno = 2 WHERE outno = 2;
UPDATE outlet SET managerno = 3 WHERE outno = 3;

---Vehicle Table---
INSERT INTO vehicle VALUES(10001, 'Honda', 'Accord', 'White', 2013, 4, 5, 33.86, '13-MAR-2016', 1);
INSERT INTO vehicle VALUES(10002, 'Toyota', 'Camry', 'Black', 2015, 4, 5, 67.29, '01-JAN-2017', 1);
INSERT INTO vehicle VALUES(10003, 'Honda', 'Civic', 'Silver', 2016, 2, 5, 45.83, '25-DEC-2016', 1);
INSERT INTO vehicle VALUES(10004, 'Nissan', 'Altima', 'White', 2014, 4, 5, 74.23, '01-FEB-2017', 2);
INSERT INTO vehicle VALUES(10005, 'Ford', 'Taurus', 'Black', 2015, 4, 5, 38.95, '11-NOV-2016', 2);
INSERT INTO vehicle VALUES(10006, 'BMW', '528i', 'Blue', 2016, 2, 5, 80, '03-MAR-2017', 2);
INSERT INTO vehicle VALUES(10007, 'Toyota', 'Corolla', 'Silver', 2017, 4, 5, 63.43, '20-APR-2017', 3);
INSERT INTO vehicle VALUES(10008, 'Honda', 'Odyssey', 'White', 2015, 4, 8, 120.32, '18-OCT-2016', 3);
INSERT INTO vehicle VALUES(10009, 'Hyundai', 'Sonata', 'Silver', 2016, 4, 5, 29.96, '09-DEC-2016', 3);
INSERT INTO vehicle VALUES(10010, 'Lexus', 'LS 430', 'Black', 2014, 4, 5, 96.3, '14-JAN-2017', 3);

---Rental Agreement Table---
INSERT INTO ragreement VALUES(1, TO_DATE('15-FEB-2016 12:30PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('17-FEB-2016 09:38AM', 'DD-MON-YYYY HH:MIAM'), 25293, 25494, 'Liability', 1, 10004);
INSERT INTO ragreement VALUES(2, TO_DATE('08-MAR-2016 9:35AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('15-MAR-2016 2:56PM', 'DD-MON-YYYY HH:MIAM'), 12722, 13765, 'Liability', 2, 10002);
INSERT INTO ragreement VALUES(3, TO_DATE('1-JAN-2017 2:15PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('14-JAN-2017 08:30AM', 'DD-MON-YYYY HH:MIAM'), 15300, 15402, 'Liability', 3, 10010);
INSERT INTO ragreement VALUES(4, TO_DATE('03-JAN-2017 8:22AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('23-JAN-2017 4:59PM', 'DD-MON-YYYY HH:MIAM'), 31279, 31523, 'Collision', 7, 10009);
INSERT INTO ragreement VALUES(5, TO_DATE('02-FEB-2017 9:30AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('03-FEB-2017 4:30PM', 'DD-MON-YYYY HH:MIAM'), 24835, 25385, 'Liability', 6, 10006);
INSERT INTO ragreement VALUES(6, TO_DATE('23-FEB-2017 3:34PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('25-FEB-2017 2:15PM', 'DD-MON-YYYY HH:MIAM'), 17830, 18003, 'Collision', 4, 10002);
INSERT INTO ragreement VALUES(7, TO_DATE('23-MAR-2017 10:14AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('26-MAR-2017 2:33PM', 'DD-MON-YYYY HH:MIAM'), 34863, 35832, 'Liability', 8, 10003);
INSERT INTO ragreement VALUES(8, TO_DATE('16-APR-2017 3:45PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('18-APR-2017 3:12PM', 'DD-MON-YYYY HH:MIAM'), 36713, 38021, 'Liability', 4, 10003);
INSERT INTO ragreement VALUES(9, TO_DATE('25-MAY-2017 12:03PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('27-MAY-2017 8:20AM', 'DD-MON-YYYY HH:MIAM'), 12442, 12568, 'LIability', 12, 10007);
INSERT INTO ragreement VALUES(10, TO_DATE('05-MAY-2017 10:10AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('06-MAY-2017 11:12AM', 'DD-MON-YYYY HH:MIAM'), 29475, 30001, 'Collision', 10, 10010);
INSERT INTO ragreement VALUES(11, TO_DATE('12-JUN-2017 11:45AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('17-JUN-2017 2:33PM', 'DD-MON-YYYY HH:MIAM'), 34598, 45783, 'Liability', 4, 10009);
INSERT INTO ragreement VALUES(12, TO_DATE('15-JUL-2017 4:13PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('26-JUL-2017 5:02PM', 'DD-MON-YYYY HH:MIAM'), 15997, 18264, 'Collision', 5, 10005);
INSERT INTO ragreement VALUES(13, TO_DATE('01-AUG-2017 8:34AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('03-AUG-2017 8:45AM', 'DD-MON-YYYY HH:MIAM'), 34599, 34702, 'Liability', 7, 10006);
INSERT INTO ragreement VALUES(14, TO_DATE('22-SEP-2017 9:23AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('23-SEP-2017 11:45AM', 'DD-MON-YYYY HH:MIAM'), 23445, 23600, 'Liability', 11, 10007);
INSERT INTO ragreement VALUES(15, TO_DATE('1-OCT-2017 3:16PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('16-OCT-2017 1:03PM', 'DD-MON-YYYY HH:MIAM'), 43614, 43700, 'Liability', 8, 10001);
INSERT INTO ragreement VALUES(16, TO_DATE('16-NOV-2017 10:15AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('27-NOV-2017 2:04PM', 'DD-MON-YYYY HH:MIAM'), 35340, 37201, 'Liability', 9, 10006);
INSERT INTO ragreement VALUES(17, TO_DATE('25-DEC-2017 11:30AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('28-DEC-2017 09:45AM', 'DD-MON-YYYY HH:MIAM'), 38765, 39215, 'Collison', 10, 10003);
INSERT INTO ragreement VALUES(18, TO_DATE('28-DEC-2017 2:00PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('30-DEC-2017 9:35AM', 'DD-MON-YYYY HH:MIAM'), 28475, 28822, 'Liability', 6, 10007);
INSERT INTO ragreement VALUES(19, TO_DATE('09-JAN-2018 12:59PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('11-JAN-2018 1:48PM', 'DD-MON-YYYY HH:MIAM'), 35632, 35700, 'Collision', 11, 10007);
INSERT INTO ragreement VALUES(20, TO_DATE('18-FEB-2018 2:43PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('21-FEB-2018 10:03AM', 'DD-MON-YYYY HH:MIAM'), 33031, 33369, 'Liability', 12, 10008);
INSERT INTO ragreement VALUES(21, TO_DATE('25-MAR-2018 1:16PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('27-MAR-2018 11:32AM', 'DD-MON-YYYY HH:MIAM'), 48202, 48456, 'Liability', 3, 10002);
INSERT INTO ragreement VALUES(22, TO_DATE('30-JUL-2018 4:23PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('03-AUG-2018 12:40PM', 'DD-MON-YYYY HH:MIAM'), 34002, 34721, 'Liability', 5, 10005);
INSERT INTO ragreement VALUES(23, TO_DATE('02-OCT-2018 8:42AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('14-OCT-2018 4:22PM', 'DD-MON-YYYY HH:MIAM'), 35190, 35522, 'Collision', 9, 10010);
INSERT INTO ragreement VALUES(24, TO_DATE('10-OCT-2018 3:20PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('12-OCT-2018 12:02PM', 'DD-MON-YYYY HH:MIAM'), 50102, 50345, 'Collison', 1, 10002);
INSERT INTO ragreement VALUES(25, TO_DATE('30-OCT-2018 8:35AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('31-OCT-2018 10:00AM', 'DD-MON-YYYY HH:MIAM'), 39663, 39700, 'Liability', 4, 10006);
INSERT INTO ragreement VALUES(26, TO_DATE('03-NOV-2018 2:32PM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('06-NOV-2018 11:45AM', 'DD-MON-YYYY HH:MIAM'), 37152, 40625, 'Liability', 6, 10010);
INSERT INTO ragreement VALUES(27, TO_DATE('23-NOV-2018 10:03AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('23-NOV-2018 4:59PM', 'DD-MON-YYYY HH:MIAM'), 46858, 47598, 'Liability', 7, 10007);
INSERT INTO ragreement VALUES(28, TO_DATE('01-DEC-2018 11:23AM', 'DD-MON-YYYY HH:MIAM'), TO_DATE('02-DEC-2018 11:30AM', 'DD-MON-YYYY HH:MIAM'), 45005, 45102, 'Liability', 3, 10005);

---Fault Report Table---
INSERT INTO faultreport VALUES(1, TO_DATE('05-SEP-2016 08:20AM', 'DD-MON-YYYY HH:MIAM'), 'Broken taillight', 4, 10004, 1);
INSERT INTO faultreport VALUES(2, TO_DATE('19-SEP-2016 09:30AM', 'DD-MON-YYYY HH:MIAM'), 'A/C repair', 7, 10002, 2);
INSERT INTO faultreport VALUES(3, TO_DATE('06-APR-2017 10:15AM', 'DD-MON-YYYY HH:MIAM'), 'Flat tire', 10, 10003, 7);
INSERT INTO faultreport VALUES(4, TO_DATE('03-JUN-2017 8:45AM', 'DD-MON-YYYY HH:MIAM'), 'Check engine light', 13, 10007, 9);
INSERT INTO faultreport VALUES(5, TO_DATE('14-JUL-2017 10:40AM', 'DD-MON-YYYY HH:MIAM'), 'Break pad replacement', 14, 10009, 11);
INSERT INTO faultreport VALUES(6, TO_DATE('16-JAN-2018 10:25AM', 'DD-MON-YYYY HH:MIAM'), 'Steering realignment', 19, 10005, 12);
INSERT INTO faultreport VALUES(7, TO_DATE('20-SEP-2018 9:20AM', 'DD-MON-YYYY HH:MIAM'), 'Windshield wiper replacement', 20, 10003, 17);
INSERT INTO faultreport VALUES(8, TO_DATE('12-OCT-2018 8:05AM', 'DD-MON-YYYY HH:MIAM'), 'Key fob battery replacement', 25, 10008, 20);
INSERT INTO faultreport VALUES(9, TO_DATE('27-OCT-2018 9:00AM', 'DD-MON-YYYY HH:MIAM'), 'Refill wiper fluid', 26, 10002, 21);
INSERT INTO faultreport VALUES(10, TO_DATE('03-DEC-2018 11:02AM', 'DD-MON-YYYY HH:MIAM'), 'Engine oil change', 14, 10005, 28);

