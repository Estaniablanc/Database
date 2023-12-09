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

    //-------------------------------------------self Project--------------------------------------------
    CREATE TABLE TEAMS (
    team_Id int NOT NULL,
    teamName char (30),
    playerFName varchar(20) NOT NULL,
    playerLName varchar(20),
    playerNum int,
    headCoach char,
    PRIMARY KEY (team_Id)
);
CREATE TABLE PLAYER (
    player_Id int NOT NULL,
    fName char (30) NOt null,
    lName varchar(20) NOT NULL,
    position varchar(20),
    placeOfBirth char (200),
    college varchar(20),
    weight decimal(3,2),
    Salary int,
    dateOfBirth varchar(10),
    height char(4),
    PRIMARY KEY (player_Id)
);
CREATE TABLE OWNER (
    owner_Id int(6) NOT NULL,
    Fname char (30) NOt null,
    Lname char(20) NOT NULL,
    yearsOwned char(20),
    placeOfBirth char (200),
    team varchar(20),
    paidAmount int,
    PRIMARY KEY (owner_Id)
);

 Create table GAME (
     game_id int,
     team_one char(30),
     team_two char(30),
     score_one int,
     score_two int,
     date char(30),
     primary key (game_Id)
     );
Create table STAT (
    stat_id int not null,
    points int,
    rebounds int,
    blocks int,
    steals int,
    assist int, 
    primary key (stat_id)
    );
Create table SEASON (
    season_id int,
    tradedPlayer char(30),
    Win int,
    Lost int,
    offseason_cut_player char(30)


    
\\----------------------------------------------lab1------------------------------------------
 
    CREATE table STUDENT(
     Name char (20),
    Student_number int,
    Class int,
    Major char (20),
    PRIMARY KEY (Student_number)
);
Create table COURSE (
    Course_name char(100),
    Course_number char(100),
    Credit_hours int,
    Department char(100),
    PRIMARY KEY (Course_number)
    );
Create table SECTION (
    Section_identifier int,
    Course_number char(100),
    Semester char(20),
    Year int,
    Instructor char(20),
    PRIMARY KEY (Section_identifier)
    );
    
CREATE table GRADE_REPORT(
    Student_number int,
    Section_identifier int,
    Grade Varchar(1),
    PRIMARY KEY (Student_number,Section_identifier),
    FOREIGN key (Student_number) REFERENCES STUDENT( Student_number),
    FOREIGN key (Section_identifier) REFERENCES SECTIONS( Section_identifier)
    
    );
CREATE table PREREQUISITE(
    Course_number char(20(,
    Prerequisite_number char(20),
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN key (Course_number) REFERENCES COURSE( Course_number),
    FOREIGN key (Prerequisite_number) REFERENCES COURSE( Course_number)
    
    );
INSERT INTO Course values (’Algebra’, ‘MATH2410’, 3, ‘MATH’)
INSERT into SECTIONS values (01, ‘CS3320’, ‘Spring’, 09, ‘Knuth’)
INSERT into GRADE_REPORT values(8, 200, 90.5)
UPDATE STUDENT SET Major = 'MATH' WHERE Student_number =8;
UPDATE PREREQUSITE SET Prerequisite_number = ‘CS1110’ WHERE Course_number = ‘CS3320’
DELETE FROM STUDENT WHERE Student_number = 8

\\----------------------------------------------lab2------------------------------------------------
ALTER table COURSE MODIFY COLUMN Course_name char(20)
    
    CREATE table STUDENT(
     Name char (20),
    Student_number int,
    Class int,
    Major char (20),
    PRIMARY KEY (Student_number)
);
Create table COURSE (
    Course_name char(100),
    Course_number char(100),
    Credit_hours int,
    Department char(100),
    PRIMARY KEY (Course_number)
    );
Create table SECTION (
    Section_identifier int,
    Course_number char(100),
    Semester char(20),
    Year int,
    Instructor char(20),
    PRIMARY KEY (Section_identifier)
    );
    
CREATE table GRADE_REPORT(
    Student_number int,
    Section_identifier int,
    Grade Varchar(1),
    PRIMARY KEY (Student_number,Section_identifier),
    FOREIGN key (Student_number) REFERENCES STUDENT( Student_number),
    FOREIGN key (Section_identifier) REFERENCES SECTIONS( Section_identifier)
    
    );
CREATE table PREREQUISITE(
    Course_number char(20(,
    Prerequisite_number char(20),
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN key (Course_number) REFERENCES COURSE( Course_number),
    FOREIGN key (Prerequisite_number) REFERENCES COURSE( Course_number)
    
    );
INSERT into STUDENT values('Smith',17,1,'CS'),('Brown',8,2,'CS')
INSERT into COURSE values ('Intro to Computer Science','CS1310',4,'CS'),
('Data Structures','CS3320',4,'CS'),('Discrete Mathematics','MATH2410',3,'MATH'),('Database','CS3380',3,'CS')
INSERT into SECTIONS values (85,'MATH2410','Fall',07,'King'),(92,'CS1310','Fall',07,'Anderson'),(102,'CS3320','Spring',08,'Knuth'),
(112,'MATH2410','Fall',08,'Chang'),(119,'CS1310','Fall',08,'Anderson'),(135,'CS3380','Fall',08,'Stone')
INSERT into GRADE_REPORT values (17,112,'B'),(17,119,'C'),(8,85,'A'),(8,92,'A'),(8,102,'B'),(8,135,'A')
INSERT into Prerequisite values ('CS3380','CS3320'),('CS3380','MATH2410'),('CS3320','CS1310')

    1)
    SELECT s.Name AS Students_name,  
 c.COURSE_number,
 c.Course_name,
 se.Semester,
 se.Year, 
 g.Grade
  
FROM STUDENT AS s
JOIN GRADE_REPORT g ON s.Student_number = g.Student_number
JOIN SECTIONS se ON g.Section_identifier = se.Section_identifier
JOIN COURSE c ON se.Course_number = c.Course_number

 2)   
SELECT 
   c.Course_name as Course_and_prerequisite,
   p.Course_name as Prerequisites
   from 
   PREREQUISITE pr 
   join COURSE c on pr.Course_number= c.Course_number
   JOIN COURSE p on pr.Prerequisite_number =p.Course_number

    3)SELECT c.Course_name
from COURSE c 
left join PREREQUISITE pr on c.Course_number= pr.Course_number
LEFT JOIN COURSE o on pr.Prerequisite_number = o.Course_number
    

4)SELECT count(*) as Section_offered
from SECTIONS
where Year='08'

7)SELECT s.name, COUNT(*) as Student_B_count
from STUDENT s 
join GRADE_REPORT g on s.Student_number =g.Student_number
where g.Grade ='B'
GROUP by s.Student_number


    --------------------------------------------------------------------------------------------------------
    1)
