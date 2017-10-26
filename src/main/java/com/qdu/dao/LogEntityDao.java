package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.LogEntity;

public interface LogEntityDao {
	public void saveLog(LogEntity logEntity);
	 
	public List<LogEntity> selectLog();

}
