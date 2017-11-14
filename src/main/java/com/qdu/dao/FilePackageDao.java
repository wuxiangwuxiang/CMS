package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.FilePackage;

public interface FilePackageDao {
	
	public int insertFile(FilePackage filePackage);
	
	public List<FilePackage> selectFileByUserId(String userId);

}
