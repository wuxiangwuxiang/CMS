CREATE DATABASE IF NOT EXISTS classmanagesys
USE classmanagesys;

CREATE TABLE Teacher(
TeacherMobile VARCHAR(20) PRIMARY KEY NOT NULL,
TeacherEmail VARCHAR(20) NOT NULL,
TeacherPassword VARCHAR(60) NOT NULL,
TeacherName VARCHAR(16) NOT NULL,
TeacherGender VARCHAR(20),
TeacherSubject VARCHAR(20)
);

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
CourseId INT,
FOREIGN KEY(CourseId) REFERENCES Course(CourseId)
);

CREATE TABLE Student(
StudentRoNo VARCHAR(20) PRIMARY KEY NOT NULL,
StudentPassword VARCHAR(60) NOT NULL,
StudentMobile VARCHAR(11) NOT NULL,
StudentEmail VARCHAR(20) NOT NULL,
StudentName VARCHAR(6) NOT NULL,
StudentGender VARCHAR(2),
StudentPhoto VARCHAR(30),
ClazzId INT,
FOREIGN KEY(ClazzId) REFERENCES Clazz(ClazzId)
);
-- 学生&&学科考勤信息
CREATE TABLE StudentInfo(
StudentInfoId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
StudentRoNo VARCHAR(20) NOT NULL,
CourseId INT NOT NULL, 
SignIn INT,
ComeLate INT,
LeaveEarlier INT, 
Absenteeism INT,
FOREIGN KEY(StudentRoNo) REFERENCES Student(StudentRoNo),
FOREIGN KEY(CourseId) REFERENCES Course(CourseId)
);

CREATE TABLE LogEntity(
LogId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
UserId VARCHAR(50),
Module VARCHAR(30),
Method VARCHAR(30),
ReponseTime VARCHAR(30),
Ip VARCHAR(30),
Date VARCHAR(30),
Commite text
);
-- 学生签到时先存到这个表里面，到时间再存到info中间表
CREATE TABLE QrTem(
QrTemId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
CourseId INT,
StudentRoNo VARCHAR(20),
QrTime VARCHAR(20)
);

CREATE TABLE Admin(
AdminId VARCHAR(10) NOT NULL PRIMARY KEY,
AdminPassword VARCHAR(20) NOT NULL
);
INSERT INTO Admin(AdminId,AdminPassword) VALUES('1185547466','111111');




select * from LogEntity order by LogId desc limit 0,10





SELECT * from Teacher;
SELECT * from Student;
SELECT * from Clazz;
SELECT * FROM Course;
select * from StudentInfo;
SELECT * FROM QrTem;
SELECT * FROM Admin
SELECT * FROM LogEntity ORDER BY LogId DESC;
select * from QrTem where CourseId = 19 And QrTime = '2017-10-29'
SELECT * FROM Student s JOIN Clazz c JOIN Course cc ON s.ClazzId = c.ClazzId 
	AND c.CourseId = cc.CourseId AND cc.CourseId = 19
SELECT * from StudentInfo s,Student i WHERE s.StudentRoNo = i.StudentRoNo AND s.CourseId = 24

SELECT COUNT(*) FROM Student s ,Clazz c WHERE c.ClazzId = '39' AND s.ClazzId = c.ClazzId

SELECT StudentRoNo FROM Student s JOIN Clazz c JOIN Course cc ON s.ClazzId = c.ClazzId 
AND c.CourseId = cc.CourseId AND cc.CourseId = 19


DROP TABLE StudentInfo;
DROP TABLE Student;
DROP TABLE Clazz;
DROP TABLE Course;
DROP TABLE Teacher;
Drop table QrTem;
DROP TABLE Logentity;


