package com.qdu.daoimpl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.TeacherDao;
import com.qdu.pojo.Teacher;

@Repository
public class TeacherDaoImpl implements TeacherDao{
	@Autowired 
	SqlSessionFactory sessionFactory;
	
	@Override
	public void insertTeacher(Teacher teacher) {
		String statement = "com.qdu.mapping.TeacherMapping.insertTeacher";
		sessionFactory.openSession().insert(statement,teacher);
	}


	@Override
	public Teacher selectTeacherByEmail(String teacherMobile) {
		String statement = "com.qdu.mapping.TeacherMapping.selectTeacherByEmail";
		return sessionFactory.openSession().selectOne(statement, teacherMobile);
	}

}
