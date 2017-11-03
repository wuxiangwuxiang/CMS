package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.StudentDao;
import com.qdu.pojo.Student;
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
	public void updateStudentPassWord(String studentRoNo, String studentPassword) {
		String statement = "com.qdu.mapping.StudentMapping.updateStudentPassWord";
		Map<String, Object> map = new HashMap<>();
		map.put("studentRoNo", studentRoNo);
		map.put("studentPassword", studentPassword);
		sessionFactory.openSession().update(statement, map);
	}

}
