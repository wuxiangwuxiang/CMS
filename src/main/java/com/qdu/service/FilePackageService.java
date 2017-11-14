package com.qdu.service;

import java.util.List;

import com.qdu.pojo.FilePackage;

public interface FilePackageService {
	
	public int insertFile(FilePackage filePackage);
	
	public List<FilePackage> selectFileByUserId(String userId);

}
