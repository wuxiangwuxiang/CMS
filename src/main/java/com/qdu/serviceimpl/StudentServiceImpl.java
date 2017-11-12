package com.qdu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qdu.dao.StudentDao;
import com.qdu.pojo.Message;
import com.qdu.pojo.Student;
import com.qdu.service.StudentService;

@Transactional
@Service 
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentDao studentDaoImpl;
	  
	@Override
	public void insertStudentByNo(Student student) {
		studentDaoImpl.insertStudentByNo(student);
	}

	@Override
	public Student selectStudentByNo(String studentRoNo) {
		return studentDaoImpl.selectStudentByNo(studentRoNo);
	}

	@Override
	public List<Student> selectStudentByClazzId(int clazzId) {
		return studentDaoImpl.selectStudentByClazzId(clazzId);
	}

	@Override
	public void updateStudentOfClazzId(String studentRoNo, int clazzId) {
		studentDaoImpl.updateStudentOfClazzId(studentRoNo, clazzId);
	}

	@Override
	public Student selectStudentAndClazzByNo(String studentRoNo) {
		return studentDaoImpl.selectStudentAndClazzByNo(studentRoNo);
	}

	@Override
	public void updateStudentPassWord(Student student) {
		studentDaoImpl.updateStudentPassWord(student);
	}

	@Override
	public Student selectStudentByFour(String studentRoNo, String studentName, String studentMobile,
			String studentEmail) {
		return studentDaoImpl.selectStudentByFour(studentRoNo, studentName, studentMobile, studentEmail);
	}

	@Override
	public void ajaxupdateStudentPassWord(String studentRoNo, String studentPassword) {
		studentDaoImpl.ajaxupdateStudentPassWord(studentRoNo, studentPassword);
	} 

	@Override
	public int changeStuMail(String studentRoNo, String studentEmail) {
		return studentDaoImpl.changeStuMail(studentRoNo, studentEmail);
	}
 
	@Override
	public int updateStudentextra(Student student) {
		return studentDaoImpl.updateStudentextra(student);
	}

	


	
}
