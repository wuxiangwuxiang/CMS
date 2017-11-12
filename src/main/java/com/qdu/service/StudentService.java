package com.qdu.service;

import java.util.List;

import com.qdu.pojo.Message;
import com.qdu.pojo.Student;

public interface StudentService {

	public void insertStudentByNo(Student student);
	 
	public Student selectStudentByNo(String studentRoNo); 
	
	public List<Student> selectStudentByClazzId(int clazzId);
	
	public void updateStudentOfClazzId(String studentRoNo, int clazzId);
	
	public Student selectStudentAndClazzByNo(String studentRoNo);
	 
	public void updateStudentPassWord(Student student);
	
	public Student selectStudentByFour(String studentRoNo, String studentName, String studentMobile,
			String studentEmail);
	
	public void ajaxupdateStudentPassWord(String studentRoNo,String studentPassword);
	
	public int changeStuMail(String studentRoNo, String studentEmail);
	
	public int updateStudentextra(Student student);
		

}
