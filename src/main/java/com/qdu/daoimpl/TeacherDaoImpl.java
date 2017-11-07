package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.Map;

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


	@Override
	public void updateTeacherPassWord(String teacherMobile,String teacherPassword) {
		String statement = "com.qdu.mapping.TeacherMapping.updateTeacherPassWord";
		Map<String, Object> map = new HashMap<>();
		map.put("teacherMobile", teacherMobile);
		map.put("teacherPassword", teacherPassword);
		sessionFactory.openSession().update(statement, map);
	}


	@Override
	public Teacher selecctTeacherByThree(String teacherMobile, String teacherName, String teacherEmail) {
		String statement = "com.qdu.mapping.TeacherMapping.selecctTeacherByThree";
		Map<String, Object> map = new HashMap<>();
		map.put("teacherMobile", teacherMobile);
		map.put("teacherName", teacherName);
		map.put("teacherEmail", teacherEmail);
		return sessionFactory.openSession().selectOne(statement, map);
	}


	@Override
	public void changeTeaMail(String teacherMobile, String teacherEmail) {
		String statement = "com.qdu.mapping.TeacherMapping.changeTeaMail";
		Map<String, Object> map = new HashMap<>();
		map.put("teacherMobile", teacherMobile);
		map.put("teacherEmail", teacherEmail);
	    sessionFactory.openSession().update(statement, map);
	}

}
