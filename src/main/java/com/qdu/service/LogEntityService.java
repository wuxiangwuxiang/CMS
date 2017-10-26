package com.qdu.service;

import java.util.List;

import com.qdu.pojo.Admin;
import com.qdu.pojo.LogEntity;

public interface LogEntityService {
	
	public Admin selectAdminById(String adminId);
	
	public void saveLog(LogEntity logEntity);
	
	public List<LogEntity> selectLog();

}
  