USE cs332t2;

--professor table
CREATE TABLE IF NOT EXISTS professor(ssn INT NOT NULL,name VARCHAR(50) NOT NULL,street_address VARCHAR(50) NOT NULL,city VARCHAR(50) NOT NULL,state VARCHAR(20) NOT NULL,zip INT NOT NULL,area_code INT NOT NULL,seven_number INT NOT NULL,sex CHAR(1) NOT NULL,title VARCHAR(50) NOT NULL,salary INT NOT NULL,degrees VARCHAR(50) NOT NULL,PRIMARY KEY(ssn));

--department table
CREATE TABLE IF NOT EXISTS department(dnum INT NOT NULL,name VARCHAR(50) NOT NULL,phone_number VARCHAR(15) NOT NULL,location VARCHAR(50) NOT NULL,chairSSN INT NOT NULL,PRIMARY KEY(dnum)); 

--course table
CREATE TABLE IF NOT EXISTS course(cnum INT NOT NULL,title VARCHAR(50) NOT NULL,textbooks VARCHAR(100) NOT NULL,units INT NOT NULL,cdnum INT NOT NULL,PRIMARY KEY(cnum));

--section table
CREATE TABLE IF NOT EXISTS section(snum INT NOT NULL,classroom VARCHAR(20) NOT NULL,seats INT NOT NULL,meeting_days VARCHAR(7) NOT NULL,begin_time VARCHAR(7) NOT NULL,end_time VARCHAR(7) NOT NULL,scnum INT NOT NULL,pssn INT NOT NULL,PRIMARY KEY(snum,scnum));

--student table
CREATE TABLE IF NOT EXISTS student(cwid INT NOT NULL,fname VARCHAR(50) NOT NULL,lname VARCHAR(50) NOT NULL,address VARCHAR(100) NOT NULL,phone_number VARCHAR(15) NOT NULL,major_dnum INT NOT NULL,PRIMARY KEY(cwid));

--enrollment table
CREATE TABLE IF NOT EXISTS enrollment(scwid INT NOT NULL,sno INT NOT NULL,cno INT NOT NULL,grade VARCHAR(3) NOT NULL,PRIMARY KEY(scwid,sno,cno));

--professor data (ssn, name, street_address, city, state, zip, area_code, seven_number, sex, title, salary, degrees)
INSERT IGNORE INTO professor VALUE(926334712, "Anibelle Heathcote", "51974 Sebastian Isle Suite 424", "Iciechester", "CA", 92831, 714, 9987804, 'f', "Prof.", 94299, "Bachelor of Science");
INSERT IGNORE INTO professor VALUE(181542697, "Giovanny Stehr", "279 Alexandra Unions Apt. 654", "New Sydney", "CA", 92627, 949, 8946516, 'm', "Prof.", 40757, "Bachelor of Engineering");
INSERT IGNORE INTO professor VALUE(854654145, "Rowland McKenzie", "456 Jayce Bypass", "Holdenport", "CA", 91761, 909, 3292188, 'm', "Dr.", 74323, "Bachelor of Science");

--department data (dnum, name, phone_number, location, chairSSN)
INSERT IGNORE INTO department VALUE(42849, "Computer Science", "(657) 278-3700", "CS-522", 926334712);
INSERT IGNORE INTO department VALUE(32764, "Mechanical Engineering", "(657) 747-7600", "E-100", 181542697);

--course data (cnum, title, textbooks, units, cdnum)
INSERT IGNORE INTO course VALUE(332, "CPSC 332 (File Structures and Database Systems)", "Database Design - 2nd Edition", 4, 42849);
INSERT IGNORE INTO course VALUE(335, "CPSC 335 (Problem Solving Strategies)", "Essential Algorithms: A Practical Approach to Computer Algorithms", 3, 42849); INSERT IGNORE INTO course VALUE(131, "CPSC 131 (Data Structures Concepts)", "Data Structures In C++", 3, 42849);
INSERT IGNORE INTO course VALUE(421, "EGME 421 (Mechanical Design)", "Shigley's Mechanical Engineering Design", 3, 32764);

