package com.qdu.daoimpl;


import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.qdu.dao.TestDao;
import com.qdu.pojo.Course;
import com.qdu.pojo.Teacher;
import com.qdu.pojo.Test;

@Repository
public class TestDaoImpl implements TestDao{
	@Autowired SqlSessionFactory sessionFactory;
	
	@Override
	public Test getTestById(int id) {
		String statement = "com.qdu.mapping.TestMapping.selectFromTestById";
		return sessionFactory.openSession().selectOne(statement, id);
	}

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
