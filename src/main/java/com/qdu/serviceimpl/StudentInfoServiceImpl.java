package com.qdu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qdu.dao.StudentInfoDao;
import com.qdu.pojo.StudentInfo;
import com.qdu.service.StudentInfoService;

@Transactional
@Service
public class StudentInfoServiceImpl implements StudentInfoService{
	
	@Autowired
	private StudentInfoDao studentInfoDaoImpl;

	@Override
	public void insertStudentInfo(String studentRoNo,int courseId) {
		studentInfoDaoImpl.insertStudentInfo(studentRoNo,courseId);
	}

	@Override
	public void deleteStudentInfoByCourse(int courseId) {		
		studentInfoDaoImpl.deleteStudentInfoByCourse(courseId);
	}

	@Override
	public StudentInfo selectStudentInfoByMany(String studentRoNo, int courseId) {
		return studentInfoDaoImpl.selectStudentInfoByMany(studentRoNo, courseId);
	}

	@Override
	public void updateStudentInfoAboutSignIn(int studentInfoId, int signIn) {
		studentInfoDaoImpl.updateStudentInfoAboutSignIn(studentInfoId, signIn);
	}
	

}