SELECT Name, Course_number,Course_name,Semester, Year, Grade
    from STUDENT 
    join COURSE on STUDENT.Student_number = COURSE.Course_number
    join SECTIONS on SECTIONS.Section_identifier = COURSE.Section_identifier
    join GRADE_REPORT on GRADE_REPORT.Student_number

    SELECT *
from COURSE c
JOIN GRADE_REPORT g on c.Course_number= g.Course_number
join SECTIONS e on e.Section_identifier = g.Course_number
join STUDENT s on s.Student_number = e.Section_identifier
GROUP by Name, Course_number,Course_name,Semester, Grade
    
   //---------------------------------------------------------------------------------------------------------------------- 
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
where 
    (select count(*) 
    from WORKS_ON w1 
    where w.Essn=w1.Essn) = (select count(*) 
    from PROJECT);

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
    (select Pno 
    from WORKS_ON 
    where Essn= Ssn 
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

create function table_name(colum_info) return Return_messge_type
    begin declare Colume_declaring_name
    from table_name
    where 
    if Colume_declaring_name then return "whatever"
    end if;
    end//
 DELIMITER
    
    
Delimiter //
create function DEPT_SIZE (Dept_no INt) return vachar(10) 
    begin declare no_of_employees int
    select count(*) into nums
    from EMPLOYEE
    where Dno=Dept_no
    IF no_of_employees<2 then return "smal"
    elseif no_of_employees<4 then return "meduim"
    elseif no_of_employees< then return "large"
    else return "huge"
    end if
    end //
    DELIMITER ;
    select Dept_size(1)
    select Dept_size(1);
