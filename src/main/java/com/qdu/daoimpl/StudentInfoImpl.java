package com.qdu.daoimpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.StudentInfoDao;
import com.qdu.pojo.StudentInfo;

@Repository
public class StudentInfoImpl implements StudentInfoDao{
	
	@Autowired  
	SqlSessionFactory sessionFactory;

	@Override
	public void insertStudentInfo(String studentRoNo,int courseId) {
		HashMap<String, Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.StudentInfoMapping.insertStudentInfo";	
		map.put("studentRoNo", studentRoNo);
		map.put("courseId", courseId);
		sessionFactory.openSession().insert(statement, map);
	}

}
