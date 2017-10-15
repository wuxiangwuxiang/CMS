package com.qdu.daoimpl;

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
	
}
