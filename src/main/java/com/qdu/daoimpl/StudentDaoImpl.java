package com.qdu.daoimpl;

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

}
