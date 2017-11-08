package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Message;

public interface MessageDao {
	
	public void insertMessage(Message message);
	
	public int selectMessageCount(String messageAccepter);
	
	public List<Message> selectUnreadMessage(String messageAccepter);
	
	public Message selectMessageById(int messageId);
	
	public void uodateMesageHaveread(int messageId);

}
