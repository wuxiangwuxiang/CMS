package com.qdu.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.FilePackageDao;
import com.qdu.pojo.FilePackage;

@Repository
public class FilePackageDaoImpl implements FilePackageDao{
	@Autowired private SqlSessionFactory sqlSessionFactory;

	@Override
	public int insertFile(FilePackage filePackage) {
		String statement = "com.qdu.mapping.FilePackageMapping.insertFile";
		return sqlSessionFactory.openSession().insert(statement, filePackage);
	}

	@Override
	public List<FilePackage> selectFileByUserId(String userId) {
		String statement = "com.qdu.mapping.FilePackageMapping.selectFileByUserId";
		return sqlSessionFactory.openSession().selectList(statement, userId);
	}
	
	

}
