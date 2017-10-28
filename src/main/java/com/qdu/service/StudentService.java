package com.qdu.service;

import java.util.List;

import com.qdu.pojo.Student;

public interface StudentService {

	public void insertStudentByNo(Student student);
	 
	public Student selectStudentByNo(String studentRoNo);
	
	public List<Student> selectStudentByClazzId(int clazzId);
	
	public void updateStudentOfClazzId(String studentRoNo, int clazzId);
	
	public Student selectStudentAndClazzByNo(String studentRoNo);

}
