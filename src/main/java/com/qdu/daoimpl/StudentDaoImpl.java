package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.MessageDao;
import com.qdu.dao.StudentDao;
import com.qdu.pojo.Message;
import com.qdu.pojo.Student;
import com.qdu.util.MD5Util;
@Repository
public class StudentDaoImpl implements StudentDao{
	@Autowired   
	SqlSessionFactory sessionFactory;
	
	@Override 
	public void insertStudentByNo(Student student) {
		String statement = "com.qdu.mapping.StudentMapping.insertStudentByNo";
		sessionFactory.openSession().insert(statement, student);
	}

	@Override
	public Student selectStudentByNo(String studentRoNo) {
		String statement = "com.qdu.mapping.StudentMapping.selectStudentByNo";
		return sessionFactory.openSession().selectOne(statement, studentRoNo);
	}

	@Override
	public List<Student> selectStudentByClazzId(int clazzId) {
		String statement = "com.qdu.mapping.StudentMapping.selectStudentByClazzId";
		return sessionFactory.openSession().selectList(statement, clazzId);
	}

	@Override
	public void updateStudentOfClazzId(String studentRoNo, int clazzId) {
		HashMap<String, Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.StudentMapping.updateStudentOfClazzId";
		map.put("studentRoNo", studentRoNo);
		map.put("clazzId", clazzId);
		sessionFactory.openSession().update(statement, map);
	}

	@Override
	public Student selectStudentAndClazzByNo(String studentRoNo) {
		String statement = "com.qdu.mapping.StudentMapping.selectStudentAndClazzByNo";
		return sessionFactory.openSession().selectOne(statement, studentRoNo);
	}

	@Override
	public void updateStudentPassWord(Student student) {
		String statement = "com.qdu.mapping.StudentMapping.updateStudentPassWord";
		String studentRoNo = student.getStudentRoNo();
		String studentPassword = student.getStudentPassword();
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("studentPassword", MD5Util.md5(studentPassword, "juin"));
		sessionFactory.openSession().update(statement, map);
	}

	@Override
	public Student selectStudentByFour(String studentRoNo, String studentName, String studentMobile,
			String studentEmail) {
		String statement = "com.qdu.mapping.StudentMapping.selectStudentByFour";
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("studentName", studentName);
		map.put("studentMobile", studentMobile);
		map.put("studentEmail", studentEmail);
		return sessionFactory.openSession().selectOne(statement,map);
	}

	@Override
	public void ajaxupdateStudentPassWord(String studentRoNo, String studentPassword) {
		String statement = "com.qdu.mapping.StudentMapping.updateStudentPassWord";
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("studentPassword", MD5Util.md5(studentPassword, "juin"));
		sessionFactory.openSession().update(statement, map);
	}
 
	@Override 
	public int changeStuMail(String studentRoNo, String studentEmail) {
		String statement = "com.qdu.mapping.StudentMapping.changeStuMail";
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("studentEmail", studentEmail);
		return sessionFactory.openSession().update(statement, map);
	}

	@Override
	public int updateStudentextra(Student student) {
		String statement = "com.qdu.mapping.StudentMapping.updateStudentextra";
		return sessionFactory.openSession().update(statement, student);
		
	}



}
