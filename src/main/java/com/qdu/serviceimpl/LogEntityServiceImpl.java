package com.qdu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.LogEntityDao;
import com.qdu.pojo.LogEntity;
import com.qdu.service.LogEntityService;

@Transactional
@Service
public class LogEntityServiceImpl implements LogEntityService{

	@Autowired LogEntityDao logEntityDaoImpl;
	
	@Override
	public void saveLog(LogEntity logEntity) {
		logEntityDaoImpl.saveLog(logEntity);
	}

}
