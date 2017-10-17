package com.qdu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qdu.dao.StudentDao;
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
}
