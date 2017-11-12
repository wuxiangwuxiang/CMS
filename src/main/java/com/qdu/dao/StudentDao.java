package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Course;
import com.qdu.pojo.Student;

public interface StudentDao {
	
	public void insertStudentByNo(Student student);
	 
	public Student selectStudentByNo(String studentRoNo);
	 
	public List<Student> selectStudentByClazzId(int clazzId);
	
	public void updateStudentOfClazzId(String studentRoNo,int clazzId);
	
	public Student selectStudentAndClazzByNo(String studentRoNo);
	
	public void updateStudentPassWord(Student student);
	
	public void ajaxupdateStudentPassWord(String studentRoNo,String studentPassword);
	
	public Student selectStudentByFour(String studentRoNo,String studentName,String studentMobile,String studentEmail);
	
	public int changeStuMail(String studentRoNo,String studentEmail);
	
	public int updateStudentextra(Student student);
	
 
}
