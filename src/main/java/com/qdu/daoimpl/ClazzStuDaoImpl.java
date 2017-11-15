package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.ClazzStuDao;
import com.qdu.pojo.ClazzStu;

@Repository
public class ClazzStuDaoImpl implements ClazzStuDao{

	@Autowired private SqlSessionFactory SqlSessionFactory;
	
	@Override
	public int insertClazzStu(ClazzStu clazzStu) {
		String statement = "com.qdu.mapping.ClazzStuMapping.insertClazzStu";
		return SqlSessionFactory.openSession().insert(statement, clazzStu);
	}

	@Override
	public List<ClazzStu> selectClazzStuById(int clazzId) {
		String statement = "com.qdu.mapping.ClazzStuMapping.selectClazzStuById";
		return SqlSessionFactory.openSession().selectList(statement, clazzId);
	}

	@Override
	public int deleteClazzStuByClazzId(int clazzId) {
		String statement = "com.qdu.mapping.ClazzStuMapping.deleteClazzStuByClazzId";
		return SqlSessionFactory.openSession().delete(statement, clazzId);
	}

	@Override
	public ClazzStu selectClazzStuByDouble(int clazzId, String studentRoNo) {
		String statement = "com.qdu.mapping.ClazzStuMapping.selectClazzStuByDouble";
		Map<String, Object> map = new HashMap<>();
		map.put("clazzId", clazzId);
		map.put("studentRoNo", studentRoNo);
		return SqlSessionFactory.openSession().selectOne(statement, map);
	}

}
