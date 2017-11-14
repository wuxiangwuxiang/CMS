package com.qdu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.FilePackageDao;
import com.qdu.pojo.FilePackage;
import com.qdu.service.FilePackageService;

@Transactional
@Service
public class FilePackageServiceImpl implements FilePackageService{

	@Autowired private FilePackageDao filePackageDaoImpl;

	@Override
	public int insertFile(FilePackage filePackage) {
		return filePackageDaoImpl.insertFile(filePackage);
	}

	@Override
	public List<FilePackage> selectFileByUserId(String userId) {
		return filePackageDaoImpl.selectFileByUserId(userId);
	}
	
	
}
