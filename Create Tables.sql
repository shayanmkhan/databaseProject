--Drop all existing foreign key constraints
ALTER TABLE outlet DROP CONSTRAINT outlet_managerno_fk;
ALTER TABLE employee DROP CONSTRAINT employee_outno_fk;
ALTER TABLE employee DROP CONSTRAINT employee_supervisorno_fk;
ALTER TABLE vehicle DROP CONSTRAINT vehicle_outno_fk;
ALTER TABLE ragreement DROP CONSTRAINT ragreement_clientno_fk;
ALTER TABLE ragreement DROP CONSTRAINT ragreement_licenseno_fk;
ALTER TABLE faultreport DROP CONSTRAINT faultreport_empno_fk;
ALTER TABLE faultreport DROP CONSTRAINT faultreport_licenseno_fk;
ALTER TABLE faultreport DROP CONSTRAINT faultreport_rentalno_fk;

--Drop all existing tables
DROP TABLE client;
DROP TABLE outlet;
DROP TABLE employee;
DROP TABLE vehicle;
DROP TABLE ragreement;
DROP TABLE faultreport;

CREATE TABLE client (
                clientno NUMBER(5) CONSTRAINT client_clientno_pk
                                   PRIMARY KEY,
                clientname VARCHAR2(30),
                street VARCHAR2(30) CONSTRAINT client_street_nn
                                    NOT NULL,
                city VARCHAR2(20) CONSTRAINT client_city_nn
                                  NOT NULL,
                state VARCHAR2(2) CONSTRAINT client_state_nn
                                  NOT NULL,
                zipcode NUMBER(5) CONSTRAINT client_zipcode_nn
                                  NOT NULL,
                webaddress VARCHAR2(30),
                contact_fname VARCHAR2(20) CONSTRAINT client_contactfname_nn
                                           NOT NULL,
                contact_lname VARCHAR2(20) CONSTRAINT client_contactlname_nn
                                           NOT NULL,
                phone VARCHAR2(12) CONSTRAINT client_phone_nn
                                   NOT NULL,
                email VARCHAR2(30) CONSTRAINT client_email_nn
                                   NOT NULL
                );


CREATE TABLE outlet (
                outno NUMBER(2) CONSTRAINT outlet_outno_pk
                                   PRIMARY KEY,
                street VARCHAR2(30) CONSTRAINT outlet_street_nn
                                    NOT NULL,
                city VARCHAR2(20) CONSTRAINT outlet_city_nn
                                  NOT NULL,
                state VARCHAR2(2) CONSTRAINT outlet_state_nn
                                  NOT NULL,
                zipcode NUMBER(5) CONSTRAINT outlet_zipcode_nn
                                  NOT NULL,
                phone VARCHAR2(12) CONSTRAINT outlet_phone_nn
                                   NOT NULL,
                managerno NUMBER(5)
                );

CREATE TABLE employee (
                empno NUMBER(5) CONSTRAINT employee_empno_pk
                                PRIMARY KEY,
                fname VARCHAR2(20) CONSTRAINT employee_fname_nn
                                   NOT NULL,
                lname VARCHAR2(20) CONSTRAINT employee_lname_nn
                                   NOT NULL,
                position VARCHAR2(20) CONSTRAINT employee_position_nn
                                      NOT NULL,
                phone VARCHAR2(12) CONSTRAINT employee_phone_nn
                                   NOT NULL,
                email VARCHAR2(40) CONSTRAINT employee_email_nn
                                   NOT NULL,
                dob DATE CONSTRAINT employee_dob_nn
                                    NOT NULL,
                gender VARCHAR2(1) CONSTRAINT employee_gender_nn
                                   NOT NULL,
                salary NUMBER(8,2) CONSTRAINT employee_salary_nn
                                   NOT NULL 
                                   CONSTRAINT employee_salary_ck
                                   CHECK(salary > 0),
                hiredate DATE DEFAULT SYSDATE,
                outno NUMBER(2) CONSTRAINT employee_outno_nn 
                                NOT NULL
                                CONSTRAINT employee_outno_fk
                                REFERENCES outlet(outno),
                supervisorno NUMBER(5) CONSTRAINT employee_supervisorno_fk
                                       REFERENCES employee(empno)
                );

