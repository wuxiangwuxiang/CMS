CREATE DATABASE IF NOT EXISTS classmanagesys
USE classmanagesys;

CREATE TABLE test(
StudentId INT NOT NULL PRIMARY KEY auto_increment,
StudentPassword VARCHAR(20) NOT NULL,
StudentName VARCHAR(20)
)
INSERT INTO test VALUES(100001,'hh123','anna');
INSERT INTO test VALUES(100002,'das','juin');
INSERT INTO test VALUES(100003,'3qeq','pan');
INSERT INTO test VALUES(100004,'qewqe','adwina');
INSERT INTO test VALUES(100005,'231eeq','pps');


CREATE TABLE Teacher(
TeacherMobile VARCHAR(20) PRIMARY KEY NOT NULL,
TeacherEmail VARCHAR(20) NOT NULL,
TeacherPassword VARCHAR(20) NOT NULL,
TeacherName VARCHAR(16) NOT NULL,
TeacherGender VARCHAR(20),
TeacherSubject VARCHAR(20)
)CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO Teacher(TeacherMobile,TeacherEmail,TeacherPassword,TeacherName,TeacherGender,TeacherSubject)
 VALUES('15653279326','1185547466@qq.com','123','Juin','男','语文');

CREATE TABLE Course(
CourseId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CourseName VARCHAR(10) NOT NULL,
CourseType VARCHAR(5),
ClassCapacity INT,
StartTime Date,
EndTime Date,
CurrentYear INT,
SchoolTem VARCHAR(5),
QrImg VARCHAR(30),
TeacherMobile VARCHAR(11),
FOREIGN KEY(TeacherMobile) REFERENCES Teacher(TeacherMobile)
);

CREATE TABLE Clazz(
ClazzId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ClazzName VARCHAR(20),
CurrentYear INT,
-- TeacherMobile VARCHAR(20),
CourseId INT,
-- FOREIGN KEY(TeacherMobile) REFERENCES Teacher(TeacherMobile),
FOREIGN KEY(CourseId) REFERENCES Course(CourseId)
);
INSERT INTO Clazz(ClazzName,CurrentYear,CourseId) 
VALUES('java14',2014,19);
INSERT INTO Clazz(ClazzName,CurrentYear,CourseId) 
VALUES('java12',2014,19);

CREATE TABLE Student(
StudentRoNo VARCHAR(20) PRIMARY KEY NOT NULL,
StudentPassword VARCHAR(20) NOT NULL,
StudentMobile VARCHAR(11) NOT NULL,
StudentEmail VARCHAR(20) NOT NULL,
StudentName VARCHAR(6) NOT NULL,
StudentGender VARCHAR(2),
StudentPhoto VARCHAR(30),
ClazzId INT,
FOREIGN KEY(ClazzId) REFERENCES Clazz(ClazzId) 
)delimiter    
create trigger tri_delete before delete on Clazz  
for each row  
begin  
     delete from Student where id = old.id;  
end   
INSERT INTO Student(StudentRoNo,StudentPassword,StudentMobile,StudentEmail,StudentName,ClazzId) VALUES('201440703457','123','111','123','kk',22)
-- 学生&&学科考勤信息
CREATE TABLE StudentInfo(
StudentInfoId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
StudentRoNo VARCHAR(20) NOT NULL,
CourseId INT NOT NULL, 
ComeLate INT DEFAULT 0,
LeaveEarlier INT DEFAULT 0, 
Absenteeism INT DEFAULT 0,
FOREIGN KEY(StudentRoNo) REFERENCES Student(StudentRoNo),
FOREIGN KEY(CourseId) REFERENCES Course(CourseId)
);
INSERT INTO StudentInfo(StudentRoNo,CourseId,ComeLate,LeaveEarlier,Absenteeism) VALUES('201440703454',19,1,2,3)