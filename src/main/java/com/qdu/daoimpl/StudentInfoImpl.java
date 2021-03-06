package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.StudentInfoDao;
import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;

@Repository
public class StudentInfoImpl implements StudentInfoDao{
	
	@Autowired  
	SqlSessionFactory sessionFactory;

	@Override
	public void insertStudentInfo(String studentRoNo,int courseId) {
		HashMap<String, Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.StudentInfoMapping.insertStudentInfo";	
		map.put("studentRoNo", studentRoNo);
		map.put("courseId", courseId);
		sessionFactory.openSession().insert(statement, map);
	}

	@Override
	public void deleteStudentInfoByCourse(int courseId) {
		String statement = "com.qdu.mapping.StudentInfoMapping.deleteStudentInfoByCourse";
		sessionFactory.openSession().delete(statement, courseId);
	}

	@Override
	public StudentInfo selectStudentInfoByMany(String studentRoNo, int courseId) {
		String statement = "com.qdu.mapping.StudentInfoMapping.selectStudentInfoByMany";
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("courseId", courseId);
		return sessionFactory.openSession().selectOne(statement, map);
	}

	@Override
	public void updateStudentInfoAboutSignIn(int studentInfoId, int signIn) {
		String statement = "com.qdu.mapping.StudentInfoMapping.updateStudentInfoAboutSignIn";
		Map<String, Object> map = new HashMap<>();
		map.put("studentInfoId", studentInfoId);
		map.put("signIn", signIn);
		sessionFactory.openSession().update(statement, map);
	}

	@Override
	public List<StudentInfo> selectInfoList(int courseId) {
		String statement = "com.qdu.mapping.StudentInfoMapping.selectInfoList";
		return sessionFactory.openSession().selectList(statement, courseId);
	}

	@Override
	public void updateStudentInfoAboutAbs(int studentInfoId, int absenteeism) {
		String statement = "com.qdu.mapping.StudentInfoMapping.updateStudentInfoAboutAbs";
		Map<String, Object> map = new HashMap<>();
		map.put("studentInfoId", studentInfoId);
		map.put("absenteeism", absenteeism);
		sessionFactory.openSession().update(statement, map);
	}

	@Override
	public List<StudentInfo> selectInfoFromInfoAndStudent(int courseId) {
		String statement = "com.qdu.mapping.StudentInfoMapping.selectInfoFromInfoAndStudent";
		return sessionFactory.openSession().selectList(statement, courseId);
	}
	
	@Override
	public List<StudentInfo> selectCourseByStudentRono(String studentRoNo) {
		String statement = "com.qdu.mapping.StudentInfoMapping.selectCourseByStudentRono";
		return sessionFactory.openSession().selectList(statement,studentRoNo);
	}

	@Override
	public List<StudentInfo> selectStudentInfoList(String studentRoNo) {
		String statement = "com.qdu.mapping.StudentInfoMapping.selectStudentInfoList";
		return sessionFactory.openSession().selectList(statement,studentRoNo);
	}

}
