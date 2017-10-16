package com.qdu.dao;

import com.qdu.pojo.Student;

public interface StudentDao {
	
	public void insertStudentByNo(Student student);
	
	public Student selectStudentByNo(String studentRoNo);

}
