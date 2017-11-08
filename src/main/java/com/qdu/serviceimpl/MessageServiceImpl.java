package com.qdu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.MessageDao;
import com.qdu.pojo.Message;
import com.qdu.service.MessageService;

@Service
@Transactional 
public class MessageServiceImpl implements MessageService{
     
	@Autowired private MessageDao messageDaoImpl;
	 
	@Override
	public void insertMessage(Message message) {
		messageDaoImpl.insertMessage(message);
	}

	@Override
	public int selectMessageCount(String messageAccepter) {
		return messageDaoImpl.selectMessageCount(messageAccepter);
	}

	@Override
	public List<Message> selectUnreadMessage(String messageAccepter ,int startPos) {
		return messageDaoImpl.selectUnreadMessage(messageAccepter, startPos);
	}

	@Override
	public Message selectMessageById(int messageId) {
		return messageDaoImpl.selectMessageById(messageId);
	}

	@Override
	public void uodateMesageHaveread(int messageId) {
		messageDaoImpl.uodateMesageHaveread(messageId);
	}

	@Override
	public int selectMessageTotalCount(String messageAccepter) {
		return messageDaoImpl.selectMessageTotalCount(messageAccepter);
	}

}
