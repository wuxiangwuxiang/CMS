package com.qdu.service;

import java.util.List;

import com.qdu.pojo.Message;

public interface MessageService {

	public void insertMessage(Message message);
	
	public int selectMessageCount(String messageAccepter);
	
	public List<Message> selectUnreadMessage(String messageAccepter ,int startPos);
	 
	public Message selectMessageById(int messageId);
	
	public void uodateMesageHaveread(int messageId);
	
	public int selectMessageTotalCount(String messageAccepter);
}
