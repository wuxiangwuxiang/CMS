package com.qdu.serviceimpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qdu.dao.TestDao;
import com.qdu.pojo.Course;
import com.qdu.pojo.Teacher;
import com.qdu.pojo.Test;
import com.qdu.service.TestService;
@Transactional
@Service
public class TestServiceImpl implements TestService{
	@Autowired
	private TestDao testDaoImpl;
 
	@Override
	public Test selectTestById(int id) {
		System.out.println("serviceImpl");
		return testDaoImpl.getTestById(id);
	}

	@Override
	public void insertTeacher(Teacher teacher) {
		testDaoImpl.insertTeacher(teacher);
	}



	@Override
	public Teacher selectTeacherByEmail(String teacherMobile) {
		return testDaoImpl.selectTeacherByEmail(teacherMobile);
	}

	

}
