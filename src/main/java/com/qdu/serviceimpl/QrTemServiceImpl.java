package com.qdu.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.QrTemDao;
import com.qdu.pojo.QrTem;
import com.qdu.service.QrTemService;

@Transactional
@Service
public class QrTemServiceImpl implements QrTemService{

	@Autowired private QrTemDao qrTemDaoImpl;
	
	@Override
	public void insertQrTem(QrTem qrTem) {		
		qrTemDaoImpl.insertQrTem(qrTem);
	}

	@Override
	public List<QrTem> selectQrTemByCourseIdAndTime(int courseId, String qrTime) {
		return qrTemDaoImpl.selectQrTemByCourseIdAndTime(courseId, qrTime);
	}

	@Override
	public QrTem selectTemQrById(int qrTemId) {
		return qrTemDaoImpl.selectTemQrById(qrTemId);
	}

	@Override
	public void deleteTemQrById(int qrTemId) {
		qrTemDaoImpl.deleteTemQrById(qrTemId);
	}

	@Override
	public QrTem selectQrTemByStuNoAndCourseId(String studentRoNo, int courseId) {
		return qrTemDaoImpl.selectQrTemByStuNoAndCourseId(studentRoNo, courseId);
	}

	@Override
	public int deleteQrTemByCourseId(int courseId) {
		return qrTemDaoImpl.deleteQrTemByCourseId(courseId);
	}

}
