package com.qdu.daoimpl;

import java.util.List;

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

	@Override
	public List<LogEntity> selectLog() {
		String statement = "com.qdu.mapping.LogEntityMapping.selectLog";
		return sessionFactory.openSession().selectList(statement);
	}

}
