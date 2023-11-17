CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);



CREATE TABLE WORKS_ON
    (
        Essn char(9),
        Pno int,
        Hours decimal(3,1),
        PRIMARY KEY(Essn,Pno),
        CONSTRAINT WORKSONEMPFK FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn) on update CASCADE on DELETE CASCADE,
        CONSTRAINT WORKSONWORK FOREIGN key(Pno) REFERENCES PROJECT(Pnumber) on update CASCADE ON DELETE CASCADE
        
        )
    
        INSERT into EMPLOYEE values ('John','B','Smith','123456789','1965-01-09','731 Fodren, Huston, TX','M',
         30000,NULL,NULL)  
    insert into EMPLOYEE values ('John','B','Smith','123456789','1965-01-09','731 Fondren,Huston, TX','M',30000,'333445555',5)
UPDATE EMPLOYEE
set Super_ssn='987654321',Dno=4
where Ssn='999887777' or Ssn ='987987987';

insert into DEPT_LOCATION VALUES(1,'Huston'),(4,'Stafford'),
(5,'Bellaire'),(5,'Sugarland'),(5,'Huston');

insert into WORKS_ON values ('123456789',1,32.5),('123456789',2,7.5);
insert into WORKS_ON values ('666884444',3,40.0);
insert into WORKS_ON VALUES ('453453453',1,20.0),('453453453',2,20.0);
INSERT into WORKS_ON VALUES ('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0);

insert into WORKS_ON values ('999887777',30,30.0),('999887777',10,10.0);
INSERT into WORKS_ON VALUES ('987987987',10,35),('987987987',30,5);
insert into WORKS_ON VALUES ('987654321',30,20),('987654321',20,15);
INSERT into WORKS_ON values ('888665555',20,null);

Insert into DEPARTMENT VALUES
('333445555','Alice','F','1986-04-05','Daugther'),
('333445555','Theodore','M','1983-10-25','Son'),
('333445555','Joy','F','1958-05-03','Spouse'),

insert into DEPARTMENT(Dname,Dnumber) values ('Test',10)

ALTER TABLE DEPARTMENT MODIFY Mgr_ssn char(9) DEFAULT '8886655555';

DELETE from DEPARTMENT where Dnumber = 10; // to deltet 

    \\\\\\\\\
   *SQL JOIN*
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

*SQL LEFT JOIN Keyword*
The LEFT JOIN keyword returns all records from the left table (table1),
and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.
    SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;


Let's look at a selection from the "Orders" table:

# 
select count(*),avg(salary)
from EMPLOYEE join department on Dno=Dnumber
where Dname ='Research';

#get dept havin more than one employee
a) 
select Dno,Dname
from EMPLOYEE join DEPARTMENT on Dno=Dnumber
group by Dno
having count(*)>1;

b)
select Dnumber,Dnum
from Department 
where Dnumber in (select Dno from EMPLOYEE group by Dno having count(*)>1);

#for each department havin more than 1 employee, list the number of employee with salary >40000
select Dno,count(*)
from EMPLOYEE 
where Salary >40000 and Dno in (select Dno from EMPLOYEE group by Dno having (*)>1)
group by Dno;//to get the number of employee 

#find employee working on all projects

A)
select Essn
from WORK_ON
group by Essn
having count(Pno) = (selecy count(*) from PROJECT);

B)
select Essn, count(*)
from WORKS_ON w
where (select count(*) from WORKS_ON w1 where w.Essn=w1.Essn) = (select count(*) from PROJECT);

#find names of employee working on all projects controller by Dno 4

select Fname,Lname
from EMPLOYEE
where 
       (select count(*) //counting employee workinf on all projects 
        from WORKS_ON join PROJECT on Pnumber=Pno 
        where Dnum=4 and Ssn=Essn) =
                  (select count(*) // countin all projects
                   from Project    // from project
                    where Dnum=4);  // restriction

    #find employees who work on all project

select Fname,Lname  // getting name
from EMPLOYEE  // fromm employee table.
where not exists  //same ass inn checkk iff valuee iss empty orr not.
    (select Pno from WORKS_ON where Essn= Ssn 
    and Pnumber not in //nott inn iss the same ass except.
        (select Pnumber from PROJECT) );

#find employee working on all projects that Alicia worked on
select Fname, Lname
from EMPLOYEE 
where not exists
      (select Pno from WORK_ON join EMPLOYEE on Essn=Ssn where Fname='Alicia'  //gettin project number that alicia works on.
       and Pnumber not in  
           (select Pno from WORKS_ON w1 where w1.Essn =e1.ssn));

#get employeees working on the same project using same hours as Alicia

select Fname,Lname
from EMPLOYEE e join WORKS_ON on e.SSN=Essn
where (Pno,Hours) in (select Pno, HOurs from WORK_ON w1 join EMPLOYEE e1
on w1.Essn=e1.Ssn where Fname
