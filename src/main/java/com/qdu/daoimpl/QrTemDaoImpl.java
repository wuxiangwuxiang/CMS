package com.qdu.daoimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.qdu.dao.QrTemDao;
import com.qdu.pojo.QrTem;

@Repository
public class QrTemDaoImpl implements QrTemDao{
	
	@Autowired private SqlSessionFactory sqlSessionFactory;

	@Override
	public void insertQrTem(QrTem qrTem) {
		String statement = "com.qdu.mapping.QrTemMapping.insertQrTem";
		sqlSessionFactory.openSession().insert(statement, qrTem);
	}

	@Override
	public List<QrTem> selectQrTemByCourseIdAndTime(int courseId, String qrTime) {
		String statement = "com.qdu.mapping.QrTemMapping.selectQrTemByCourseIdAndTime";
		Map<String, Object> map = new HashMap<>();
		map.put("courseId", courseId);
		map.put("qrTime", qrTime);
		return sqlSessionFactory.openSession().selectList(statement, map);
	}

	@Override
	public QrTem selectTemQrById(int qrTemId) {
		String statement = "com.qdu.mapping.QrTemMapping.selectTemQrById";
		return sqlSessionFactory.openSession().selectOne(statement, qrTemId);
	}

	@Override
	public void deleteTemQrById(int qrTemId) {
		String statement = "com.qdu.mapping.QrTemMapping.deleteTemQrById";
		sqlSessionFactory.openSession().delete(statement, qrTemId);
	}

}
