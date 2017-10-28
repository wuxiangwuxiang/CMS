package com.qdu.dao;

import java.util.Date;
import java.util.List;

import com.qdu.pojo.QrTem;

public interface QrTemDao {
	
	public void insertQrTem(QrTem qrTem);
	
	public List<QrTem> selectQrTemByCourseIdAndTime(int courseId,String qrTime);
	
	public QrTem selectTemQrById(int qrTemId);
	
	public void deleteTemQrById(int qrTemId);

}
