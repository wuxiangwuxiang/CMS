package com.qdu.service;

import com.qdu.pojo.Student;

public interface StudentService {

	public void insertStudentByNo(Student student);
	 
	public Student selectStudentByNo(String studentRoNo);

}
