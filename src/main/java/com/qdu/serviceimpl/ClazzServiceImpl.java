package com.qdu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.ClazzDao;
import com.qdu.pojo.Clazz;
import com.qdu.service.ClazzService;

@Transactional
@Service
public class ClazzServiceImpl implements ClazzService{

	@Autowired
	private ClazzDao clazzDaoImpl;
	@Override
	public void insertClazz(Clazz clazz) {
		clazzDaoImpl.insertClazz(clazz);
	}

}
