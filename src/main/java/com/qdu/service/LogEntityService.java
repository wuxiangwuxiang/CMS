package com.qdu.service;

import java.util.List;

import com.qdu.pojo.LogEntity;

public interface LogEntityService {
	
	public void saveLog(LogEntity logEntity);
	
	public List<LogEntity> selectLog();

}
 