CREATE TABLE vehicle (
                licenseno NUMBER(10) CONSTRAINT vehicle_licenseno_pk
                                     PRIMARY KEY,
                make VARCHAR2(20) CONSTRAINT vehicle_make_nn
                                  NOT NULL,
                model VARCHAR2(20) CONSTRAINT vehicle_model_nn
                                  NOT NULL,
                color VARCHAR2(20) CONSTRAINT vehicle_color_nn
                                  NOT NULL,
                year NUMBER(4) CONSTRAINT vehicle_year_nn
                                  NOT NULL,
                nodoors NUMBER(1) CONSTRAINT vehicle_ndoors_nn
                                  NOT NULL 
                                  CONSTRAINT vehicle_ndoors_ck
                                  CHECK(nodoors > 0),
                capacity NUMBER(2) CONSTRAINT vehicle_capacity_nn
                                   NOT NULL 
                                   CONSTRAINT vehicle_capacity_ck
                                   CHECK(capacity > 0),
                dailyrate NUMBER(6,2) CONSTRAINT vehicle_dailyrate_nn
                                   NOT NULL 
                                   CONSTRAINT vehicle_dailyrate_ck
                                   CHECK(dailyrate > 0),                
                inspectiondate DATE CONSTRAINT vehicle_inspectiondate_nn
                                     NOT NULL,
                outno NUMBER(2) CONSTRAINT vehicle_outno_nn 
                                NOT NULL
                                CONSTRAINT vehicle_outno_fk
                                REFERENCES outlet(outno)
                );


CREATE TABLE ragreement (
                rentalno NUMBER(2) CONSTRAINT ragreement_rentalno_pk
                                   PRIMARY KEY,
                startdate DATE CONSTRAINT ragreement_startdate_nn
                                   NOT NULL,
                returndate DATE,
                mileagebefore NUMBER(6) CONSTRAINT ragreement_mileagebefore_nn
                                        NOT NULL 
                                        CONSTRAINT ragreement_mileagebefore_ck
                                        CHECK(mileagebefore >= 0),
                mileageafter NUMBER(6),
                insurancetype VARCHAR2(20) CONSTRAINT ragreement_insurancetype_nn
                                           NOT NULL,
                clientno NUMBER(5) CONSTRAINT ragreement_clientno_nn
                                   NOT NULL
                                   CONSTRAINT ragreement_clientno_fk
                                   REFERENCES client(clientno),
                licenseno NUMBER(5) CONSTRAINT ragreement_licenseno_nn
                                    NOT NULL
                                    CONSTRAINT ragreement_licenseno_fk
                                    REFERENCES vehicle(licenseno),
                CONSTRAINT ragreement_returndate_ck
                CHECK(returndate IS NULL
                      OR (returndate IS NOT NULL 
                          AND returndate > startdate)),
                CONSTRAINT ragreement_mileageafter_ck
                           CHECK(mileageafter IS NULL
                                 OR (mileageafter IS NOT NULL 
                                     AND mileageafter > mileagebefore))
                );

CREATE TABLE faultreport (
                reportnum NUMBER(5) CONSTRAINT faultreport_reportnum_pk
                                    PRIMARY KEY,
                datechecked DATE CONSTRAINT faultreport_datechecked_nn
                                 NOT NULL,
                comments VARCHAR2(100),
                empno NUMBER(5) CONSTRAINT faultreport_empno_nn
                                NOT NULL
                                CONSTRAINT faultreport_empno_fk
                                REFERENCES employee(empno),
                licenseno NUMBER(5) CONSTRAINT faultreport_licenseno_nn
                                    NOT NULL
                                    CONSTRAINT faultreport_licenseno_fk
                                    REFERENCES vehicle(licenseno),
                rentalno NUMBER(5) CONSTRAINT faultreport_rentalno_nn
                                   NOT NULL
                                   CONSTRAINT faultreport_rentalno_fk
                                   REFERENCES ragreement(rentalno)
                );

ALTER TABLE outlet ADD CONSTRAINT outlet_managerno_fk
                       FOREIGN KEY(managerno)
                       REFERENCES employee(empno);