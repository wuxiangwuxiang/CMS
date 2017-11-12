package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.ClazzDao;
import com.qdu.pojo.Clazz;

@Repository
public class ClazzDaoImpl implements ClazzDao{

	@Autowired
	
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public void insertClazz(Clazz clazz) {
		String statement = "com.qdu.mapping.ClazzMapping.insertClazz";
		sqlSessionFactory.openSession().insert(statement, clazz);
	}

	@Override
	public Clazz selectClazzByAll(String clazzName, String teacherMobile, int currentYear) {
		Map<String,Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.ClazzMapping.selectClazzByAll";
		map.put("clazzName", clazzName);
		map.put("teacherMobile", teacherMobile);
		map.put("currentYear", currentYear);
		return sqlSessionFactory.openSession().selectOne(statement, map);
	} 

	@Override
	public void updateClazzOfCourseId(int clazzId, int courseId) {
		Map<String,Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.ClazzMapping.updateClazzOfCourseId";
		map.put("clazzId", clazzId);
		map.put("courseId", courseId);
		sqlSessionFactory.openSession().update(statement, map);
	}

	@Override
	public List<Clazz> selectClazzByCourse(int courseId) {
		String statement = "com.qdu.mapping.ClazzMapping.selectClazzByCourse";
		return sqlSessionFactory.openSession().selectList(statement, courseId);
	}

	@Override
	public List<Clazz> clazzListByClazzId(int courseId) {
		String statement = "com.qdu.mapping.ClazzMapping.clazzListByClazzId";
		return sqlSessionFactory.openSession().selectList(statement, courseId);
	}

	@Override
	public void updateClazzByCourseId(int clazzId) {
		String statement = "com.qdu.mapping.ClazzMapping.updateClazzByCourseId";
		sqlSessionFactory.openSession().update(statement, clazzId);
	}

	@Override
	public void updateClazzByClazzId(int clazzId,String clazzName) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("clazzId", clazzId);
		map.put("clazzName", clazzName);
		String statement = "com.qdu.mapping.ClazzMapping.updateClazzByClazzId";
		sqlSessionFactory.openSession().update(statement, map);
	}

	@Override
	public Clazz selectClazzById(int clazzId) {
		String statement = "com.qdu.mapping.ClazzMapping.selectClazzById";
		return sqlSessionFactory.openSession().selectOne(statement, clazzId);
	}

	@Override
	public void deleteClazzById(int clazzId) {
		String statement = "com.qdu.mapping.ClazzMapping.deleteClazzById";
		sqlSessionFactory.openSession().delete(statement, clazzId);
	}

	@Override
	public int selectCountOfStudentByClazz(int clazzId) {
		String statement = "com.qdu.mapping.ClazzMapping.selectCountOfStudentByClazz";
		return sqlSessionFactory.openSession().selectOne(statement, clazzId);
	}

	@Override
	public List<Clazz> selectClazzNameByCourse(int courseId) {
		String statement = "com.qdu.mapping.ClazzMapping.selectClazzNameByCourse";
		return sqlSessionFactory.openSession().selectList(statement, courseId);
	}
	
}
