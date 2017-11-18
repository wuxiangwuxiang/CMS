package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Admin;
import com.qdu.pojo.LogEntity;

public interface LogEntityDao {
	
	public Admin selectAdminById(String adminId);
	
	public void saveLog(LogEntity logEntity);
	  
	public List<LogEntity> selectLog(int startPos);
	
	public int selectLogEntityCount();
	
	public List<LogEntity> selectStudentLog(String userId);
	
	public List<LogEntity> selectStudentLogByTime(String userId,String dateTime,String coreKey);

}
 