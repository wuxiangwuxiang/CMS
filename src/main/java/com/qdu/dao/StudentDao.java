package com.qdu.dao;

import java.util.List;
import com.qdu.pojo.Student;

public interface StudentDao {
	
	public void insertStudentByNo(Student student);
	
	public Student selectStudentByNo(String studentRoNo);
	
	public List<Student> selectStudentByClazzId(int clazzId);
	
	public void updateStudentOfClazzId(String studentRoNo,int clazzId);
	
	public Student selectStudentAndClazzByNo(String studentRoNo);
	
	public void updateStudentPassWord(String studentRoNo,String studentPassword);
 
}
