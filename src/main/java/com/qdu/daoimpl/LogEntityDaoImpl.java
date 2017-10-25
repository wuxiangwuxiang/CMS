package com.qdu.daoimpl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.LogEntityDao;
import com.qdu.pojo.LogEntity;

@Repository
public class LogEntityDaoImpl implements LogEntityDao{

	@Autowired private SqlSessionFactory sessionFactory;
	
	@Override
	public void saveLog(LogEntity logEntity) {
		String statement="com.qdu.mapping.LogEntityMapping.insertLogEntity";
		sessionFactory.openSession().insert(statement,logEntity);
	}

}