--section data (snum, classroom, seats, meeting_days, begin_time, end_time, scnum, pssn)
INSERT IGNORE INTO section VALUE(1346, "ECS 194", 30, "TTh", "3:00", "4:50", 335, 926334712);
INSERT IGNORE INTO section VALUE(1357, "ECS 204", 32, "Sa", "10:00", "2:00", 421, 181542697);
INSERT IGNORE INTO section VALUE(2959, "ECS 213", 28, "MW", "8:00", "9:15", 131, 854654145);
INSERT IGNORE INTO section VALUE(2962, "ECS 301", 35, "MW", "11:30", "12:45", 332, 854654145);
INSERT IGNORE INTO section VALUE(9580, "ECS 194", 30, "MW", "3:00", "4:50", 335, 926334712);
INSERT IGNORE INTO section VALUE(9637, "ECS 204", 32, "F", "11:00", "4:00", 421, 181542697);

--student data (cwid, fname, lname, address, phone_number, major_dnum)
INSERT IGNORE INTO student VALUE(139554756, "Hattie", "Collier", "6557 Alexanne Trail Suite 831\nPort Javier, CA 92614", "(949)-180-8949", 42849);
INSERT IGNORE INTO student VALUE(140805964,"Polly","Padberg","484 Giovanny Plains Apt. 624\nNorth Kathryne, CA 91744","(626)-236-4491",32764);
INSERT IGNORE INTO student VALUE(143195821,"Zelma","Lehner","29456 Kshlerin Park Suite 883\nNew Maiya, CA 92805","(714)-396-2240",42849);
INSERT IGNORE INTO student VALUE(216000237,"Cletus","Klein","41071 Vivienne Locks\nLake Camren, CA 92154","(619)-844-5189",32764);
INSERT IGNORE INTO student VALUE(218190438,"Kurt","Lynch","741 Anabel Pike Apt. 117\nBayerburgh, CA 90019","(323)-969-8848",42849);
INSERT IGNORE INTO student VALUE(407299558,"Cara","Nienow","4795 Bauch Pines\nMarilynebury, CA 91710","(909)-200-6497",32764);
INSERT IGNORE INTO student VALUE(833375458,"Rosemary","Hettinger","884 Domenick Underpass Suite 435\nNasirberg, CA 92882","(951)-220-8343",42849); INSERT IGNORE INTO student VALUE(834432130,"Kellen","Davis","602 Filiberto Points Apt. 839\nRogahnbury, CA 92683","(714)-659-0808",42849);

--enrollment data (scwid, sno, cno, grade)
INSERT IGNORE INTO enrollment VALUE(139554756, 1346, 335, "C-"); 
INSERT IGNORE INTO enrollment VALUE(139554756,2962, 332, "A"); 
INSERT IGNORE INTO enrollment VALUE(139554756,2959, 131, "C+"); 
INSERT IGNORE INTO enrollment VALUE(140805964,2959, 131, "C"); 
INSERT IGNORE INTO enrollment VALUE(140805964,9580, 335, "D-"); 
INSERT IGNORE INTO enrollment VALUE(143195821,1357, 421, "B-"); 
INSERT IGNORE INTO enrollment VALUE(216000237,9580, 335, "B-"); 
INSERT IGNORE INTO enrollment VALUE(216000237,2962, 332, "D"); 
INSERT IGNORE INTO enrollment VALUE(216000237,2959, 131, "A"); 
INSERT IGNORE INTO enrollment VALUE(218190438,2959, 131, "C+"); 
INSERT IGNORE INTO enrollment VALUE(218190438,9580, 335, "F"); 
INSERT IGNORE INTO enrollment VALUE(218190438,2962, 332, "B"); 
INSERT IGNORE INTO enrollment VALUE(407299558,1346, 335, "D-"); 
INSERT IGNORE INTO enrollment VALUE(407299558,2962, 332, "D+"); 
INSERT IGNORE INTO enrollment VALUE(407299558,2959, 131, "B-"); 
INSERT IGNORE INTO enrollment VALUE(833375458,2959, 131, "B"); 
INSERT IGNORE INTO enrollment VALUE(833375458,2962, 332, "A"); 
INSERT IGNORE INTO enrollment VALUE(833375458,1346, 335, "D"); 
INSERT IGNORE INTO enrollment VALUE(834432130,2959, 131, "B"); 
INSERT IGNORE INTO enrollment VALUE(834432130,9637, 421, "A");